from django.db.models.signals import post_save
from django.dispatch import receiver
from hurumap.models.data import DataIndicator

@receiver(post_save, sender=DataIndicator)
def create_field_tables(sender, instance, created, **kwargs):
    print "signal called"