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
        data['demographics'] = get_population(geo, session)
        data['elections'] = get_elections(geo, session)
        data['crops'] = get_crop_production(geo, session)
        data['health_centers'] = get_health_centers(geo, session)
        data['health_workers'] = get_health_workers(geo, session)
        data['causes_of_death'] = get_causes_of_death(geo, session)
        print '\n\n\n\n\n\n\n'
        print data
        print '\n\n\n\n\n\n\n'

        return data
    finally:
        session.close()


def get_population(geo, session):
    sex_dist, total_population = LOCATIONNOTFOUND, 0
    residence_dist = LOCATIONNOTFOUND

    try:
        sex_dist, total_population = get_stat_data(
            'Population_Sex', geo, session, table_fields=['Population_Sex'])
    except LocationNotFound:
        pass
    try:
        residence_dist, total_population = get_stat_data(
            'Population_Residence', geo, session, table_fields=['Population_Residence'])
    except LocationNotFound:
        pass

    is_missing = sex_dist.get('is_missing') and \
        residence_dist.get('is_missing')
    total_dist = _create_single_value_dist('People', total_population)

    final_data = {
        'is_missing': is_missing,
        'sex_dist': sex_dist,
        'residence_dist': residence_dist,
        'total_population': total_dist,
    }

    if geo.square_kms:
        final_data['population_density'] = {
            'name': "people per square kilometre",
            'values': {"this": total_population / geo.square_kms},
        }
    return final_data


def _create_single_value_dist(name='', value=0):
    return {
        'name': name,
        'numerators': {'this': value},
        'values': {'this': value},
    }


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

    is_missing = candidate_dist.get('is_missing') and \
        valid_invalid_dist.get('is_missing') and \
        registered_accred_dist.get('is_missing')
    return {
        'is_missing': is_missing,
        'candidate_dist': candidate_dist,
        'valid_invalid_dist': valid_invalid_dist,
        'registered_accred_dist': registered_accred_dist,
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
    health_centers_dist, total_health_centers = LOCATIONNOTFOUND, 0
    health_centers_ownership_dist = LOCATIONNOTFOUND
    hiv_health_centers_dist, total_hiv_health_centers = LOCATIONNOTFOUND, 0

    try:
        health_centers_dist, total_health_centers = get_stat_data(
            'centers', geo, session, table_name='health_centers', order_by='-total')
    except LocationNotFound:
        pass

    try:
        hiv_health_centers_dist, total_hiv_health_centers = get_stat_data(
            'centers', geo, session, table_name='hiv_health_centers', order_by='-total')
    except LocationNotFound:
        pass

    try:
        health_centers_ownership_dist, _ = get_stat_data(
            'organization_type', geo, session, table_name='health_centers_ownership', order_by='-total')
    except LocationNotFound:
        pass

    is_missing = health_centers_dist.get('is_missing') and \
        health_centers_ownership_dist.get('is_missing') and \
        hiv_health_centers_dist.get('is_missing')
    total_health_centers_dist = _create_single_value_dist(
        'Total health centers in operation (2014)', total_health_centers)
    total_hiv_health_centers_dist = _create_single_value_dist(
        'HIV care and treatment centers (2014)', total_hiv_health_centers)
    return {
        'is_missing': is_missing,
        'health_centers_dist': health_centers_dist,
        'total_health_centers_dist': total_health_centers_dist,
        'hiv_health_centers_dist': hiv_health_centers_dist,
        'total_hiv_health_centers_dist': total_hiv_health_centers_dist,
        'health_centers_ownership_dist': health_centers_ownership_dist,
    }


def get_health_workers(geo, session):
    health_workers_dist, total_health_workers = LOCATIONNOTFOUND, 0
    hrh_patient_ratio = 0

    try:
        health_workers_dist, total_health_workers = get_stat_data(
            'workers', geo, session, table_name='health_workers', order_by='-total')
        hrh_patient_ratio = health_workers_dist['HRH patient ratio']['numerators']['this']
        del health_workers_dist['HRH patient ratio']
        del health_workers_dist['MO and AMO per 10000']
        del health_workers_dist['Nurses and midwives per 10000']
        del health_workers_dist['Pharmacists per 10000']
        del health_workers_dist['Clinicians per 10000']

    except LocationNotFound:
        pass

    total_health_workers_dist = _create_single_value_dist(
        'Total health worker population (2014)', total_health_workers)
    hrh_patient_ratio_dist = _create_single_value_dist(
        'Skilled health worker to patient ratio (2014)', hrh_patient_ratio)
    return {
        'total_health_workers_dist': total_health_workers_dist,
        'hrh_patient_ratio_dist': hrh_patient_ratio_dist,
        'health_workers_dist': health_workers_dist,
    }


def get_causes_of_death(geo, session):
    causes_of_death_under_five_dist = LOCATIONNOTFOUND
    causes_of_death_over_five_dist = LOCATIONNOTFOUND
    inpatient_diagnosis_over_five_dist = LOCATIONNOTFOUND
    inpatient_diagnosis_under_five_dist = LOCATIONNOTFOUND
    outpatient_diagnosis_over_five_dist = LOCATIONNOTFOUND
    outpatient_diagnosis_under_five_dist = LOCATIONNOTFOUND

    try:
        causes_of_death_under_five_dist, _ = get_stat_data(
            'causes_of_death_under_five', geo, session, order_by='-total')
    except LocationNotFound:
        pass

    try:
        causes_of_death_over_five_dist, _ = get_stat_data(
            'causes_of_death_over_five', geo, session, order_by='-total')
    except LocationNotFound:
        pass

    try:
        inpatient_diagnosis_under_five_dist, _ = get_stat_data(
            'inpatient_diagnosis_under_five', geo, session, order_by='-total')
    except LocationNotFound:
        pass

    try:
        inpatient_diagnosis_over_five_dist, _ = get_stat_data(
            'inpatient_diagnosis_over_five', geo, session, order_by='-total')
    except LocationNotFound:
        pass

    try:
        outpatient_diagnosis_over_five_dist, _ = get_stat_data(
            'outpatient_diagnosis_over_five', geo, session, order_by='-total')
    except LocationNotFound:
        pass

    try:
        outpatient_diagnosis_under_five_dist, _ = get_stat_data(
            'outpatient_diagnosis_under_five', geo, session, order_by='-total')
    except LocationNotFound:
        pass

    is_missing = causes_of_death_over_five_dist.get('is_missing') and \
        causes_of_death_under_five_dist.get('is_missing') and \
        inpatient_diagnosis_under_five_dist.get('is_missing') and \
        inpatient_diagnosis_over_five_dist.get('is_missing') and \
        outpatient_diagnosis_under_five_dist.get('is_missing') and \
        outpatient_diagnosis_over_five_dist.get('is_missing')
    return {
        'is_missing': is_missing,
        'causes_of_death_under_five_dist': causes_of_death_under_five_dist,
        'causes_of_death_over_five_dist': causes_of_death_over_five_dist,
        'inpatient_diagnosis_under_five_dist': inpatient_diagnosis_under_five_dist,
        'inpatient_diagnosis_over_five_dist': inpatient_diagnosis_over_five_dist,
        'outpatient_diagnosis_over_five_dist': outpatient_diagnosis_over_five_dist,
        'outpatient_diagnosis_under_five_dist': outpatient_diagnosis_under_five_dist,
    }
