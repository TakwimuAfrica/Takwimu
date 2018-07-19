# coding=utf-8
import os

from hurumap.settings import *  # noqa

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# insert our overrides before both census and hurumap

INSTALLED_APPS = ['takwimu', 'wagtail.contrib.modeladmin', 'fontawesome', 'wagtail.contrib.settings'] + INSTALLED_APPS + ['debug_toolbar']


ROOT_URLCONF = 'takwimu.urls'

MIDDLEWARE_CLASSES = MIDDLEWARE_CLASSES + (
    'debug_toolbar.middleware.DebugToolbarMiddleware',
)

INTERNAL_IPS = ['127.0.0.1', '172.18.0.1']

TEMPLATE_CONTEXT_PROCESSORS = TEMPLATE_CONTEXT_PROCESSORS + (
    'wagtail.contrib.settings.context_processors.settings',
    'takwimu.context_processors.takwimu_stories',
    'wagtail.contrib.settings.context_processors.settings',
    'takwimu.context_processors.takwimu_topics',
)


# -------------------------------------------------------------------------------------
# Website Details
# -------------------------------------------------------------------------------------

HURUMAP['name'] = 'TAKWIMU'
HURUMAP['url'] = os.environ.get('HURUMAP_URL','https://takwimu.africa/')

hurumap_profile = 'census'

HURUMAP['profile_builder'] = 'takwimu.profiles.{}.get_profile'.format(hurumap_profile)
HURUMAP['default_geo_version'] = os.environ.get('DEFAULT_GEO_VERSION', '2009')
HURUMAP['legacy_embed_geo_version'] = '2009'


HURUMAP['levels'] = {
    'continent': {
        'plural': 'continents',
        'children': ['country'],
    },
    'country': {
        'plural': 'countries',
    }
}
HURUMAP['comparative_levels'] = ['country']
HURUMAP['geometry_data'] = {
    '2009': {
        'continent': 'geo/continent.topojson',
        'country': 'geo/country.topojson'
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
