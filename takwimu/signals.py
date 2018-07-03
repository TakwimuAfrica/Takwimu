from django.core.exceptions import ObjectDoesNotExist
from django.db.models.signals import post_save, pre_save
from django.dispatch import receiver
from hurumap.models.data import DataIndicator
from os.path import splitext
import csv
import json
import pandas as pd
from wazimap.models import Geography
import numpy as np


@receiver(post_save, sender=DataIndicator)
def create_field_tables(sender, instance, created, **kwargs):
    # to prevent post_save recursion, first disconnect the signal, the connect it again
    # https://stackoverflow.com/questions/39481625/how-can-i-prevent-post-save-recursion-in-django
    if not hasattr(instance.raw_data_file, 'path'):
        return
    post_save.disconnect(create_field_tables, sender=sender)
    path = instance.raw_data_file.path
    data_values = return_data_values(path, instance.title)
    _, extension = splitext(path)

    publisher_data = {
        'type': extension,
        'url_original': '',
        'url_local': instance.raw_data_file.url
    }

    print '\n\n\n\n\n'
    print data_values
    print '\n\n\n\n\n'

    instance.publisher_data = publisher_data
    instance.data_values = json.dumps(data_values)
    instance.save()
    post_save.connect(create_field_tables, sender=sender)


def convert_csv_to_json(path):
    data = []
    with open(path) as f:
        for row in csv.DictReader(f):
            data.append(row)

    return json.dumps(data)


def get_geo_data(geo_name):
    try:
        query = Geography.objects.get(name__iexact=geo_name.strip())
        return '-'.join([query.geo_level, query.geo_code])
    except ObjectDoesNotExist:
        return 'undefined'


def get_stats_per_year(df, aggfunc):
    """

    :param df: DataFrame
    :param aggfunc: either np.mean for average or np.sum for totals
    :return:
    """
    data_dict = {}

    if aggfunc:
        table = pd.pivot_table(df, values='value', columns=['year'],
                               fill_value=0, index=['geography'],
                               aggfunc=aggfunc)

        # recreate geography column from the index
        table['geography'] = table.index

        # convert table back to long form
        data = pd.melt(table, id_vars=['geography'])

        for key, df_total in data.groupby('geography'):
            data_dict[key] = dict(zip(df_total.year, df_total.value))

    return data_dict


def get_data_values_per_geography(df, disagg_column):
    data = {}
    for key, df_key in df.groupby(['geography', disagg_column]):
        data[key] = dict(zip(df_key.year, df_key.value))
    return data


def return_data_values(path, indicator_title):
    data_values = {}
    try:
        df = pd.read_csv(path)
        df['geography'] = df['geography'].apply(lambda x: get_geo_data(x))

        # get disaggregation column
        disaggregation_column = \
            list(set(df.columns) - {'geography', 'year', 'value'})[0]

        totals = get_stats_per_year(df, aggfunc=np.sum)
        average = get_stats_per_year(df, aggfunc=np.mean)

        grouped_values = get_data_values_per_geography(df,
                                                       disaggregation_column)

        for key, value in grouped_values.iteritems():
            # (disaggregation_column, geo)
            # check if the geography doesn't exist
            if not key[1] in data_values.keys():
                data_values[key[1]] = {key[0]: {
                    'name': indicator_title,
                    '_default': 0,
                    'values': value
                }
                }
            else:
                data_values[key[1]][key[0]] = {
                    'name': indicator_title,
                    '_default': 0,
                    'values': value
                }

        # add totals
        for geo, value in totals:
            if not geo in data_values.keys():
                data_values[geo] = {'_totals': value}
            else:
                data_values[geo]['_totals'] = value

        # add averages
        for geo, value in average:
            if not geo in data_values.keys():
                data_values[geo] = {'_totals': value}
            else:
                data_values[geo]['_totals'] = value

    except Exception as e:
        return data_values


"""
TODO 
 - use pandas to load data
 - add disaggregation column to the model/form
 - group pandas dataframe by disaggregation column; should create n dataframes
 - get sum of all dataframes by `year' to get total
 - get average and other stats if necessary - using inbuilt pandas methods
 - format data and save
"""

"""

"""
