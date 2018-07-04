from django.core.exceptions import ObjectDoesNotExist
from django.db.models.signals import post_save, pre_save
from django.dispatch import receiver
from hurumap.models.data import DataIndicator
from os.path import splitext
import csv
import json

from wazimap.models import Geography


@receiver(post_save, sender=DataIndicator)
def create_field_tables(sender, instance, created, **kwargs):
    # to prevent post_save recursion, first disconnect the signal, the connect it again
    # https://stackoverflow.com/questions/39481625/how-can-i-prevent-post-save-recursion-in-django
    if not hasattr(instance.raw_data_file, 'path'):
        return
    post_save.disconnect(create_field_tables, sender=sender)
    path = instance.raw_data_file.path
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






"""
TODO 
 - use pandas to load data
 - add disaggregation column to the model/form
 - group pandas dataframe by disaggregation column; should create n dataframes
 - get sum of all dataframes by `year' to get total
 - get average and other stats if necessary - using inbuilt pandas methods
 - format data and save
"""