import re

from django.db import models
from django import forms
from wagtail.wagtailadmin.edit_handlers import FieldPanel, StreamFieldPanel, PageChooserPanel, InlinePanel

from wagtail.wagtailcore import blocks
from wagtail.wagtailembeds.blocks import EmbedBlock
from wagtail.wagtaildocs.blocks import DocumentChooserBlock
from wagtail.wagtailimages.blocks import ImageChooserBlock

from wagtail.wagtailcore.fields import StreamField, RichTextField
from wagtail.wagtailcore.models import Orderable, Page
from wagtail.wagtailsearch import index
from modelcluster.fields import ParentalKey

from wazimap.models import Geography
from hurumap.models import DataTopic, DataIndicator
from fontawesome.fields import IconField #importing property from djano-fontawesome app for icons on TopicPage
from fontawesome.forms import IconFormField #importing property from djano-fontawesome app for icon field on TopicBlock

import logging
logger = logging.getLogger(__name__)


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
    All data indicators are made available to profiles + sections via topics.
    This therefore serves as an editorial interface to create topics and link indicators to it.
    '''
    description = models.TextField(blank=True)
    icon = IconField()  #adding icon property that uses the djano-fontawesome app structure

    # TODO: For topics heirachy
    #parent_topic = models.ForeignKey('self',null=True,blank=True,on_delete=models.SET_NULL,related_name='+')
    # TODO: To show other related topics to this one e.g by keywords
    #related_topics = models.ManyToManyField('self')

    # Search index configuration

    search_fields = Page.search_fields + [
        index.SearchField('title'),
        index.SearchField('description')
    ]

    # Editor panels configuration

    content_panels = Page.content_panels + [
        FieldPanel('description'),
        FieldPanel('icon'),
        InlinePanel('data_indicators', label="Data Indicators"),
    ]


class EntityStructBlock(blocks.StructBlock):
    name = blocks.CharBlock(required=False)
    image = ImageChooserBlock(required=False)
    description = blocks.RichTextBlock(features=['link'],required=False)
    class Meta:
        icon = 'group'
        template = 'takwimu/_includes/dataview/entity_detail.html'


class DataIndicatorChooserBlock(blocks.ChooserBlock):
    target_model = DataIndicator
    widget = forms.Select

    class Meta:
        icon = 'folder'

    # Return the key value for the select field
    def value_for_form(self, value):
        if isinstance(value, self.target_model):
            return value.pk
        else:
            return value

class IndicatorsBlock(blocks.StreamBlock):

    free_form = blocks.StructBlock(
        [
            ('title', blocks.CharBlock(required=False)),
            ('body', blocks.RichTextBlock(required=False)),
            ('source', blocks.RichTextBlock(features=['link'],required=False)),
        ],
        icon='snippet',
        template='takwimu/_includes/dataview/freeform.html'
    )

    data_indicator = DataIndicatorChooserBlock()

    embed = blocks.StructBlock(
        [
            ('title', blocks.CharBlock(required=False)),
            ('embed', EmbedBlock(required=False)),
            ('source', blocks.RichTextBlock(features=['link'],required=False)),
        ],
        icon='media',
        template='takwimu/_includes/dataview/embed.html'
    )

    document = blocks.StructBlock(
        [
            ('title', blocks.CharBlock(required=False)),
            ('document', DocumentChooserBlock(required=False)),
            ('source', blocks.RichTextBlock(features=['link'],required=False)),
        ],
        icon='doc-full',
        template='takwimu/_includes/dataview/document.html'
    )

    image = blocks.StructBlock(
        [
            ('title', blocks.CharBlock(required=False)),
            ('image', ImageChooserBlock(required=False)),
            ('caption', blocks.TextBlock(required=False)),
            ('source', blocks.RichTextBlock(features=['link'],required=False)),
        ],
        icon='image',
        template='takwimu/_includes/dataview/image.html'
    )

    html = blocks.StructBlock(
        [
            ('title', blocks.CharBlock(required=False)),
            ('raw_html', blocks.RawHTMLBlock(required=False)),
            ('source', blocks.RichTextBlock(features=['link'],required=False)),
        ],
        icon='code',
        template='takwimu/_includes/dataview/code.html'
    )

    entities = blocks.StructBlock(
        [
            ('title', blocks.CharBlock(required=False)),
            ('entities', blocks.ListBlock(EntityStructBlock())),
            ('source', blocks.RichTextBlock(features=['link'],required=False)),
        ],
        icon='group',
        template='takwimu/_includes/dataview/entities.html'
    )

    class Meta:
        icon = 'form'

class IconChoiceBlock(blocks.FieldBlock):
    field = IconFormField(required=False)


class TopicBlock(blocks.StructBlock):
    title = blocks.CharBlock(required=False)
    icon = IconChoiceBlock(required=False)
    summary = blocks.TextBlock(required=False)
    body = blocks.RichTextBlock(required=False)

    indicators = IndicatorsBlock(required=False)

    def js_initializer(self):
        parent_initializer = super(TopicBlock, self).js_initializer()
        return "Topic(%s)" % parent_initializer

    @property
    def media(self):
        # need to pull in StructBlock's own js code as well as our fontawesome script for our icon
        return super(TopicBlock, self).media + forms.Media(
            js=['fontawesome/js/django_fontawesome.js','fontawesome/select2/select2.min.js', 'js/dashboard.js'],
            css={'all': ['fontawesome/css/fontawesome-all.min.css',
            'fontawesome/select2/select2.css',
            'fontawesome/select2/select2-bootstrap.css']}
        )

    class Meta:
        icon = 'form'

class ProfileSectionPage(Page):
    '''
    Profile Section Page
    -------------------
    After overview, each of the sections have the following structure
    '''
    description = models.TextField(blank=True)
    date = models.DateField("Last Updated", blank=True, null=True, auto_now=True)
    body = StreamField([
        ('topic', TopicBlock())
    ], blank=True)

    # Search index configuration

    search_fields = Page.search_fields + [
        index.SearchField('description'),
        index.SearchField('body'),
    ]

    # Editor panels configuration

    content_panels = Page.content_panels + [
        FieldPanel('description'),
        StreamFieldPanel('body'),
    ]

    # Parent page / subpage type rules

    parent_page_types = ['takwimu.ProfilePage']
    subpage_types = []


# The abstract model for topics, complete with panels
class ProfilePageSection(models.Model):
    section = models.ForeignKey(ProfileSectionPage, on_delete=models.CASCADE)

    panels = [
        PageChooserPanel('section')
    ]

    class Meta:
        abstract = True

# The real model which combines the abstract model, an
# Orderable helper class, and what amounts to a ForeignKey link
# to the model we want to add related links to (TopicPage)
class ProfilePageSections(Orderable, ProfilePageSection):
    profile_page = ParentalKey('takwimu.ProfilePage', related_name='sections')


class ProfilePage(Page):
    '''
    Profile Page
    -----------
    '''
    geo = models.ForeignKey(Geography, on_delete=models.SET_NULL,blank=True,null=True)
    date = models.DateField("Last Updated", blank=True, null=True, auto_now=True)
    body = StreamField([
        ('topic', TopicBlock())
    ], blank=True)

    # Search index configuration

    search_fields = Page.search_fields + [
        index.FilterField('geo'),
        index.SearchField('body'),
    ]

    # Editor panels configuration

    content_panels = Page.content_panels + [
        FieldPanel('geo'),
        StreamFieldPanel('body'),
        InlinePanel('sections', label="Sections"),
    ]

    # Parent page / subpage type rules

    subpage_types = ['takwimu.ProfileSectionPage']

    def get_absolute_url(self):
        return self.full_url


class SupportService(models.Model):
    title = models.TextField()
    icon = IconField()
    description = RichTextField()

    def get_slug(self):
        # remove special characters and punctuation
        title = re.sub('[^A-Za-z0-9]+', ' ', self.title)
        return '-'.join(title.lower().split(' '))


class AboutPage(Page):
    content = RichTextField()

    content_panels = [
        FieldPanel('title'),
        FieldPanel('content'),
    ]


class ContactUsPage(Page):
    address = RichTextField()

    content_panels = [
        FieldPanel('title'),
        FieldPanel('address'),
        InlinePanel('key_contacts', label='Key Contacts'),
        InlinePanel('social_media', label='Social Media')
    ]


class SocialMedia(Orderable):
    name = models.TextField()
    url = models.URLField()
    icon = IconField()
    page = ParentalKey(ContactUsPage, related_name='social_media')


    def __str__(self):
        return self.name


class KeyContacts(Orderable):
    title = models.TextField()
    contact_details = models.TextField()
    link = models.TextField()
    page = ParentalKey(ContactUsPage, related_name='key_contacts')


class FAQ(models.Model):
    question = models.TextField()
    answer = models.TextField()
    created_date = models.DateTimeField(auto_now_add=True)
    modified_date = models.DateTimeField(auto_now=True)

    def __str__(self):
        self.question.encode('ascii', 'ignore')






