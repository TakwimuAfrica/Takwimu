# -*- coding: utf-8 -*-
# Generated by Django 1.11.20 on 2019-04-23 11:01
from __future__ import unicode_literals

from django.db import migrations
import wagtail.core.fields


class Migration(migrations.Migration):

    dependencies = [
        ('takwimu', '0052_supportservicessetting_overview'),
    ]

    operations = [
        migrations.AddField(
            model_name='faqsetting',
            name='overview',
            field=wagtail.core.fields.RichTextField(blank=True),
        ),
    ]