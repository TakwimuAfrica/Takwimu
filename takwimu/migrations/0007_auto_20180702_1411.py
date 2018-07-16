# -*- coding: utf-8 -*-
# Generated by Django 1.9.13 on 2018-07-02 11:11
from __future__ import unicode_literals

from django.db import migrations, models
import wagtail.wagtailcore.blocks
import wagtail.wagtailcore.fields
import wagtail.wagtailimages.blocks


class Migration(migrations.Migration):

    dependencies = [
        ('takwimu', '0006_topicpage_icon'),
    ]

    operations = [
        migrations.AddField(
            model_name='profilepage',
            name='body',
            field=wagtail.wagtailcore.fields.StreamField([(b'topic', wagtail.wagtailcore.blocks.StructBlock([(b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'icon', wagtail.wagtailimages.blocks.ImageChooserBlock(required=False)), (b'summary', wagtail.wagtailcore.blocks.TextBlock(required=False)), (b'body', wagtail.wagtailcore.blocks.RichTextBlock(required=False))]))], blank=True),
        ),
        migrations.AddField(
            model_name='profilepage',
            name='date',
            field=models.DateField(auto_now=True, null=True, verbose_name=b'Last Updated'),
        ),
    ]
