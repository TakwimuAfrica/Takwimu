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

    try:
        data['population'] = get_population(geo, session)
        data['elections'] = get_elections(geo, session)
        data['crops'] = get_crop_production(geo, session)
        print '\n\n\n\n\n\n\n'
        print data
        print '\n\n\n\n\n\n\n'

        return data
    finally:
        session.close()


def get_population(geo, session):
    try:
        sex_dist, total_sex_dist = get_stat_data('Population_Sex', geo,
                                                 session,
                                                 table_fields=[
                                                     'Population_Sex'])

        residence_dist, total_residence_dist = get_stat_data('Population_Residence',
                                                             geo, session,
                                                             table_fields=[
                                                                 'Population_Residence'])

        return {
            'sex_dist': sex_dist,
            'total_sex': {
                'name': '',
                'numerators': {'this': total_sex_dist},
                'values': {'this': total_sex_dist}
            },
            'residence_dist': residence_dist,
            'total_residence': {
                'name': '',
                'numerators': {'this': total_residence_dist},
                'values': {'this': total_residence_dist}
            }
        }

    except LocationNotFound:
        sex_dist, _ = LOCATIONNOTFOUND, 0
        residence_dist, _ = LOCATIONNOTFOUND, 0



def get_elections(geo, session):
    try:
        candidate_dist, total_candidate_dist = get_stat_data('candidate', geo, session, table_fields=['candidate'])
        valid_invalid_dist, _ = get_stat_data('votes', geo, session, table_fields=['votes'], table_name='valid_invalid_votes')
        registered_accred_dist, _ = get_stat_data('voters', geo, session, table_fields=['voters'], table_name='registered_accredited_voters')


        return {
            'candidate_dist': candidate_dist,
            'valid_invalid_dist': valid_invalid_dist,
            'registered_accred_dist': registered_accred_dist
        }

    except LocationNotFound:
        candidate_dist, _ = LOCATIONNOTFOUND, 0
        valid_invalid_dist, _ = LOCATIONNOTFOUND, 0
        registered_accred_dist, _ = LOCATIONNOTFOUND, 0

        return {
            'candidate_dist': candidate_dist,
            'valid_invalid_dist': valid_invalid_dist,
            'registered_accred_dist': registered_accred_dist
        }

def get_crop_production(geo, session):
    try:
        crop_distribution, _ = get_stat_data('crops', geo, session, table_fields=['crops'])
        return {
            'crop_distribution': crop_distribution
        }

    except LocationNotFound:
        crop_distribution, _ = LOCATIONNOTFOUND, 0
        return {
            'crop_distribution': crop_distribution
        }


# helpers


def get_last_n_years(data, n):
    if len(data.items()) > n:
        return OrderedDict(data.items()[-n:])
    else:
        return data
