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

SOURCES = {
    'kenya': {
        'country': {
            'donor_assistance_dist': {
                'link': 'http://www.oecd.org/dac/financing-sustainable-development/development-finance-data/aid-at-a-glance.htm',
                'title': 'OECD, 2016',
            },
            'seized_firearms_dist': {
                'link': 'https://www.knbs.or.ke/download/economic-survey-2018/',
                'title': 'Kenya National Bureau of Statistics, 2018',
            },
            'health_centers_dist': {
                'link': 'http://www.health.go.ke/wp-content/uploads/2016/04/Kenya-HRH-Strategy-2014-2018.pdf',
                'title': 'Ministry of Health, 2014',
            },
            'government_expenditure_dist': {
                'link': 'https://www.knbs.or.ke/download/economic-survey-2018/',
                'title': 'Kenya National Bureau of Statistics, 2018',
            },
            'fgm_age_dist': {
                'link': 'https://dhsprogram.com/pubs/pdf/fr308/fr308.pdf',
                'title': 'Kenya Demographic and Health Survey, 2014'
            },
        },
    },
    'nigeria': {
        'country': {
            'child_births_by_size_dist': {
                'link': 'https://dhsprogram.com/pubs/pdf/fr293/fr293.pdf',
                'title': 'Nigeria Demographic and Health Survey 2013',
            },
        },
    },
}


def get_profile(geo, profile_name, request):
    session = get_session()
    (country, level) = get_country_and_level(geo)
    data = {}
    try:
        data['demographics'] = get_demographics(geo, session, country, level)
        data['elections'] = get_elections(geo, session)
        data['crops'] = get_crop_production(geo, session)
        data['health_centers'] = get_health_centers(
            geo, session, country, level)
        data['health_workers'] = get_health_workers(geo, session)
        data['causes_of_death'] = get_causes_of_death(geo, session)
        data['education'] = get_education_profile(geo, session)
        data['hiv'] = get_knowledge_of_HIV(geo, session)
        data['donors'] = get_donor_assistance(geo, session, country, level)
        data['poverty'] = get_poverty_profile(geo, session)
        data['fgm'] = get_fgm_profile(geo, session, country, level)
        data['security'] = get_security_profile(geo, session, country, level)
        data['budget'] = get_budget_data(geo, session, country, level)

        return data
    finally:
        session.close()


def get_country_and_level(geo):
    level = geo.geo_level.lower()
    country = geo.name.lower() \
        if level == 'country' \
        else geo.ancestors()[-1].name.lower()

    return (country, level)


def get_demographics(geo, session, country, level):
    population_data = get_population(geo, session)
    child_births_data = get_child_births(geo, session, country, level)
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


def _add_source_to_dist(dist, source_name, country, level):
    if not dist.get('is_missing'):
        country_sources = SOURCES.get(country)
        if country_sources:
            level_sources = country_sources.get(level)
            if level_sources:
                source = level_sources.get(source_name)
                if source:
                    dist['metadata']['source'] = source
    return dist


def get_child_births(geo, session, country, level):
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
        'child_births_by_size_dist': _add_source_to_dist(child_births_by_size_dist, 'child_births_by_size_dist', country, level),
        'total_reported_birth_weights_dist': total_reported_birth_weights_dist,
        'total_low_birth_weights_dist': total_low_birth_weights_dist,
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


def get_health_centers(geo, session, country, level):
    health_centers_dist, total_health_centers = LOCATIONNOTFOUND, 0
    health_centers_ownership_dist = LOCATIONNOTFOUND
    hiv_health_centers_dist, total_hiv_health_centers = LOCATIONNOTFOUND, 0
    prevention_methods_dist = LOCATIONNOTFOUND

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

    try:
        prevention_methods_dist, _ = get_stat_data(['method', 'sex'], geo,
                                                   session)
    except LocationNotFound:
        pass

    is_missing = health_centers_dist.get('is_missing') and \
        health_centers_ownership_dist.get('is_missing') and \
        hiv_health_centers_dist.get('is_missing') and \
        prevention_methods_dist.get('is_missing')
    total_health_centers_dist = _create_single_value_dist(
        'Total health centers in operation (2014)', total_health_centers)
    total_hiv_health_centers_dist = _create_single_value_dist(
        'HIV care and treatment centers (2014)', total_hiv_health_centers)
    return {
        'is_missing': is_missing,
        'health_centers_dist': _add_source_to_dist(health_centers_dist, 'health_centers_dist', country, level),
        'total_health_centers_dist': total_health_centers_dist,
        'hiv_health_centers_dist': hiv_health_centers_dist,
        'total_hiv_health_centers_dist': total_hiv_health_centers_dist,
        'health_centers_ownership_dist': health_centers_ownership_dist,
        'prevention_methods_dist': prevention_methods_dist
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

    try:
        edu_dist_data, _ = get_stat_data(
            'highest_education_level_reached', geo, session,
            key_order=['None', 'Pre-primary', 'Primary', 'Secondary',
                       'Tertiary',
                       'University', 'Youth polytechnic', 'Basic literacy',
                       'Madrassa'])

    except LocationNotFound:
        pass

    try:
        # school attendance by sex
        school_attendance_dist, _ = get_stat_data(
            ['school_attendance', 'sex'], geo, session,
            key_order={'school attendance': ['Never attended', 'At school',
                                             'Left school', 'Unspecified'],
                       'sex': ['Female', 'Male']})

    except LocationNotFound:
        pass

    is_missing = edu_dist_data.get('is_missing')

    return {
        'is_missing': is_missing,
        'education_reached_distribution': edu_dist_data,
        'school_attendance_distribution': school_attendance_dist,
    }


def get_knowledge_of_HIV(geo, session):
    prevention_methods_dist = LOCATIONNOTFOUND
    try:
        prevention_methods_dist, _ = get_stat_data(
            ['method', 'sex'], geo, session)
    except LocationNotFound:
        pass

    return {
        'is_missing': prevention_methods_dist.get('is_missing'),
        'prevention_methods_dist': prevention_methods_dist,
    }


def get_donor_assistance(geo, session, country, level):
    donor_assistance_dist = LOCATIONNOTFOUND
    donor_programmes_dist = LOCATIONNOTFOUND
    try:
        donor_assistance_dist, _ = get_stat_data(['donor'], geo, session)
    except LocationNotFound:
        pass

    try:
        donor_programmes_dist, _ = get_stat_data(
            ['donor', 'programme'], geo, session)
    except LocationNotFound:
        pass

    is_missing = donor_assistance_dist.get('is_missing') and \
        donor_programmes_dist.get('is_missing')
    return {
        'is_missing': is_missing,
        'donor_assistance_dist': _add_source_to_dist(donor_assistance_dist, 'donor_assistance_dist', country, level),
        'donor_programmes_dist': donor_programmes_dist,
    }


def get_poverty_profile(geo, session):
    poverty_residence_dist = LOCATIONNOTFOUND
    poverty_age_dist = LOCATIONNOTFOUND
    try:
        poverty_residence_dist, _ = get_stat_data(
            ['poverty_type', 'residence'], geo, session)
    except LocationNotFound:
        pass

    try:
        poverty_age_dist, _ = get_stat_data(['age', 'residence'], geo, session)
    except LocationNotFound:
        pass

    is_missing = poverty_residence_dist.get('is_missing') and \
        poverty_age_dist.get('is_missing')
    return {
        'is_missing': is_missing,
        'poverty_residence_dist': poverty_residence_dist,
        'poverty_age_dist': poverty_age_dist,
    }


def get_fgm_profile(geo, session, country, level):
    fgm_age_dist = LOCATIONNOTFOUND
    try:
        fgm_age_dist, _ = get_stat_data(['age'], geo, session)
    except LocationNotFound:
        pass

    return {
        'is_missing': fgm_age_dist.get('is_missing'),
        'fgm_age_dist': _add_source_to_dist(fgm_age_dist, 'fgm_age_dist', country, level),
    }


def get_security_profile(geo, session, country, level):
    seized_firearms_dist = LOCATIONNOTFOUND
    try:
        seized_firearms_dist, _ = get_stat_data(['year', 'type'], geo, session)
    except LocationNotFound:
        pass

    return {
        'is_missing': seized_firearms_dist.get('is_missing'),
        'seized_firearms_dist': _add_source_to_dist(seized_firearms_dist, 'seized_firearms_dist', country, level),
    }


def get_budget_data(geo, session, country, level):
    government_expenditure_dist = LOCATIONNOTFOUND
    try:
        government_expenditure_dist, _ = get_stat_data(
            ['year', 'sector'], geo, session)
    except LocationNotFound:
        pass

    return {
        'is_missing': government_expenditure_dist.get('is_missing'),
        'government_expenditure_dist': _add_source_to_dist(government_expenditure_dist, 'government_expenditure_dist', country, level),
    }
