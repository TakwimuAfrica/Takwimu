from django.db import models
from wagtail.wagtailadmin.edit_handlers import FieldPanel, StreamFieldPanel, PageChooserPanel, InlinePanel
from wagtail.wagtailcore import blocks
from wagtail.wagtailcore.fields import StreamField
from wagtail.wagtailcore.models import Orderable, Page
from wagtail.wagtailimages.blocks import ImageChooserBlock
from wagtail.wagtailsearch import index
from modelcluster.fields import ParentalKey

from wazimap.models import Geography
from hurumap.models import DataTopic, DataIndicator


# The abstract model for data indicators, complete with panels
class TopicPageDataIndicator(models.Model):
    indicator = models.ForeignKey(DataIndicator, on_delete=models.CASCADE)

    panels = [
        FieldPanel('indicator')
    ]

    class Meta:
        abstract = True

# The real model which combines the abstract model, an
# Orderable helper class, and what amounts to a ForeignKey link
# to the model we want to add related links to (TopicPage)
class TopicPageDataIndicators(Orderable, TopicPageDataIndicator):
    page = ParentalKey('takwimu.TopicPage', related_name='data_indicators')

class TopicPage(Page):
    '''
    Topic Editor
    ------------
    All data indicators are made available to reports + sections via topics.
    This therefore serves as an editorial interface to create topics and link indicators to it.
    '''
    description = models.TextField(blank=True)

    parent_topic = models.ForeignKey('self',null=True,blank=True,on_delete=models.SET_NULL,related_name='+')
    related_topics = models.ManyToManyField('self')

    # Search index configuration

    search_fields = Page.search_fields + [
        index.SearchField('title'),
        index.SearchField('description')
    ]

    # Editor panels configuration

    content_panels = Page.content_panels + [
        FieldPanel('description'),
        InlinePanel('data_indicators', label="Data Indicators"),
    ]

# The abstract model for topics, complete with panels
class ReportPageTopic(models.Model):
    topic = models.ForeignKey(TopicPage, on_delete=models.CASCADE)

    panels = [
        PageChooserPanel('topic')
    ]

    class Meta:
        abstract = True


# The real model which combines the abstract model, an
# Orderable helper class, and what amounts to a ForeignKey link
# to the model we want to add related links to (TopicPage)
class ReportSectionPageTopics(Orderable, ReportPageTopic):
    page = ParentalKey('takwimu.ReportSectionPage', related_name='topics')

class ReportSectionPage(Page):
    '''
    Report Section Page
    -------------------
    After overview, each of the sections have the following structure
    '''
    description = models.TextField(blank=True)

    # Search index configuration

    search_fields = Page.search_fields + [
        index.SearchField('description')
    ]

    # Editor panels configuration

    content_panels = Page.content_panels + [
        FieldPanel('description'),
        InlinePanel('topics', label="Topics"),
    ]

    # Parent page / subpage type rules

    parent_page_types = ['takwimu.ReportPage']
    subpage_types = []

# The abstract model for topics, complete with panels
class ReportPageSection(models.Model):
    section = models.ForeignKey(ReportSectionPage, on_delete=models.CASCADE)

    panels = [
        PageChooserPanel('section')
    ]

    class Meta:
        abstract = True

# The real model which combines the abstract model, an
# Orderable helper class, and what amounts to a ForeignKey link
# to the model we want to add related links to (TopicPage)
class ReportPageSections(Orderable, ReportPageSection):
    page = ParentalKey('takwimu.ReportPage', related_name='sections')


# The real model which combines the abstract model, an
# Orderable helper class, and what amounts to a ForeignKey link
# to the model we want to add related links to (TopicPage)
class ReportPageTopics(Orderable, ReportPageTopic):
    page = ParentalKey('takwimu.ReportPage', related_name='topics')


class ReportPage(Page):
    '''
    Report Page
    -----------
    '''
    geo = models.ForeignKey(Geography, on_delete=models.SET_NULL,blank=True,null=True)

    # Search index configuration

    search_fields = Page.search_fields + [
        index.FilterField('geo'),
    ]

    # Editor panels configuration

    content_panels = Page.content_panels + [
        FieldPanel('geo'),
        InlinePanel('topics', label="Topics"),
        InlinePanel('sections', label="Sections"),
    ]

    # Parent page / subpage type rules

    subpage_types = ['takwimu.ReportSectionPage']

