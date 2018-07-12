from wagtail.contrib.settings.models import BaseSetting, register_setting
from wagtail.wagtailcore.fields import RichTextField
from django.db import models


@register_setting(icon='mail')
class ReachUsSettings(BaseSetting):
    facebook = models.URLField(help_text='Facebook page URL', null=True, blank=True)
    instagram = models.URLField(help_text='Instagram Page URL', null=True, blank=True)
    youtube = models.URLField(help_text='YouTube channel URL', null=True, blank=True)
    twitter = models.URLField(help_text='Twitter URL', null=True, blank=True)
    medium = models.URLField(help_text='Medium Blog URL', null=True, blank=True)
    github = models.URLField(help_text='GitHub URL', null=True, blank=True)
    general_email = models.EmailField(help_text='Primary Contact Email', blank=True)
    data_services_email = models.EmailField(blank=True, null=True)
    address = RichTextField(blank=True, null=True)
    help_support_channel = models.URLField(blank=True, null=True)

    class Meta:
        verbose_name = 'Contact Us'


@register_setting
class AboutUsSettings(BaseSetting):
    about_us = RichTextField()

    class Meta:
        verbose_name = 'About Us'



