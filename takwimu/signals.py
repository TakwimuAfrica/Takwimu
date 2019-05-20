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

from takwimu.models.utils.search import get_widget_data, get_page_details
from takwimu.search.takwimu_search import TakwimuTopicSearch

from django.core.management.base import BaseCommand
from takwimu.models.dashboard import ProfilePage

from selenium import webdriver
from takwimu.models.utils.page import page_indicators_to_images

@receiver(page_published, sender=ProfilePage)
@receiver(page_published, sender=ProfileSectionPage)
def save_indicator_image_snapshots(sender, instance, created, **kwargs):
        options = webdriver.ChromeOptions()
        options.add_argument('headless')
        # chrome can not be run as root, which is the case in docker
        options.add_argument('no-sandbox')
        options.add_argument('disable-gpu')
        browser = webdriver.Chrome(options=options)

        page_indicators_to_images(instance, browser)

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
