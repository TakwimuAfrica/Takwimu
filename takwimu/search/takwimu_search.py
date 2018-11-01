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

    def _build_query(self, query_string, operator="or", country_filters=None,
                     category_filters=None):

        search = Search(using=self.es, index=self.es_index,
                        doc_type='topics')

        if operator == 'and':
            search = search.query("match_phrase", body=query_string)
        else:
            search = search.query("match", body=query_string)

        if country_filters is not None and len(country_filters) > 0:
            country_filters = [i.lower() for i in country_filters]
            search = search.filter("terms", country=country_filters)

        if category_filters is not None and len(category_filters) > 0:
            # TODO 30/10/2018 all elasticsearch to filter by phrases and not words for categories
            all_categories = " ".join(category_filters)
            category_filters = all_categories.lower().split(" ")
            search = search.filter("terms", category=category_filters)

        return search.to_dict()

    def reset_index(self):
        # Delete old index
        try:
            self.es.indices.delete(self.es_index)
        except NotFoundError:
            pass

        # Create new index
        self.es.indices.create(self.es_index,
                               settings.TAKWIMU_ES_INDEX_SETTINGS)

    def _do_topic_search(self, query):
        """
        get query
        perform the search
        pass results to the _get_results method
        :return:
        """
        res = self.es.search(index=self.es_index, doc_type='topic', body=query,
                             size=100)

        formatted_results = []
        for i in res['hits']['hits']:
            topic = i.get('_source')
            formatted_results.append({
                "country": topic.get('country', ''),
                "region": "National",
                "category": topic.get("category"),
                "type": topic.get("type"),
                "topic_id": topic.get("topic_id"),
                "widget_id": topic.get("widget_id"),
                "parent_page_id": topic.get("parent_page_id"),
                "parent_page_type": topic.get("parent_page_type")

            })

        return formatted_results

    def search(self, query_string, operator="or", country_filters=None,
               category_filters=None):
        """do search thing"""
        query = self._build_query(query_string, operator=operator,
                                  country_filters=country_filters,
                                  category_filters=category_filters)
        return self._do_topic_search(query)

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
