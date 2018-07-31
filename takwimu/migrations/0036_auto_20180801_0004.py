# -*- coding: utf-8 -*-
# Generated by Django 1.9.13 on 2018-07-31 21:04
from __future__ import unicode_literals

from django.db import migrations
import takwimu.models.dashboard
import wagtail.wagtailcore.blocks
import wagtail.wagtailcore.fields
import wagtail.wagtaildocs.blocks
import wagtail.wagtailembeds.blocks
import wagtail.wagtailimages.blocks


class Migration(migrations.Migration):

    dependencies = [
        ('takwimu', '0035_auto_20180731_1750'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profilepage',
            name='body',
            field=wagtail.wagtailcore.fields.StreamField([(b'topic', wagtail.wagtailcore.blocks.StructBlock([(b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'icon', takwimu.models.dashboard.IconChoiceBlock(required=False)), (b'summary', wagtail.wagtailcore.blocks.TextBlock(required=False)), (b'body', wagtail.wagtailcore.blocks.RichTextBlock(required=False)), (b'indicators', wagtail.wagtailcore.blocks.StreamBlock([(b'free_form', wagtail.wagtailcore.blocks.StructBlock([(b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'body', wagtail.wagtailcore.blocks.RichTextBlock(required=False)), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'snippet', template=b'takwimu/_includes/dataview/freeform.html')), (b'data_indicator', takwimu.models.dashboard.DataIndicatorChooserBlock()), (b'embed', wagtail.wagtailcore.blocks.StructBlock([(b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'embed', wagtail.wagtailembeds.blocks.EmbedBlock(required=False)), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'media', template=b'takwimu/_includes/dataview/embed.html')), (b'document', wagtail.wagtailcore.blocks.StructBlock([(b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'document', wagtail.wagtaildocs.blocks.DocumentChooserBlock(required=False)), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'doc-full', template=b'takwimu/_includes/dataview/document.html')), (b'image', wagtail.wagtailcore.blocks.StructBlock([(b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'image', wagtail.wagtailimages.blocks.ImageChooserBlock(required=False)), (b'caption', wagtail.wagtailcore.blocks.TextBlock(required=False)), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'image', template=b'takwimu/_includes/dataview/image.html')), (b'html', wagtail.wagtailcore.blocks.StructBlock([(b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'raw_html', wagtail.wagtailcore.blocks.RawHTMLBlock(required=False)), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'code', template=b'takwimu/_includes/dataview/code.html')), (b'entities', wagtail.wagtailcore.blocks.StructBlock([(b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'entities', wagtail.wagtailcore.blocks.ListBlock(wagtail.wagtailcore.blocks.StructBlock([(b'name', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'image', wagtail.wagtailimages.blocks.ImageChooserBlock(required=False)), (b'description', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))]))), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'group', template=b'takwimu/_includes/dataview/entities.html'))], required=False))]))], blank=True),
        ),
        migrations.AlterField(
            model_name='profilesectionpage',
            name='body',
            field=wagtail.wagtailcore.fields.StreamField([(b'topic', wagtail.wagtailcore.blocks.StructBlock([(b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'icon', takwimu.models.dashboard.IconChoiceBlock(required=False)), (b'summary', wagtail.wagtailcore.blocks.TextBlock(required=False)), (b'body', wagtail.wagtailcore.blocks.RichTextBlock(required=False)), (b'indicators', wagtail.wagtailcore.blocks.StreamBlock([(b'free_form', wagtail.wagtailcore.blocks.StructBlock([(b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'body', wagtail.wagtailcore.blocks.RichTextBlock(required=False)), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'snippet', template=b'takwimu/_includes/dataview/freeform.html')), (b'data_indicator', takwimu.models.dashboard.DataIndicatorChooserBlock()), (b'embed', wagtail.wagtailcore.blocks.StructBlock([(b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'embed', wagtail.wagtailembeds.blocks.EmbedBlock(required=False)), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'media', template=b'takwimu/_includes/dataview/embed.html')), (b'document', wagtail.wagtailcore.blocks.StructBlock([(b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'document', wagtail.wagtaildocs.blocks.DocumentChooserBlock(required=False)), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'doc-full', template=b'takwimu/_includes/dataview/document.html')), (b'image', wagtail.wagtailcore.blocks.StructBlock([(b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'image', wagtail.wagtailimages.blocks.ImageChooserBlock(required=False)), (b'caption', wagtail.wagtailcore.blocks.TextBlock(required=False)), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'image', template=b'takwimu/_includes/dataview/image.html')), (b'html', wagtail.wagtailcore.blocks.StructBlock([(b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'raw_html', wagtail.wagtailcore.blocks.RawHTMLBlock(required=False)), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'code', template=b'takwimu/_includes/dataview/code.html')), (b'entities', wagtail.wagtailcore.blocks.StructBlock([(b'title', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'hide_title', wagtail.wagtailcore.blocks.BooleanBlock(default=False, required=False)), (b'entities', wagtail.wagtailcore.blocks.ListBlock(wagtail.wagtailcore.blocks.StructBlock([(b'name', wagtail.wagtailcore.blocks.CharBlock(required=False)), (b'image', wagtail.wagtailimages.blocks.ImageChooserBlock(required=False)), (b'description', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))]))), (b'source', wagtail.wagtailcore.blocks.RichTextBlock(features=[b'link'], required=False))], icon=b'group', template=b'takwimu/_includes/dataview/entities.html'))], required=False))]))], blank=True),
        ),
    ]
