# coding=utf-8
import os

from elasticsearch import RequestsHttpConnection
from utils.aws_es import AWS4AuthNotUnicode

from hurumap.settings import *  # noqa

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# insert our overrides before both census and hurumap

INSTALLED_APPS = ['takwimu', 'wagtail.contrib.modeladmin', 'fontawesome', 'wagtail.contrib.settings'] + INSTALLED_APPS + ['debug_toolbar']


ROOT_URLCONF = 'takwimu.urls'

MIDDLEWARE_CLASSES = (
        'whitenoise.middleware.WhiteNoiseMiddleware',
    ) + MIDDLEWARE_CLASSES + (
        'debug_toolbar.middleware.DebugToolbarMiddleware',
    )

INTERNAL_IPS = ['127.0.0.1', '172.18.0.1']

TEMPLATES[0]['OPTIONS']['context_processors'] = TEMPLATES[0]['OPTIONS']['context_processors'] + [
    'wagtail.contrib.settings.context_processors.settings',
    'takwimu.context_processors.takwimu_stories',
    'wagtail.contrib.settings.context_processors.settings',
    'takwimu.context_processors.takwimu_topics',
]


# Static Files Handler
STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'


# -------------------------------------------------------------------------------------
# Website Details
# -------------------------------------------------------------------------------------

HURUMAP['name'] = 'Takwimu'
HURUMAP['url'] = os.environ.get('HURUMAP_URL','https://dev.takwimu.africa')

HURUMAP['title_tagline'] = ''
HURUMAP['description'] = ''

hurumap_profile = 'census'

HURUMAP['profile_builder'] = 'takwimu.profiles.{}.get_profile'.format(hurumap_profile)
HURUMAP['default_geo_version'] = os.environ.get('DEFAULT_GEO_VERSION', '2009')
HURUMAP['legacy_embed_geo_version'] = '2009'

HURUMAP['levels'] = {
    'continent': {
        'plural': 'continents',
        'children': ['country', 'level1'],
    },
    'country': {
        'plural': 'countries',
        'children': ['level1']
    },
    'level1': {

    }
}
HURUMAP['comparative_levels'] = ['country']
HURUMAP['geometry_data'] = {
    '2009': {
        'continent': 'geo/continent.topojson',
        'country': 'geo/country.topojson',
        'level1': 'geo/level1.topojson',
    }
}

# Map config
HURUMAP['map_centre'] = None
HURUMAP['map_zoom'] = None

# -------------------------------------------------------------------------------------
# Google Analytics
# Main tracking id: TAKWIMU
HURUMAP['ga_tracking_id'] = 'UA-115543098-1'

# Additional tracking ids
HURUMAP['ga_tracking_ids'] = [
    'UA-44795600-8',  # HURUmap
]

# Making sure they are the same
WAZIMAP = HURUMAP


# -------------------------------------------------------------------------------------
# Database Configs
# -------------------------------------------------------------------------------------

DATABASE_URL = os.environ.get('DATABASE_URL',
                              'postgresql://takwimu:takwimu@localhost/takwimu')
DATABASES['default'] = dj_database_url.parse(DATABASE_URL)


# -------------------------------------------------------------------------------------
# Logging Configs
# -------------------------------------------------------------------------------------

LOGGING['loggers']['takwimu'] = {'level': 'DEBUG' if DEBUG else 'INFO'}

MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

ZENDESK_API = 'https://takwimu.zendesk.com/api/v2/requests.json'

ZENDESK_API_TOKEN = os.environ.get('ZENDESK_API_TOKEN')

# -------------------------------------------------------------------------------------
# WAGTAIL Search
# -------------------------------------------------------------------------------------


TAKWIMU_ES_INDEX = os.environ.get('TAKWIMU_ES_INDEX', 'takwimu-dev')
TAKWIMU_ES_TIMEOUT = int(os.environ.get('TAKWIMU_ES_TIMEOUT', '30'))
TAKWIMU_ES_URL = os.environ.get('TAKWIMU_ES_URL', 'http://localhost:9200')

# Support for AWS ElasticSearch service. If HOST_TYPE is anything other than
#  'AWS', the default configuration will be used.
TAKWIMU_ES_HOST_TYPE = os.environ.get('TAKWIMU_ES_HOST_TYPE', '')
if TAKWIMU_ES_HOST_TYPE.lower() == 'aws':
    TAKWIMU_ES_AWS_ACCESS_KEY = os.environ.get('TAKWIMU_ES_AWS_ACCESS_KEY', '')
    TAKWIMU_ES_AWS_SECRET_KEY = os.environ.get('TAKWIMU_ES_AWS_SECRET_KEY', '')
    TAKWIMU_ES_AWS_REGION = os.environ.get('TAKWIMU_ES_AWS_REGION', 'eu-west-1')
    WAGTAILSEARCH_BACKENDS = {
        'default': {
            'BACKEND': 'wagtail.wagtailsearch.backends.elasticsearch5',
            'INDEX': TAKWIMU_ES_INDEX,
            'TIMEOUT': TAKWIMU_ES_TIMEOUT,
            'HOSTS': [{
                'host': TAKWIMU_ES_URL,
                'port': 443,
                'use_ssl': True,
                'verify_certs': True,
                'http_auth': AWS4AuthNotUnicode(TAKWIMU_ES_AWS_ACCESS_KEY, TAKWIMU_ES_AWS_SECRET_KEY, TAKWIMU_ES_AWS_REGION, 'es'),
            }],
            'OPTIONS': {
                'connection_class': RequestsHttpConnection,
            },
        }
    }
else:
    WAGTAILSEARCH_BACKENDS = {
        'default': {
            'BACKEND': 'wagtail.wagtailsearch.backends.elasticsearch5',
            'INDEX': TAKWIMU_ES_INDEX,
            'TIMEOUT': TAKWIMU_ES_TIMEOUT,
            'URLS': [TAKWIMU_ES_URL],
            'OPTIONS': {},
            'INDEX_SETTINGS': {},
        }
    }
