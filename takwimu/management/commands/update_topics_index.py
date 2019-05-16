from bs4 import BeautifulSoup
from django.conf import settings
from django.core.management.base import BaseCommand, CommandError
from django.utils.text import slugify
from selenium import webdriver

from takwimu.models import ProfileSectionPage, ProfilePage
from takwimu.models.data import ProfileData
from takwimu.models.utils.search import get_widget_data, get_page_details
from takwimu.search.takwimu_search import TakwimuTopicSearch
from takwimu.utils.helpers import COUNTRIES


class Command(BaseCommand):
    help = 'Add topics to the search index'

    def handle(self, *args, **options):
        topic_search = TakwimuTopicSearch()
        topic_search.reset_index()

        self.stdout.write(topic_search.es_index + ": Starting rebuild")
        self.stdout.write("Ensure that the server is running on port 8000")
        self.index_hurumap(topic_search)
        self.index_topics(ProfileSectionPage.objects.live(), topic_search)
        self.index_topics(ProfilePage.objects.live(), topic_search)

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
                        self.stdout.write(
                            search_backend.es_index + ": Indexing topic '%s result %s'" % (
                                topic_id,
                                outcome,
                            ))

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

                                self.stdout.write(
                                    search_backend.es_index + ": Indexing widget '%s result %s'" % (
                                        data['id'],
                                        outcome,
                                    ))

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
            self.stdout.write(f"Working on {country} {server_url}/{url}")
            browser.get(f"{server_url}/{url}")
            soup = BeautifulSoup(browser.page_source, 'lxml')
            visualizations = soup.find_all('div', {
                "class": ["column-full", "column-half", "column-three-quarters",
                          "column-quarter"]})
            self.stdout.write(
                f"Found {len(visualizations)} possible visualizations")
            for viz in visualizations:
                # For our sanity, we'll only consider a div to be a chart if
                # it has `data-id` and `data-chart-title`
                id = viz.get('data-id')
                title = viz.get('data-chart-title')
                if id and title:
                    labels = ' '.join(
                        [i.text for i in viz.select('span.x.axis.label')])

                    qualifiers = ' '.join(
                        [i.text for i in
                         viz.find_all('span', class_=['chart-qualifier'])])

                    content_id = f"{country}-{viz['id']}"
                    link = f"/{url}#{viz['id']}"

                    _, outcome = search_backend.add_to_index(content_id=content_id,
                                                             content_type='HURUmap',
                                                             country=country,
                                                             category='',
                                                             title=title,
                                                             body=f"{labels} {qualifiers}",
                                                             metadata='',
                                                             parent_page_id=None,
                                                             parent_page_type=None,
                                                             result_type='Data',
                                                             link=link)
                    self.stdout.write(
                        f"{search_backend.es_index}: Indexing HURUmap visualization {title} from {country}. Result {outcome}")

                    profile_data = ProfileData(
                        country_iso_code=code, chart_id=f"{code}_{chart_data_id}", chart_title=title)
                    profile_data.save()


        browser.quit()
