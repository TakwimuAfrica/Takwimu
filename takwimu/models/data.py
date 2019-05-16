import logging

from django import forms
from django.db import models
from django.utils.html import format_html
from django.utils.text import slugify

from wagtail.admin.edit_handlers import FieldPanel
from wagtail.core import blocks
from wagtail.core.fields import RichTextField
from wagtail.snippets.models import register_snippet

from takwimu.utils.helpers import COUNTRIES

logger = logging.getLogger(__name__)

country_choices = [(k, v['name']) for k, v in COUNTRIES.items()]


# The abstract model for data indicators, complete with panels
@register_snippet
class ProfileData(models.Model):
    country_iso_code = models.CharField(
        max_length=3, choices=country_choices, verbose_name='Country')
    chart_id = models.CharField(max_length=1024, unique=True, blank=False, null=False)
    chart_title = models.CharField(max_length=1024)
    summary = blocks.RichTextBlock(required=False, default='')

    panels = [
        FieldPanel('chart_title'),
        FieldPanel('summary'),
    ]

    def __str__(self):
        return '{} {} ({})\n'.format(COUNTRIES[self.country_iso_code]['short_name'], self.chart_title, self.chart_id)
