import logging

from django.db import models

from wagtail.search import index
from wagtail.admin.edit_handlers import FieldPanel
from wagtail.core.fields import RichTextField
from wagtail.snippets.models import register_snippet

from takwimu.utils.helpers import COUNTRIES

logger = logging.getLogger(__name__)

country_choices = [(k, v['short_name']) for k, v in COUNTRIES.items()]


# The abstract model for data indicators, complete with panels
@register_snippet
class ProfileData(index.Indexed, models.Model):
    # e.g. 2/3 iso country code + UUUIDv4 should fit
    id = models.CharField(max_length=54, primary_key=True)
    country_iso_code = models.CharField(
        max_length=3, choices=country_choices, verbose_name='Country')
    chart_id = models.CharField(max_length=1024)
    chart_title = models.CharField(max_length=1024)
    chart_type = models.CharField(max_length=1024)
    data_stat_type = models.CharField(max_length=1024)
    chart_height = models.IntegerField(null=True)
    description = models.CharField(max_length=1024, blank=True)

    # Summary should come from the indicator but since we currently haven't
    # implemented the lookup, we'll put it here for MVP
    summary = RichTextField(blank=True)

    panels = [
        FieldPanel('chart_title'),
        FieldPanel('description'),
        FieldPanel('summary'),
    ]

    search_fields = [
        index.SearchField('chart_title', partial_match=True, boost=2),
        index.SearchField('description'),
        index.SearchField('summary'),
    ]

    def __str__(self):
        return '{} | {}'.format(COUNTRIES[self.country_iso_code]['short_name'], self.chart_title)

    class Meta:
        verbose_name = 'HURUmap Data'
        verbose_name_plural = 'HURUmap Data'
