from django.db.models.signals import post_save
from django.dispatch import receiver
from takwimu.models import DataValue


@receiver(post_save, sender=DataValue)
def create_field_tables(sender, instance, created, **kwargs):
    print "signal called"
