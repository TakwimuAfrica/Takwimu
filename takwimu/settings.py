# coding=utf-8
import os

from hurumap.settings import *  # noqa

# insert our overrides before both census and hurumap
INSTALLED_APPS = ['takwimu'] + INSTALLED_APPS


HURUMAP = WAZIMAP

HURUMAP['name'] = 'Takwimu'
HURUMAP['url'] = 'https://hd.hurumap.org'

takwimu_profile = os.environ.get('TAKWIMU_PROFILE', 'takwimu_profiles')


HURUMAP['default_profile'] = takwimu_profile

HURUMAP['profile_builder'] = 'takwimu.profiles.{}.get_profile'.format(
    takwimu_profile)
HURUMAP['default_geo_version'] = os.environ.get('DEFAULT_GEO_VERSION', '2018')
HURUMAP['legacy_embed_geo_version'] = '2018'


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
    '2018': {
        'continent': 'geo/continent.topojson',
        'country': 'geo/country.topojson'
    }
}

LOGGING['loggers']['takwimu'] = {'level': 'DEBUG' if DEBUG else 'INFO'}


DATABASE_URL = os.environ.get('DATABASE_URL',
                              'postgresql://takwimu:takwimu@localhost/takwimu')
DATABASES['default'] = dj_database_url.parse(DATABASE_URL)
DATABASES['default']['ATOMIC_REQUESTS'] = True

# Making sure they are the same
WAZIMAP = HURUMAP
