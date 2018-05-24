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
        data['gni'] = get_gni_dist(geo, session)
        data['life_expectancy'] = get_life_expectancy(geo, session)
        data['demographics'] = get_population_stats(geo, session)
        data['hiv_prevalence'] = get_hiv_prevalence_data(geo, session)
        data['hdi_overview'] = get_hdi_overview(geo, session)
        data['gdp'] = get_gdp(geo, session)
        data['literacy'] = get_literacy(geo, session)
        data['crops'] = get_crop_production_index(geo, session)
        data['landscape'] = get_landscape_data(geo, session)
        print '\n'
        print data
        return data
    finally:
        session.close()


def get_gni_dist(geo, session):
    try:
        gni_overview_dist, _ = get_stat_data('GNI_Year', geo, session,
                                             table_fields=['GNI_Year'],
                                             percent=False)

        # print gni_overview_dist.items()
        return {'gni': get_last_n_years(gni_overview_dist, 5)}

    except LocationNotFound:
        gni_overview_dist, _ = LOCATIONNOTFOUND, 0


def get_life_expectancy(geo, session):
    try:
        life_expectancy_dist, _ = get_stat_data('Life_Expectancy_Year', geo,
                                                session,
                                                table_fields=[
                                                    'Life_Expectancy_Year'],
                                                percent=False)

        return {'life_expectancy': get_last_n_years(life_expectancy_dist, 10)}

    except LocationNotFound:
        life_expectancy_dist, _ = LOCATIONNOTFOUND, 0


def get_population_stats(geo, session):
    try:
        population_dist, _ = get_stat_data('Population_Year', geo,
                                           session,
                                           table_fields=[
                                               'Population_Year'],
                                           percent=False)

        latest_pop = population_dist.get('2015')

        return {
            'population_dist': get_last_n_years(population_dist, 5),
            'total_population': {
                'name': 'People',
                'values': {'this': latest_pop.get('values')['this']}
            }
        }

    except LocationNotFound:
        population_dist, _ = LOCATIONNOTFOUND, 0


def get_hiv_prevalence_data(geo, session):
    try:
        hiv_dist, _ = get_stat_data('HIV_Prevalence_Year', geo,
                                    session,
                                    table_fields=[
                                        'HIV_Prevalence_Year'],
                                    percent=False)

        current_prevalence = hiv_dist.get('2016')

        return {
            'HIV': get_last_n_years(hiv_dist, 10),
            'current_prevalence': {
                'name': 'HIV Prevalence Rate',
                'values': {'this': current_prevalence.get('values')['this']}
            }

        }

    except LocationNotFound:
        hiv_dist, _ = LOCATIONNOTFOUND, 0


def get_hdi_overview(geo, session):
    try:
        hdi_data, _ = get_stat_data(['year'], geo,
                                    session,
                                    table_fields=[
                                        'year'],
                                    percent=False)

        hdi_rank, _ = get_stat_data(['Rank'], geo,
                                    session,
                                    table_fields=[
                                        'Rank'],
                                    percent=False)

        current_hdi = hdi_data.get('2015')

        return {
            'hdi': {'values': {'this': current_hdi.get('values')['this']},
                    'name': 'HD Index'},
            'rank': {
                'name': 'World HD Rank',
                'values': {'this': hdi_rank.values()[0].get('name')}
            }
        }

    except LocationNotFound:
        hdi_data, _ = LOCATIONNOTFOUND, 0


def get_gdp(geo, session):
    try:
        gdp_dist, _ = get_stat_data('GDP_Year', geo,
                                    session,
                                    table_fields=[
                                        'GDP_Year'],
                                    percent=False)

        return {
            'gdp': get_last_n_years(gdp_dist, 10)}

    except LocationNotFound:
        gdp_dist, _ = LOCATIONNOTFOUND, 0


def get_literacy(geo, session):
    try:
        literacy_dist, _ = get_stat_data('Literacy_Year', geo,
                                         session,
                                         table_fields=[
                                             'Literacy_Year'],
                                         percent=False)

        return {
            'literacy': get_last_n_years(literacy_dist, 10)}

    except LocationNotFound:
        literacy_dist, _ = LOCATIONNOTFOUND, 0


def get_crop_production_index(geo, session):
    try:
        crop_dist, _ = get_stat_data('Crop_Production_Year', geo,
                                     session,
                                     table_fields=[
                                         'Crop_Production_Year'],
                                     percent=False)

        return {
            'crop': get_last_n_years(crop_dist, 10)}

    except LocationNotFound:
        crop_dist, _ = LOCATIONNOTFOUND, 0


def get_landscape_data(geo, session):
    try:
        landscape, _ = get_stat_data('Indicator', geo,
                                     session,
                                     table_fields=[
                                         'Indicator'],
                                     percent=False)

        keys = landscape.keys()[:-1]

        final_data = {}

        # for i in keys:
        #     data = {}
        #     i_no_punct = re.sub(r'[^\w\s]', '', i)
        #     dict_key = i_no_punct.lower().replace(' ', '_')
        #     print landscape.get(i)
        #     data = {
        #         'name': landscape.get(i)['name'],
        #         'values': {'this': landscape.get(i)['values']}
        #     }
        #     final_data[dict_key] = data

        for i in landscape.values()[:-1]:
            data = {
                'name': i.get('name'),
                'values': {'this': i.get('values')['this']}
            }

            key = re.sub(r'[^\w\s]', '', i.get('name'))
            dict_key = key.lower().replace(' ', '_')

            final_data[str(dict_key)] = data

        print final_data

        return final_data

    except LocationNotFound:
        landscape, _ = LOCATIONNOTFOUND, 0


# helpers


def get_last_n_years(data, n):
    if len(data.items()) > n:
        return OrderedDict(data.items()[-n:])
    else:
        return data
