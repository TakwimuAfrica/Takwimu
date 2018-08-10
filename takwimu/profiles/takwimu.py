import logging
import re
from collections import OrderedDict

from django.conf import settings
from wazimap.data.utils import (LocationNotFound, get_session, get_stat_data,
                                merge_dicts)

log = logging.getLogger(__name__)

SECTIONS = settings.HURUMAP.get('topics', {})

LOCATIONNOTFOUND = {'name': 'No Data Found', 'numerators': {'this': 0},
                    'values': {'this': 0}}


def get_profile(geo, profile_name, request):
    session = get_session()
    data = {}

    print(geo.geo_code)

    try:
        data['takwimu_sections'] = get_takwimu_sections(geo, session)
        print(data)
        return data
    finally:
        session.close()


def get_takwimu_sections(geo, session):
    '''
    Get sections and their data
    '''
    try:
        takwimu_sections = get_section_data(geo)
        return {'takwimu_sections': takwimu_sections}

    except LocationNotFound:
        gni_overview_dist, _ = LOCATIONNOTFOUND, 0



# HELPERS
# TODO: Move to something similar to wazimap.data.utils

def get_section_data(geo):
    '''
    TODO: Try to emulate get_stat_data
    '''
    data = {}
    return data
