import logging
import re
from collections import OrderedDict

from django.conf import settings
from wazimap.data.utils import (LocationNotFound, get_session, get_stat_data,
                                merge_dicts)

log = logging.getLogger(__name__)

SECTIONS = settings.HURUMAP.get('topics', {})

LOCATIONNOTFOUND = {'is_missing': True, 'name': 'No Data Found',
                    'numerators': {'this': 0},
                    'values': {'this': 0}}


def get_profile(geo, profile_name, request):
    session = get_session()
    data = {}

    try:
        data['demographics'] = get_demographics(geo, session)
        data['elections'] = get_elections(geo, session)
        data['crops'] = get_crop_production(geo, session)
        data['health_centers'] = get_health_centers(geo, session)
        data['health_workers'] = get_health_workers(geo, session)
        data['causes_of_death'] = get_causes_of_death(geo, session)
        data['education'] = get_education_profile(geo, session)
        return data
    finally:
        session.close()


def get_demographics(geo, session):
    population_data = get_population(geo, session)
    child_births_data = get_child_births(geo, session)
    demographics_data = dict(population_data.items() +
                             child_births_data.items())
    demographics_data['is_missing'] = population_data.get('is_missing') and \
                                      child_births_data.get('is_missing')

    return demographics_data


def get_population(geo, session):
    sex_dist, total_population_sex = LOCATIONNOTFOUND, 0
    residence_dist, total_population_residence = LOCATIONNOTFOUND, 0

    try:
        sex_dist, total_population_sex = get_stat_data(
            'Population_Sex', geo, session, table_fields=['Population_Sex'])
    except LocationNotFound:
        pass
    try:
        residence_dist, total_population_residence = get_stat_data(
            'Population_Residence', geo, session,
            table_fields=['Population_Residence'])
    except LocationNotFound:
        pass

    total_population = 0
    is_missing = sex_dist.get('is_missing') and \
                 residence_dist.get('is_missing')
    if not is_missing:
        total_population = total_population_sex if total_population_sex > 0 else total_population_residence
    total_population_dist = _create_single_value_dist(
        'People', total_population)

    demographics_data = {
        'is_missing': is_missing,
        'sex_dist': sex_dist,
        'residence_dist': residence_dist,
        'total_population': total_population_dist,
    }

    if geo.square_kms:
        demographics_data['population_density'] = {
            'name': "people per square kilometre",
            'values': {"this": total_population / geo.square_kms},
        }
    return demographics_data


def _create_single_value_dist(name='', value=0):
    return {
        'name': name,
        'numerators': {'this': value},
        'values': {'this': value},
    }


def get_child_births(geo, session):
    child_births_dist, total_child_births = LOCATIONNOTFOUND, 0
    child_births_by_size_dist = LOCATIONNOTFOUND
    total_reported_birth_weights = 0
    total_low_birth_weights = 0

    try:
        child_births_dist, total_child_births = get_stat_data(
            'child_births', geo, session, order_by='-total')
    except LocationNotFound:
        pass

    try:
        child_births_by_size_dist, _ = get_stat_data(
            'size', geo, session, table_fields=['size'],
            table_name='child_births_by_size')
    except LocationNotFound:
        pass

    try:
        _, total_reported_birth_weights = get_stat_data(
            'reported_birth_weights', geo, session,
            table_fields=['reported_birth_weights'],
            table_name='child_births_with_reported_birth_weights',
            order_by='-total')
    except LocationNotFound:
        pass

    try:
        _, total_low_birth_weights = get_stat_data(
            'low_birth_weights', geo, session,
            table_fields=['low_birth_weights'],
            table_name='child_births_with_low_birth_weights')
    except LocationNotFound:
        pass

    is_missing = child_births_dist.get('is_missing')
    total_child_births_dist = _create_single_value_dist(
        'Total births', total_child_births)
    total_reported_birth_weights_dist = _create_single_value_dist(
        'Of all births have a reported birth weight',
        total_reported_birth_weights)
    total_low_birth_weights_dist = _create_single_value_dist(
        'Of all reported birth weights are less than 2.5 kg',
        total_low_birth_weights)

    return {
        'is_missing': is_missing,
        'child_births_dist': child_births_dist,
        'total_child_births_dist': total_child_births_dist,
        'child_births_by_size_dist': child_births_by_size_dist,
        'total_reported_birth_weights_dist': total_reported_birth_weights_dist,
        'total_low_birth_weights_dist': total_low_birth_weights_dist,
        'child_births_source': {
            'link': 'https://dhsprogram.com/pubs/pdf/fr293/fr293.pdf',
            'name': 'Nigeria Demographic and Health Survey 2013',
        },
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
        valid_invalid_dist, _ = get_stat_data('votes', geo, session,
                                              table_fields=[
                                                  'votes'],
                                              table_name='valid_invalid_votes')
    except LocationNotFound:
        pass
    try:
        registered_accred_dist, _ = get_stat_data('voters', geo, session,
                                                  table_fields=[
                                                      'voters'],
                                                  table_name='registered_accredited_voters')
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
            'centers', geo, session, table_name='health_centers',
            order_by='-total')
    except LocationNotFound:
        pass

    try:
        hiv_health_centers_dist, total_hiv_health_centers = get_stat_data(
            'centers', geo, session, table_name='hiv_health_centers',
            order_by='-total')
    except LocationNotFound:
        pass

    try:
        health_centers_ownership_dist, _ = get_stat_data(
            'organization_type', geo, session,
            table_name='health_centers_ownership', order_by='-total')
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
            'workers', geo, session, table_name='health_workers',
            order_by='-total')
        hrh_patient_ratio = \
        health_workers_dist['HRH patient ratio']['numerators']['this']
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


def get_education_profile(geo, session):
    # highest level reached
    edu_dist_data = LOCATIONNOTFOUND
    school_attendance_dist = LOCATIONNOTFOUND
    secondary_or_higher = 0
    total_never = 0.0
    total_pop = 1
    try:
        edu_dist_data, total_pop = get_stat_data(
            'highest education level reached', geo, session,
            key_order=['None', 'Pre-primary', 'Primary', 'Secondary',
                       'Tertiary',
                       'University', 'Youth polytechnic', 'Basic literacy',
                       'Madrassa'])

        for key, data in edu_dist_data.iteritems():
            if key in ['Secondary', 'Tertiary', 'University',
                       'Youth polytechnic']:
                secondary_or_higher += data['numerators']['this']
    except LocationNotFound:
        pass

    try:
        # school attendance by sex
        school_attendance_dist, _ = get_stat_data(
            ['school attendance', 'sex'], geo, session,
            key_order={'school attendance': ['Never attended', 'At school',
                                             'Left school', 'Unspecified'],
                       'sex': ['Female', 'Male']})


        for data in school_attendance_dist['Never attended'].itervalues():
            if 'numerators' in data:
                total_never += data['numerators']['this']
    except LocationNotFound:
        pass

    is_missing = edu_dist_data.get('is_missing') and school_attendance_dist.get(
        'is_missing')

    return {
        'is_missing': is_missing,
        'education_reached_distribution': edu_dist_data,
        'education_reached_secondary_or_higher': {
            'name': 'Reached Secondary school or higher',
            'numerators': {'this': secondary_or_higher},
            'values': {'this': round(secondary_or_higher / total_pop * 100, 2)}
        },
        'school_attendance_distribution': school_attendance_dist,
        'school_attendance_never': {
            'name': 'Never attended school',
            'numerators': {'this': total_never},
            'values': {'this': round(total_never / total_pop * 100, 2)}
        },
    }
