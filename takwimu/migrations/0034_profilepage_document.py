# -*- coding: utf-8 -*-
# Generated by Django 1.9.13 on 2018-08-10 11:56
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('wagtaildocs', '0007_merge'),
        ('takwimu', '0033_auto_20180730_1600'),
    ]

    operations = [
        migrations.AddField(
            model_name='profilepage',
            name='document',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='+', to='wagtaildocs.Document'),
        ),
    ]
