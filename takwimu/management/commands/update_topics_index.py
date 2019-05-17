from bs4 import BeautifulSoup

from django.conf import settings
from django.core.management import call_command
from django.core.management.base import BaseCommand, CommandError
from django.utils.text import slugify

from selenium import webdriver

from takwimu.models import ProfileSectionPage, ProfilePage
from takwimu.models.data import ProfileData
from takwimu.models.utils.search import get_widget_data, get_page_details
from takwimu.search.takwimu_search import TakwimuTopicSearch
from takwimu.utils.helpers import COUNTRIES


class Command(BaseCommand):
    help = 'Index Takwimu (analysis & data) content'

    def handle(self, *args, **options):
        topic_search = TakwimuTopicSearch()
        topic_search.reset_index()

        self.stdout.write(f"{topic_search.es_index}: Starting rebuild (Ensure that the server is running on port 8000)")
        self.index_hurumap(topic_search)
        self.index_topics(ProfileSectionPage.objects.live(), topic_search)
        self.index_topics(ProfilePage.objects.live(), topic_search)

        return call_command('update_index')

    def index_topics(self, queryset, search_backend):
        for i in queryset:
            country, category, parent_page_type = get_page_details(i)

            parent_page_id = i.id

            for topic in i.body.stream_data:
                topic_id = topic['id']
                title = topic['value'].get('title', '')
                topic_summary = topic['value'].get('summary', '')
                topic_body = topic['value'].get('body', '')
                for k in topic_body:
                    if k['type'] == 'text':
                        text = k.get('value', '')
                        body = '\n'.join([topic_summary, text])
                        metadata = ''

                        _, outcome = search_backend.add_to_index(
                            content_id=topic_id, content_type='topic',
                            country=country, category=category, title=title,
                            body=body, metadata=metadata,
                            parent_page_id=parent_page_id,
                            parent_page_type=parent_page_type,
                            result_type='Analysis', summary=topic_summary)
                        self.stdout.write(f"{topic_search.es_index}: Indexing topic {topic_id} -> {outcome}")

                    elif k['type'] == 'indicator':
                        indicator = k.get('value', [])
                        indicator_summary = k.get('summary', '')
                        for widget in indicator['widget']:
                            data = get_widget_data(widget)
                            if data:
                                _, outcome = search_backend.add_to_index(
                                    content_id=data['id'],
                                    content_type='indicator_widget',
                                    country=country, category=category,
                                    title=(data['title'] or 'NULL'), body=data['body'],
                                    metadata=data['metadata'],
                                    parent_page_id=parent_page_id,
                                    parent_page_type=parent_page_type,
                                    result_type='Data', summary=indicator_summary)
                                self.stdout.write(f"{topic_search.es_index}: Indexing widget {data['id']} -> {outcome}")

    def index_hurumap(self, search_backend):
        options = webdriver.ChromeOptions()
        options.add_argument('headless')
        # chrome can not be run as root, which is the case in docker
        options.add_argument('no-sandbox')
        options.add_argument('disable-gpu')
        browser = webdriver.Chrome(options=options)

        server_url = settings.HURUMAP.get('url', 'localhost:8000')

        if server_url.endswith('/'):
            # remove trailing slash
            server_url = server_url[:-1]

        # clean out profleData DB
        ProfileData.objects.all().delete()

        for code, detail in COUNTRIES.items():
            country = detail.get('name')
            url = f"profiles/country-{code}-{slugify(country)}"
            self.stdout.write(
                f"{search_backend.es_index}: Searching {code} @ {server_url}/{url} ... ")
            browser.get(f"{server_url}/{url}")
            soup = BeautifulSoup(browser.page_source, 'lxml')
            visualizations = soup.find_all('div', {
                'class': ['column-full', 'column-half', 'column-three-quarters',
                          'column-quarter']})
            self.stdout.write(
                f"{search_backend.es_index}: Found {len(visualizations)} possible HURUmap charts")
            for viz in visualizations:
                # For our sanity, we'll only consider a div to be a chart if
                # it has `data-id` and `data-chart-title`
                data_id = viz.get('data-id')
                data_chart_title = viz.get('data-chart-title')
                if data_id and data_chart_title:
                    labels = ' '.join(
                        [i.text for i in viz.select('span.x.axis.label')])

                    qualifiers = ' '.join(
                        [i.text for i in
                         viz.find_all('span', class_=['chart-qualifier'])])

                    id = viz['id']
                    content_id = f"{country}-{id}"
                    link = f"/{url}#{id}"

                    _, index_outcome = search_backend.add_to_index(content_id=content_id,
                                                             content_type='HURUmap',
                                                             country=country,
                                                             category='',
                                                             title=data_chart_title,
                                                             body=f"{labels} {qualifiers}",
                                                             metadata='',
                                                             parent_page_id=None,
                                                             parent_page_type=None,
                                                             result_type='Data',
                                                             link=link)
                    self.stdout.write(
                        f"{search_backend.es_index}: Indexed HURUmap Chart {code}|{data_id} -> {index_outcome}")

                    # id is unique per country/geography level
                    profile_data_id = f"{code}_{data_id}"
                    chart_id_parts = id.split('-')
                    data_stat_type = viz['data-stat-type']
                    chart_height = viz.get('chart_height')
                    _, upsert_outcome = ProfileData.objects.update_or_create(id=profile_data_id,
                        defaults={
                            'country_iso_code': code,
                            'chart_id': f"{chart_id_parts[2]}-{chart_id_parts[3]}",
                            'chart_title': data_chart_title,
                            'chart_type': chart_id_parts[1],
                            'data_stat_type': data_stat_type,
                            'chart_height': chart_height
                    });
                    self.stdout.write(
                        f"{search_backend.es_index}: Created HURUmap Data {code}|{data_id} -> {upsert_outcome}")

        browser.quit()
