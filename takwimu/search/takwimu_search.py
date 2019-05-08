from collections import OrderedDict
import json

from django.conf import settings
from django.utils.text import slugify

from elasticsearch import Elasticsearch, NotFoundError
from elasticsearch_dsl import Search
from requests_aws4auth import AWS4Auth

from takwimu.models import ProfilePage, ProfileSectionPage

DOC_TYPE = 'topic'

# if a match is found in two or more `body` fields:
#   i) if `country` was also specified, the matching country should win over
#      all others,
#  ii) relevant `category` should be preferred over irrevant one, and
# iii) matching `title` should be given more weight than just matching `body`.
QUERY_FIELDS = [
    'country^' + settings.TAKWIMU_ES_FIELDS_COUNTRY_BOOST,
    'category^' + settings.TAKWIMU_ES_FIELDS_CATEGORY_BOOST,
    'title^' + settings.TAKWIMU_ES_FIELDS_TITLE_BOOST,
    'body^' + settings.TAKWIMU_ES_FIELDS_BODY_BOOST,
    'metadata^' + settings.TAKWIMU_ES_FIELDS_METADATA_BOOST,
]


def tagify(phrase):
    """
    Convert a given phrase into a single long word
    e.g. given `East African Community`, this method returns
    `eastafricancommunity` as one word.

    It is useful in search filters where spaces and `-` may be seen as word
    separators.
    """

    return slugify(phrase.strip()).replace('-', '')


class TakwimuTopicSearch():
    def __init__(self):
        DEFAULT_SEARCH_BACKEND = settings.WAGTAILSEARCH_BACKENDS['default']

        self.es_index = DEFAULT_SEARCH_BACKEND['INDEX']
        self.es_timeout = DEFAULT_SEARCH_BACKEND['TIMEOUT']
        HOST_TYPE = settings.TAKWIMU_ES_HOST_TYPE.lower()
        if HOST_TYPE == 'aws':
            DEFAULT_HOST = DEFAULT_SEARCH_BACKEND['HOSTS'][0]
            DEFAULT_OPTIONS = DEFAULT_SEARCH_BACKEND['OPTIONS']
            self.es = Elasticsearch(
                hosts=[{'host': DEFAULT_HOST['host'],
                        'port': DEFAULT_HOST['port']}],
                http_auth=DEFAULT_HOST['http_auth'],
                use_ssl=DEFAULT_HOST['use_ssl'],
                verify_certs=DEFAULT_HOST['verify_certs'],
                connection_class=DEFAULT_OPTIONS['connection_class']
            )
        else:
            DEFAULT_HOST = DEFAULT_SEARCH_BACKEND['URLS']
            self.es = Elasticsearch(hosts=DEFAULT_HOST)

        self.profilepages = ProfilePage.objects.live()
        self.profilesectionpages = ProfileSectionPage.objects.live()

    def reset_index(self):
        """Deletes old index (if any) and creates a new on"""

        try:
            self.es.indices.delete(self.es_index)
        except NotFoundError:
            pass
        self.es.indices.create(self.es_index,
                               settings.TAKWIMU_ES_INDEX_SETTINGS)
        settings_ = {
            "properties": {
                "body": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "type": "keyword",
                            "ignore_above": 256,
                            "null_value": "NULL",
                        }
                    }
                },
                "category": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "type": "keyword",
                            "null_value": "NULL",
                            "ignore_above": 256
                        }
                    }
                },
                "category_tag": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "type": "keyword",
                            "null_value": "NULL",
                            "ignore_above": 256
                        }
                    }
                },
                "content_id": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "type": "keyword",
                            "null_value": "NULL",
                            "ignore_above": 256
                        }
                    }
                },
                "content_type": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "type": "keyword",
                            "null_value": "NULL",
                            "ignore_above": 256
                        }
                    }
                },
                "country": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "type": "keyword",
                            "null_value": "NULL",
                            "ignore_above": 256
                        }
                    }
                },
                "country_tag": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "type": "keyword",
                            "null_value": "NULL",
                            "ignore_above": 256
                        }
                    }
                },
                "link": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "type": "keyword",
                            "null_value": "NULL",
                            "ignore_above": 256
                        }
                    }
                },
                "metadata": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "type": "keyword",
                            "null_value": "NULL",
                            "ignore_above": 256
                        }
                    }
                },
                "parent_page_id": {
                    "type": "long",
                },
                "parent_page_type": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "type": "keyword",
                            "null_value": "NULL",
                            "ignore_above": 256
                        }
                    }
                },
                "result_type": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "type": "keyword",
                            "null_value": "NULL",
                            "ignore_above": 256
                        }
                    }
                },
                "summary": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "type": "keyword",
                            "null_value": "NULL",
                            "ignore_above": 256
                        }
                    }
                },
                "title": {
                    "type": "text",
                    "fields": {
                        "keyword": {
                            "type": "keyword",
                            "null_value": "NULL",
                            "ignore_above": 256
                        }
                    }
                },
                "suggest": {
                    "type": "completion",
                    "analyzer": "ngram_analyzer",
                }
            }
        }

        self.es.indices.put_mapping(index=self.es_index, body=settings_,
                                    doc_type=DOC_TYPE)

    def search(self, query_string, operator='or', country_filters=None,
               category_filters=None, query_type='most_fields',
               query_fields=None, size=100):
        """
        Search for query_string using operation applying country and/or
        category filters
        """

        if query_fields is None:
            query_fields = QUERY_FIELDS
        search = Search(using=self.es, index=self.es_index,
                        doc_type=DOC_TYPE).params(size=size)
        print(self.es)

        if operator == 'and':
            query_type = 'phrase'
        search = search.query('multi_match', query=query_string,
                              type=query_type, fields=query_fields)

        # Countries and categories may contain whitespace so don't join or
        # split on ' '.
        # Best approach is still to `try and see` rather than `checking`
        # https://stackoverflow.com/questions/1952464/in-python-how-do-i-determine-if-an-object-is-iterable
        try:
            country_tags = [tagify(i) for i in country_filters]
            if country_tags:
                search = search.filter('terms', country_tag=country_tags)
        except TypeError:
            pass
        try:
            category_tags = [tagify(i) for i in category_filters]
            if category_tags:
                search = search.filter('terms', category_tag=category_tags)
        except TypeError:
            pass

        results = []
        for hit in search.execute():
            hit = hit.to_dict()
            results.append({
                'category': hit['category'],
                'country': hit['country'],
                'region': 'National',
                'parent_page_id': hit['parent_page_id'],
                'parent_page_type': hit['parent_page_type'],
                'content_id': hit['content_id'],
                'content_type': hit['content_type'],
                'title': hit.get('title', ''),
                'link': hit.get('link', ''),
                'result_type': hit['result_type'],
                'summary': hit.get('summary', ''),
            })
        return results

    def add_to_index(self, content_id, content_type,
                     country, category, title, body, metadata,
                     parent_page_id, parent_page_type, result_type=None,
                     link=None, summary=''):
        """
        - content_id
        - content_type
        - country
        - category
        - title
        - body
        - metadata
        - parent_page_id
        - parent_page_type
        :return:
        """

        doc = {
            'content_id': content_id,
            'content_type': content_type,
            'country': country,
            'country_tag': tagify(country),
            'category': category,
            'category_tag': tagify(category),
            'title': title,
            'body': body,
            'metadata': metadata,
            'parent_page_id': parent_page_id,
            'parent_page_type': parent_page_type,
            'result_type': result_type,
            'link': link,
            'summary': summary,
            'suggest': title
        }
        result = self.es.index(index=self.es_index, doc_type=DOC_TYPE, body=doc,
                               id=content_id)
        return result.get('result') == 'created', result
