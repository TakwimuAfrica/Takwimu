from wagtail.contrib.settings.models import BaseSetting, register_setting
from wagtail.wagtailcore.fields import RichTextField
from django.db import models


@register_setting
class SocialMediaSettings(BaseSetting):
    facebook = models.URLField(help_text='Facebook page URL', null=True)
    instagram = models.URLField(help_text='Instagram Page URL', null=True)
    youtube = models.URLField(help_text='YouTube channel URL', null=True)
    twitter = models.URLField(help_text='Twitter URL', null=True)
    medium = models.URLField(help_text='Medium Blog URL', null=True)
    github = models.URLField(help_text='GitHub URL', null=True)
    contact_email = models.URLField(help_text='Primary Contact Email')

    class Meta:
        verbose_name = 'Social Media Accounts'




