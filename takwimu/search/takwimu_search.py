from collections import OrderedDict
import json

from elasticsearch import Elasticsearch, NotFoundError
from elasticsearch_dsl import Search
from django.conf import settings

from takwimu.models import ProfilePage, ProfileSectionPage


class TakwimuTopicSearch():

    def __init__(self):
        WAGTAILSEARCH_BACKENDS = getattr(
            settings, 'WAGTAILSEARCH_BACKENDS')

        self.es_index = WAGTAILSEARCH_BACKENDS['default'].get('INDEX')
        self.es_timeout = WAGTAILSEARCH_BACKENDS['default'].get('TIMEOUT')
        self.es_host_type = getattr(settings, 'TAKWIMU_ES_HOST_TYPE', '')
        self.profilepages = ProfilePage.objects.live()
        self.profilesectionpages = ProfileSectionPage.objects.live()
        if self.es_host_type == 'aws':
            self.es_hosts = WAGTAILSEARCH_BACKENDS['default'].get('HOSTS')
        else:
            self.es_hosts = WAGTAILSEARCH_BACKENDS['default'].get('URLS')

        self.es = Elasticsearch(hosts=self.es_hosts)

    def reset_index(self):
        # Delete old index
        try:
            self.es.indices.delete(self.es_index)
        except NotFoundError:
            pass

        # Create new index
        self.es.indices.create(self.es_index,
                               settings.TAKWIMU_ES_INDEX_SETTINGS)

    def search(self, query_string, operator="or", country_filters=None,
               category_filters=None):
        """do search thing"""
        search = Search(using=self.es, index=self.es_index,
                        doc_type='topic').params(size=100)

        if operator == 'and':
            search = search.query("match_phrase", body=query_string)
        else:
            search = search.query("match", body=query_string)

        if country_filters is not None and len(country_filters) > 0:
            country_filters = [i.lower() for i in country_filters]
            search = search.filter("terms", country=country_filters)

        if category_filters is not None and len(category_filters) > 0:
            all_categories = " ".join(category_filters)
            category_filters = all_categories.lower().split(" ")
            search = search.filter("terms", category=category_filters)

        results = []
        for hit in search.execute():
            hit = hit.to_dict()
            results.append({
                "country": hit.get('country', ''),
                "region": "National",
                "category": hit.get("category"),
                "type": hit.get("type"),
                "topic_id": hit.get("topic_id"),
                "widget_id": hit.get("widget_id"),
                "parent_page_id": hit.get("parent_page_id"),
                "parent_page_type": hit.get("parent_page_type")
            })

        return results

    def add_to_index(self, category, body, country,
                     parent_page_id, parent_page_type, type='', widget_id=None,
                     topic_id=None, ):
        """
        - page type/class : either ProfileSectionPage or ProfilePage
    - topic_id
    - topic_body
    - parent_page_id
    - category
    - country
        :return:
        """
        doc = {
            "body": body,
            "category": category.title(),
            "country": country.title(),
            "parent_page_id": parent_page_id,
            "parent_page_type": parent_page_type,
            "topic_id": topic_id,
            "type": type,
            "widget_id": widget_id
        }

        doc_id = topic_id or widget_id

        result = self.es.index(index=self.es_index, doc_type="topic", body=doc,
                               id=doc_id)

        return result.get('result') == 'created', result
