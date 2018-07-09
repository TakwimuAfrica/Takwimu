# -*- coding: utf-8 -*-
# Generated by Django 1.9.13 on 2018-07-09 09:26
from __future__ import unicode_literals

from django.db import migrations, models
import wagtail.wagtailcore.fields


class Migration(migrations.Migration):

    dependencies = [
        ('takwimu', '0016_auto_20180707_1812'),
    ]

    operations = [
        migrations.CreateModel(
            name='HowItWorks',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=30)),
                ('tagline', models.CharField(max_length=140)),
                ('description', wagtail.wagtailcore.fields.RichTextField()),
                ('descriptor_image', models.FileField(upload_to=b'')),
            ],
        ),
    ]
