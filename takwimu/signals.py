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
    data_values = {}
    try:
        df = pd.read_csv(path)

        # get disaggregation column
        disaggregation_column = \
        list(set(df.columns) - set(['geography', 'year', 'value']))[0]



    except:
        return

    _, extension = splitext(path)
    data = convert_csv_to_json(path)

    publisher_data = {
        'type': extension,
        'url_original': '',
        'url_local': instance.raw_data_file.url
    }

    print data
    print '\n\n\n\n'

    instance.publisher_data = publisher_data
    instance.data_values = data
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
        query = Geography.objects.get(name__iexact=geo_name)
        return '-'.join(query.geo_level, query.geo_code)
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
                               index=['geography'], aggfunc=aggfunc)

        # recreate geography column from the index
        table['geography'] = table.index

        # convert table back to long form
        data = pd.melt(table, id_vars=['geography'])

        for key, df_total in data.groupby('geography'):
            data_dict[key] = df_total

    return data_dict




"""
TODO 
 - use pandas to load data
 - add disaggregation column to the model/form
 - group pandas dataframe by disaggregation column; should create n dataframes
 - get sum of all dataframes by `year' to get total
 - get average and other stats if necessary - using inbuilt pandas methods
 - format data and save
"""
