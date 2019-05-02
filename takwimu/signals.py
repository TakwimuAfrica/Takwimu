"""
Signals to index topics on creation of ProfileSectionPage and ProfilePage

Should save
    - page type/class : either ProfileSectionPage or ProfilePage
    - topic_id
    - topic_body
    - parent_page_id
    - category
    - country
"""

from takwimu.models import ProfilePage, ProfileSectionPage
from django.dispatch import receiver
from wagtail.core.signals import page_published

from takwimu.search.takwimu_search import TakwimuTopicSearch
from takwimu.search.utils import get_widget_data, get_page_details

from django.utils.text import slugify

from selenium import webdriver
from django.conf import settings

@receiver(page_published, sender=ProfilePage)
@receiver(page_published, sender=ProfileSectionPage)
def create_downloadable_analysis_pdf(sender, instance, created, **kwargs):
    options = webdriver.ChromeOptions()
    options.add_argument('headless')
    # chrome can not be run as root, which is the case in docker
    options.add_argument('no-sandbox')
    options.add_argument('disable-gpu')
    browser = webdriver.Chrome(options=options)

    server_url = settings.HURUMAP.get('url', 'localhost:8000')

    country = get_page_details(instance)

    section_title = instance.title if isinstance(instance, ProfileSectionPage) else ''

    print("create_daownloadable_analysis")
    for topic in instance.body.stream_data:
        topic_id = topic.get('id')
        browser.get("%s/profiles/%s/%s?contentonly=1#%s" % (server_url, slugify(country), slugify(section_title), topic_id))
        browser.save_screenshot("%s/pdf.png" % settings.MEDIA_ROOT)

@receiver(page_published, sender=ProfilePage)
@receiver(page_published, sender=ProfileSectionPage)
def index_new_changes_in_profilepage(sender, instance, created, **kwargs):
    search_backend = TakwimuTopicSearch()
    country, category, parent_page_type = get_page_details(instance)

    parent_page_id = instance.id
    for topic in instance.body.stream_data:
        topic_id = topic.get('id')
        title = topic['value'].get('title', '')
        topic_body = topic['value'].get('body', '')
        topic_summary = topic['value'].get('summary', '')
        body = topic_body + " " + topic_summary

        result, outcome = search_backend.add_to_index(topic_id,
                                                      'topic',
                                                      country,
                                                      category,
                                                      title,
                                                      body,
                                                      parent_page_id,
                                                      parent_page_type)

        indicators = topic['value'].get('indicators', '')
        for indicator in indicators:
            for widget in indicator['value']['widgets']:
                data = get_widget_data(widget)
                if data:
                    result, outcome = search_backend.add_to_index(
                        data['id'],
                        'indicator_widget',
                        country,
                        category,
                        data['title'],
                        data['body'],
                        parent_page_id,
                        parent_page_type
                    )
