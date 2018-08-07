import logging
import re
from collections import OrderedDict

from django.conf import settings
from wazimap.data.utils import (LocationNotFound, get_session, get_stat_data,
                                merge_dicts)

log = logging.getLogger(__name__)

SECTIONS = settings.HURUMAP.get('topics', {})

LOCATIONNOTFOUND = {'is_missing': True, 'name': 'No Data Found', 'numerators': {'this': 0},
                    'values': {'this': 0}}


def get_profile(geo, profile_name, request):
    session = get_session()
    data = {}

    try:
        data['population'] = get_population(geo, session)
        data['elections'] = get_elections(geo, session)
        data['health_centers'] = get_health_centers(geo, session)
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
    candidate_dist = LOCATIONNOTFOUND
    valid_invalid_dist = LOCATIONNOTFOUND
    registered_accred_dist = LOCATIONNOTFOUND

    # Each of these fetches may fail due to data unavailability but failure of one
    # does not imply failure of another i.e. they are independent.
    try:
        candidate_dist, _ = get_stat_data(
            'candidate', geo, session, table_fields=['candidate'])
    except LocationNotFound:
        pass
    try:
        valid_invalid_dist, _ = get_stat_data('votes', geo, session, table_fields=[
                                              'votes'], table_name='valid_invalid_votes')
    except LocationNotFound:
        pass
    try:
        registered_accred_dist, _ = get_stat_data('voters', geo, session, table_fields=[
                                                  'voters'], table_name='registered_accredited_voters')
    except LocationNotFound:
        pass

    return {
        'candidate_dist': candidate_dist,
        'valid_invalid_dist': valid_invalid_dist,
        'registered_accred_dist': registered_accred_dist
    }


def get_crop_production(geo, session):
    crop_distribution = LOCATIONNOTFOUND
    try:
        crop_distribution, _ = get_stat_data(
            'crops', geo, session, table_fields=['crops'])
    except LocationNotFound:
        pass

    return {
        'crop_distribution': crop_distribution
    }


def get_health_centers(geo, session):
    health_centers_dist, total_health_centers_dist = LOCATIONNOTFOUND, 0
    health_centers_ownership_dist = LOCATIONNOTFOUND
    hiv_centers_dist, total_hiv_centers_dist = LOCATIONNOTFOUND, 0

    try:
        health_centers_dist, total_health_centers_dist = get_stat_data('centers',geo, session, 
                                                table_name='health_centers', order_by='-total')
    except LocationNotFound:
        pass
    
    try:
        hiv_centers_dist, total_hiv_centers_dist = get_stat_data('centers',geo, session, 
                                                table_name='hiv_centers', order_by='-total')
    except LocationNotFound:
        pass

    try:
        health_centers_ownership_dist, _ = get_stat_data('centers',geo, session, 
                                                table_name='health_centers_ownership', order_by='-total')
    except LocationNotFound:
        pass
    
    return {
            'health_centers_dist': health_centers_dist,
            'total_health_centers': {
                'name': 'Total health centers in operation (2014)',
                'numerators': {'this': total_health_centers_dist},
                'values': {'this': total_health_centers_dist}
            },
            'hiv_centers_dist': hiv_centers_dist,
            'total_hiv_centers': {
                'name': 'HIV care and treatment centers (2014)',
                'numerators': {'this': total_hiv_centers_dist},
                'values': {'this': total_hiv_centers_dist}
            },
            'health_centers_ownership_dist': health_centers_ownership_dist
        }

# helpers


def get_last_n_years(data, n):
    if len(data.items()) > n:
        return OrderedDict(data.items()[-n:])
    else:
        return data
