from django.db import models

from wagtail.wagtailcore.models import Page
from wagtail.wagtailcore.fields import StreamField
from wagtail.wagtailcore import blocks
from wagtail.wagtailadmin.edit_handlers import FieldPanel, StreamFieldPanel
from wagtail.wagtailimages.blocks import ImageChooserBlock
from wagtail.wagtailsearch import index

from wazimap.models import Geography


class ReportPage(Page):
    '''
    Geography / Country Report Page
    '''
    date = models.DateField("Post date")
    geo = models.ForeignKey(Geography, on_delete=models.SET_NULL, blank=True, null=True)
    body = StreamField([
        ('heading', blocks.CharBlock()),
        ('paragraph', blocks.RichTextBlock()),
        ('image', ImageChooserBlock()),
    ])

    # Search index configuration

    search_fields = Page.search_fields + [
        index.SearchField('body'),
        index.FilterField('date'),
        index.FilterField('geo')
    ]

    # Editor panels configuration

    content_panels = Page.content_panels + [
        FieldPanel('date'),
        FieldPanel('geo'),
        StreamFieldPanel('body'),
    ]
    