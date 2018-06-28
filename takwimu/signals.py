from django.db.models.signals import post_save, pre_save
from django.dispatch import receiver
from hurumap.models.data import DataIndicator
import csv
import json

# @receiver(pre_save, sender=DataIndicator)
# def convert_uploaded_csv_to_json(sender, instance, created, **kwargs):
#     pass

@receiver(post_save, sender=DataIndicator)
def create_field_tables(sender, instance, created, **kwargs):
    print type(instance.raw_data_file.read())
    if instance.raw_data_file:
        reader = csv.DictReader(instance.raw_data_file.read())
        rows = list(reader)
        print '\n\n\n\n'
        print rows
        print '\n\n\n\n'
    else:
        print 'I just did nothing'
