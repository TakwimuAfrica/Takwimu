import os
from django.core.management.base import BaseCommand, CommandError
from django.core.management import call_command

from bs4 import BeautifulSoup
from selenium import webdriver

from takwimu.models import ProfileSectionPage, ProfilePage
from django.conf import settings

from takwimu.search.takwimu_search import TakwimuTopicSearch
from takwimu.search.utils import get_widget_data, get_page_details


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
                        _, outcome = search_backend.add_to_index(topic_id,
                                                                 'topic',
                                                                 country,
                                                                 category,
                                                                 title,
                                                                 body,
                                                                 metadata,
                                                                 parent_page_id,
                                                                 parent_page_type,
                                                                 'Analysis'
                                                                 )
                        self.stdout.write(
                            search_backend.es_index + ": Indexing topic '%s result %s'" % (
                                topic_id,
                                outcome,
                            ))

                    elif k['type'] == 'indicator':
                        indicator = k.get('value', [])
                        for widget in indicator['widget']:
                            data = get_widget_data(widget)
                            if data:
                                _, outcome = search_backend.add_to_index(
                                    data['id'],
                                    'indicator_widget',
                                    country,
                                    category,
                                    data['title'],
                                    data['body'],
                                    data['metadata'],
                                    parent_page_id,
                                    parent_page_type,
                                    'Data'
                                )
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

        server_url = os.getenv('HURUMAP_URL', 'http://localhost:8000')

        if server_url.endswith('/'):
            # remove trailing slash
            server_url = server_url[:-1]

        urls = {'Kenya': 'profiles/country-KE-kenya/',
                'Uganda': 'profiles/country-UG-uganda/',
                'Ethiopia': 'profiles/country-ET-ethiopia/',
                'Tanzania': 'profiles/country-TZ-tanzania/',
                'Nigeria': 'profiles/country-NG-nigeria/',
                'Senegal': 'profiles/country-SN-senegal/',
                'Burkina Faso': 'profiles/country-BF-burkina-faso/',
                'Democratic Republic of Congo': 'profiles/country-CD-democratic-republic-of-congo',
                'Zambia': 'profiles/country-ZM-zambia/',
                'South Africa': 'country-ZA-south-africa/'
                }

        for country, url in urls.items():
            self.stdout.write(f"Working on {country} {server_url}/{url}")
            browser.get(f"{server_url}/{url}")
            soup = BeautifulSoup(browser.page_source, 'lxml')
            visualizations = soup.find_all('div', {
                "class": ["column-full", "column-half", "column-three-quarters",
                          "column-quarter"]})
            self.stdout.write(
                f"Found {len(visualizations)} possible visualizations")
            for viz in visualizations:
                chart_header = ''
                try:
                    chart_header = viz.find('h3', class_='chart-header').text
                except AttributeError:
                    pass

                title = viz.get('data-chart-title', '') or chart_header

                # if section does not have a title then it's probably a random
                # div without a visualization

                if title and viz.find('div', class_="chart"):
                    # self.stdout.write(str(viz))
                    labels = ' '.join(
                        [i.text for i in viz.select('span.x.axis.label')])

                    qualifiers = ' '.join(
                        [i.text for i in
                         viz.find_all('span', class_=['chart-qualifier'])])

                    id = f"{country}-{viz['id']}"
                    link = f"{server_url}/{url}/#{viz['id']}"

                    _, outcome = search_backend.add_to_index(content_id=id,
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
