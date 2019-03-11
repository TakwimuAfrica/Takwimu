from collections import OrderedDict
import json
import re
import warnings

from django.db import models
from django import forms
from django.utils.text import slugify
from wagtail.contrib.settings.models import BaseSetting, register_setting
from wagtail.admin.edit_handlers import FieldPanel, StreamFieldPanel, \
    PageChooserPanel, InlinePanel, MultiFieldPanel
from wagtail.images.edit_handlers import ImageChooserPanel

from wagtail.core import blocks
from wagtail.embeds.blocks import EmbedBlock
from wagtail.documents.blocks import DocumentChooserBlock
from wagtail.documents.edit_handlers import DocumentChooserPanel
from wagtail.documents.models import Document

from wagtail.images.models import Image
from wagtail.images.blocks import ImageChooserBlock

from wagtail.core.fields import StreamField, RichTextField
from wagtail.core.models import Orderable, Page
from wagtail.search import index

from meta.models import ModelMeta

from modelcluster.fields import ParentalKey

from wazimap.models import Geography
from hurumap.models import DataTopic, DataIndicator
from fontawesome.fields import IconField
from fontawesome.forms import IconFormField

import logging

logger = logging.getLogger(__name__)

json_data = open('takwimu/fixtures/sdg.json')
sdg_data = json.load(json_data)
sdg_choices = [(slugify(i.get('short')), i.get('short')) for i in sdg_data]
sdg_choices = [('', 'Please select an SDG')] + sdg_choices


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
    """
    Topic Editor
    ------------
    All data indicators are made available to profiles + sections via topics.
    This therefore serves as an editorial interface to create topics and link indicators to it.
    """
    description = models.TextField(blank=True)
    icon = IconField()

    # TODO: For topics heirachy
    # parent_topic = models.ForeignKey('self',null=True,blank=True,on_delete=models.SET_NULL,related_name='+')
    # TODO: To show other related topics to this one e.g by keywords
    # related_topics = models.ManyToManyField('self')

    # Search index configuration

    search_fields = Page.search_fields + [
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
    description = blocks.RichTextBlock(features=['link'], required=False)

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


HURUMAP_DATA_DISTS = [
    ('demographics-residence_dist', 'Population by Residence'),
    ('demographics-sex_dist', 'Population by Sex'),
    ('crops-crop_distribution', 'Crops Produced'),
    ('health_centers-prevention_methods_dist',
     'Knowledge of HIV Prevention Methods'),
    ('education-education_reached_distribution',
     'Highest Level of Education Attained'),
    ('education-school_attendance_distribution', 'School Attendance by Sex'),
    ('donors-donor_assistance_dist', 'Principal Donors'),
    ('poverty-poverty_residence_dist',
     'Percentage of Population living in Poverty by Residence'),
    ('poverty-poverty_age_dist',
     'Percentage of Population living in Poverty by Age and Residence'),
    ('fgm-fgm_age_dist', 'Percentage of Women that have undergone FGM by Age'),
    ('security-seized_firearms_dist', 'Seized Firearms'),
    ('donors-donor_programmes_dist', 'Donor Funded Programmes'),
    ('budget-government_expenditure_dist', 'Government Expenditure'),
    ('health_centers-health_centers_dist', 'Number of health centers by type'),
]


class IndicatorWidgetsBlock(blocks.StreamBlock):
    free_form = blocks.StructBlock(
        [
            ('label', blocks.CharBlock(required=False,
                                       help_text="This widget's tab label on the indicator")),
            ('title', blocks.CharBlock(required=False)),
            ('hide_title', blocks.BooleanBlock(default=False, required=False)),
            ('body', blocks.RichTextBlock(required=False)),
            ('sdg', blocks.ChoiceBlock(required=False, choices=sdg_choices,
                                       label='SDG Goal')),
            ('source', blocks.RichTextBlock(
                features=['link'], required=False)),
        ],
        icon='snippet',
        template='takwimu/_includes/dataview/freeform.html'
    )

    data_indicator = DataIndicatorChooserBlock()

    embed = blocks.StructBlock(
        [
            ('label', blocks.CharBlock(required=False,
                                       help_text="This widget's tab label on the indicator")),
            ('title', blocks.CharBlock(required=False)),
            ('hide_title', blocks.BooleanBlock(default=False, required=False)),
            ('embed', EmbedBlock(required=False)),
            ('sdg', blocks.ChoiceBlock(required=False, choices=sdg_choices,
                                       label='SDG Goal')),
            ('source', blocks.RichTextBlock(
                features=['link'], required=False)),
        ],
        icon='media',
        template='takwimu/_includes/dataview/embed.html'
    )

    document = blocks.StructBlock(
        [
            ('label', blocks.CharBlock(required=False,
                                       help_text="This widget's tab label on the indicator")),
            ('title', blocks.CharBlock(required=False)),
            ('hide_title', blocks.BooleanBlock(default=False, required=False)),
            ('document', DocumentChooserBlock(required=False)),
            ('sdg', blocks.ChoiceBlock(required=False, choices=sdg_choices,
                                       label='SDG Goal')),
            ('source', blocks.RichTextBlock(
                features=['link'], required=False)),
        ],
        icon='doc-full',
        template='takwimu/_includes/dataview/document.html'
    )

    image = blocks.StructBlock(
        [
            ('label', blocks.CharBlock(required=False,
                                       help_text="This widget's tab label on the indicator")),
            ('title', blocks.CharBlock(required=False)),
            ('hide_title', blocks.BooleanBlock(default=False, required=False)),
            ('image', ImageChooserBlock(required=False)),
            ('caption', blocks.TextBlock(required=False)),
            ('sdg', blocks.ChoiceBlock(required=False,
                                       choices=sdg_choices, label='SDG Goal')),
            ('source', blocks.RichTextBlock(
                features=['link'], required=False)),
        ],
        icon='image',
        template='takwimu/_includes/dataview/image.html'
    )

    html = blocks.StructBlock(
        [
            ('label', blocks.CharBlock(required=False,
                                       help_text="This widget's tab label on the indicator")),
            ('title', blocks.CharBlock(required=False)),
            ('hide_title', blocks.BooleanBlock(default=False, required=False)),
            ('raw_html', blocks.RawHTMLBlock(required=False)),
            ('sdg', blocks.ChoiceBlock(required=False, choices=sdg_choices,
                                       label='SDG Goal')),
            ('source', blocks.RichTextBlock(
                features=['link'], required=False)),
        ],
        icon='code',
        template='takwimu/_includes/dataview/code.html'
    )

    hurumap = blocks.StructBlock(
        [
            ('label', blocks.CharBlock(required=False,
                                       help_text="This widget's tab label on the indicator")),
            ('title', blocks.CharBlock(required=False)),
            ('hide_title', blocks.BooleanBlock(default=False, required=False)),
            ('subtitle', blocks.CharBlock(required=False)),
            ('data_country', blocks.ChoiceBlock(required=True,
                                                choices=[
                                                    ('ET', 'Ethiopia'),
                                                    ('KE', 'Kenya'),
                                                    ('NG', 'Nigeria'),
                                                    ('SN', 'Senegal'),
                                                    ('TZ', 'Tanzania'),
                                                ],
                                                label='Country')),
            ('sdg', blocks.ChoiceBlock(required=False, choices=sdg_choices,
                                       label='SDG Goal')),
            ('data_id', blocks.ChoiceBlock(required=True,
                                           choices=HURUMAP_DATA_DISTS,
                                           label='Data')),
            ('chart_type', blocks.ChoiceBlock(required=True,
                                              choices=[
                                                  ('histogram', 'Histogram'),
                                                  ('pie', 'Pie Chart'),
                                                  ('grouped_column',
                                                   'Grouped Column')
                                              ],
                                              label='Chart Type')),
            ('data_stat_type', blocks.ChoiceBlock(required=True,
                                                  choices=[
                                                      ('percentage',
                                                       'Percentage'),
                                                      ('scaled-percentage',
                                                       'Scaled Percentage'),
                                                      ('dollar', 'Dollar')
                                                  ],
                                                  label='Stat Type')),
            ('data_source_link', blocks.URLBlock(
                required=False, label='Source URL')),
            ('data_source_title', blocks.CharBlock(
                required=False, label='Source Title')),
            ('chart_qualifier', blocks.RichTextBlock(features=['h5', 'h6', 'ol', 'ul', 'bold', 'italic', 'hr', 'link'],
                                                     required=False, label='Chart Qualifier',
                                                     help_text='Chart context e.g. legend, universe, etc.')),
            ('chart_height', blocks.IntegerBlock(required=False,
                                                 label='Chart Height',
                                                 help_text='Default is 300px')),
            ('widget_height', blocks.IntegerBlock(required=False,
                                                  label='Widget Height',
                                                  help_text='Default is 450px')),
        ],
        icon='code',
        template='takwimu/_includes/dataview/hurumap.html'
    )

    entities = blocks.StructBlock(
        [
            ('label', blocks.CharBlock(required=False,
                                       help_text="This widget's tab label on the indicator")),
            ('title', blocks.CharBlock(required=False)),
            ('hide_title', blocks.BooleanBlock(default=False, required=False)),
            ('entities', blocks.ListBlock(EntityStructBlock())),
            ('source', blocks.RichTextBlock(
                features=['link'], required=False)),
        ],
        icon='group',
        template='takwimu/_includes/dataview/entities.html'
    )

    class Meta:
        icon = 'form'


class IndicatorBlock(blocks.StructBlock):
    title = blocks.CharBlock(required=False)
    widgets = IndicatorWidgetsBlock(required=False)


class IconChoiceBlock(blocks.FieldBlock):
    field = IconFormField(required=False)


class TopicBlock(blocks.StructBlock):
    title = blocks.CharBlock(required=False)
    icon = IconChoiceBlock(required=False)
    summary = blocks.RichTextBlock(required=False)
    body = blocks.RichTextBlock(required=False)

    indicators = blocks.StreamBlock([
        ('indicators', IndicatorBlock(required=False))
    ], required=False)

    def js_initializer(self):
        parent_initializer = super(TopicBlock, self).js_initializer()
        return "Topic(%s)" % parent_initializer

    @property
    def media(self):
        # need to pull in StructBlock's own js code as well as our fontawesome script for our icon
        return super(TopicBlock, self).media + forms.Media(
            js=['fontawesome/js/django_fontawesome.js',
                'fontawesome/select2/select2.min.js', 'js/dashboard.js'],
            css={'all': ['fontawesome/css/fontawesome-all.min.css',
                         'fontawesome/select2/select2.css',
                         'fontawesome/select2/select2-bootstrap.css']}
        )

    class Meta:
        icon = 'form'


TWITTER_CARD = (
    ('summary', 'Summary'),
    ('summary_large_image', 'Summary with image'),
    ('player', 'Media player'),
    ('app', 'Link to download app'),
)


class ProfileSectionPage(ModelMeta, Page):
    '''
    Profile Section Page
    -------------------
    After overview, each of the sections have the following structure
    '''
    description = models.TextField(blank=True)
    date = models.DateField("Last Updated", blank=True,
                            null=True, auto_now=True)
    body = StreamField([
        ('topic', TopicBlock())
    ], blank=True)

    # Social media: Twitter card

    twitter_card = models.CharField(
        max_length=255, choices=TWITTER_CARD, blank=True)
    promotion_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    tweet_creator = models.CharField(max_length=255, blank=True)

    _metadata = {
        'title': 'seo_title',
        'description': 'search_description',
        'twitter_card': 'twitter_card',
        'image': 'get_promotion_image',
        'twitter_creator': 'tweet_creator',
    }

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

    promote_panels = [
        MultiFieldPanel(Page.promote_panels, 'Common page configuration'),
        FieldPanel('twitter_card'),
        FieldPanel('tweet_creator'),
        ImageChooserPanel('promotion_image'),
    ]

    # Parent page / subpage type rules

    parent_page_types = ['takwimu.ProfilePage']
    subpage_types = []

    def get_context(self, request):
        context = super(ProfileSectionPage, self).get_context(request)

        context['meta'] = self.as_meta(request)
        return context

    def get_promotion_image(self):
        if self.promotion_image:
            return self.promotion_image.file.url


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


class ProfilePage(ModelMeta, Page):
    '''
    Profile Page
    -----------
    '''
    geo = models.ForeignKey(Geography, on_delete=models.SET_NULL,
                            blank=True, null=True, db_constraint=False,
                            limit_choices_to={'geo_level': 'country'})
    date = models.DateField("Last Updated", blank=True,
                            null=True, auto_now=True)
    document = models.ForeignKey(
        'wagtaildocs.Document',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    body = StreamField([
        ('topic', TopicBlock())
    ], blank=True)

    # Social media: Twitter card

    twitter_card = models.CharField(
        max_length=255, choices=TWITTER_CARD, blank=True)
    promotion_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    tweet_creator = models.CharField(max_length=255, blank=True)

    _metadata = {
        'title': 'seo_title',
        'description': 'search_description',
        'twitter_card': 'twitter_card',
        'image': 'get_promotion_image',
        'twitter_creator': 'tweet_creator',
    }

    # Search index configuration

    search_fields = Page.search_fields + [
        index.FilterField('geo'),
        index.SearchField('body'),
    ]

    # Editor panels configuration

    content_panels = Page.content_panels + [
        FieldPanel('geo'),
        DocumentChooserPanel('document'),
        StreamFieldPanel('body'),
        InlinePanel('sections', label="Sections"),
    ]

    promote_panels = [
        MultiFieldPanel(Page.promote_panels, 'Common page configuration'),
        FieldPanel('twitter_card'),
        FieldPanel('tweet_creator'),
        ImageChooserPanel('promotion_image'),
    ]

    # Parent page / subpage type rules

    subpage_types = ['takwimu.ProfileSectionPage']

    def get_absolute_url(self):
        return self.full_url

    def get_context(self, request):
        context = super(ProfilePage, self).get_context(request)

        context['meta'] = self.as_meta(request)
        return context

    def get_promotion_image(self):
        if self.promotion_image:
            return self.promotion_image.file.url


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


class Testimonial(models.Model):
    name = models.CharField(max_length=255)
    title = models.TextField()
    quote = models.TextField()
    photo = models.ImageField(blank=True, upload_to='testimonials/')

    def __str__(self):
        return self.quote.encode('utf8')


class ExplainerSteps(Page):
    sidebar = RichTextField()  # TODO: Remove
    steps = StreamField([
        ('step', blocks.StructBlock([
            ('title', blocks.CharBlock(required=False)),
            ('brief', blocks.TextBlock(required=False)),
            ('color',
             blocks.CharBlock(required=False, help_text='Background colour.')),
            ('body', blocks.RichTextBlock(required=False)),
            ('sidebar', blocks.RichTextBlock(required=False)),
        ], icon='user'))
    ])

    content_panels = Page.content_panels + [
        FieldPanel('sidebar'),
        StreamFieldPanel('steps'),
    ]


class FAQ(index.Indexed, models.Model):
    """ Frequently asked questions model.

    .. note:: Deprecated in 0_2_0
        `FAQ` will be removed in 0_3_0. It has been placed with
        `FAQSetting` which supports ordering.
    """

    question = models.TextField()
    answer = RichTextField()
    cta_one_url = models.URLField(
        "'Find Out More' button URL", default="https://takwimu.zendesk.com/")
    cta_two_name = models.TextField(
        "Second button Name (optional)", blank=True)
    cta_two_url = models.URLField("Second button URL (optional)", blank=True)

    search_fields = [
        index.SearchField('question'),
        index.SearchField('answer'),
    ]

    def __str__(self):
        return self.question.encode('ascii', 'ignore')


#
# Settings
#

@register_setting
class SupportSetting(BaseSetting):
    hello = models.EmailField(blank=True, null=True,
                              help_text='TAKWIMU main email address')
    support = models.EmailField(blank=True, null=True,
                                help_text='TAKWIMU support email address')
    zendesk = models.URLField(blank=True, null=True,
                              help_text='TAKWIMU Zendesk account URL')
    community = models.URLField(blank=True, null=True,
                                help_text='TAKWIMU Community forums URL')
    address = RichTextField(blank=True, null=True,
                            help_text='TAKWIMU address')

    class Meta:
        verbose_name = 'Support'


@register_setting
class SocialMediaSetting(BaseSetting):
    facebook = models.URLField(blank=True, null=True,
                               help_text='TAKWIMU Facebook page URL')
    github = models.URLField(blank=True, null=True,
                             help_text='TAKWIMU Github page URL')
    instagram = models.URLField(blank=True, null=True,
                                max_length=255,
                                help_text='TAKWIMU Instagram account URL')
    linkedin = models.URLField(blank=True, null=True,
                               max_length=255,
                               help_text='TAKWIMU LinkedIn account URL')
    medium = models.URLField(blank=True, null=True,
                             help_text='TAKWIMU Medium page URL')
    twitter = models.URLField(blank=True, null=True,
                              help_text='TAKWIMU Twitter account URL')
    youtube = models.URLField(blank=True, null=True,
                              help_text='TAKWIMU YouTube channel or account URL')

    class Meta:
        verbose_name = 'Social Media'


@register_setting
class AboutUsSetting(BaseSetting):
    about_us = RichTextField()

    class Meta:
        verbose_name = 'About Us'


class ServiceBlock(blocks.StructBlock):
    SERVICE_CATEGORIES = [
        ('Standard', 'Standard'), ('Premium', 'Premium'), ('Persona', 'Persona')
    ]

    title = blocks.CharBlock(required=True)
    icon = IconChoiceBlock(required=False)
    cover = ImageChooserBlock(
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
        required=False
    )
    description = blocks.RichTextBlock(required=True)
    category = blocks.ChoiceBlock(
        max_length=20,
        choices=SERVICE_CATEGORIES,
        default='Standard'
    )

    class Meta:
        icon = 'form'


@register_setting
class SupportServicesSetting(BaseSetting):
    services = StreamField([
        ('service', ServiceBlock())
    ], blank=True)

    panels = [
        StreamFieldPanel('services')
    ]

    class Meta:
        verbose_name = 'Support Services'


class FAQBlock(blocks.StructBlock):
    question = blocks.CharBlock(required=True)
    answer = blocks.RichTextBlock(required=True)
    cta_one_url = blocks.URLBlock(
        label="'Find Out More' Button URL",
        default="https://takwimu.zendesk.com/")
    cta_two_name = blocks.CharBlock(
        label="Second Button Name (Optional)", required=False)
    cta_two_url = blocks.URLBlock(
        label="Second Button URL (Optional)", required=False)


@register_setting
class FAQSetting(BaseSetting):
    faqs = StreamField([
        ('faq', FAQBlock())
    ], blank=True)

    panels = [
        StreamFieldPanel('faqs')
    ]

    class Meta:
        verbose_name = 'FAQ'


COUNTRIES = OrderedDict()
COUNTRIES['BF'] = {
    'iso_name': 'Burkina Faso',
    'name': 'Burkina Faso',
    'short_name': 'Burkina Faso',
}
COUNTRIES['CD'] = {
    'iso_name': 'Congo, the Democratic Republic of the',
    'name': 'Democratic Republic of Congo',
    'short_name': 'DR Congo',
}
COUNTRIES['ET'] = {
    'iso_name': 'Ethiopia',
    'name': 'Ethiopia',
    'short_name': 'Ethiopia',
}
COUNTRIES['KE'] = {
    'iso_name': 'Kenya',
    'name': 'Kenya',
    'short_name': 'Kenya',
}
COUNTRIES['NG'] = {
    'iso_name': 'Nigeria',
    'name': 'Nigeria',
    'short_name': 'Nigeria',
}
COUNTRIES['SN'] = {
    'iso_name': 'Senegal',
    'name': 'Senegal',
    'short_name': 'Senegal',
}
COUNTRIES['ZA'] = {
    'iso_name': 'South Africa',
    'name': 'South Africa',
    'short_name': 'South Africa',
}
COUNTRIES['TZ'] = {
    'iso_name': 'Tanzania, United Republic of',
    'name': 'Tanzania',
    'short_name': 'Tanzania',
}
COUNTRIES['UG'] = {
    'iso_name': 'Uganda',
    'name': 'Uganda',
    'short_name': 'Uganda',
}
COUNTRIES['ZM'] = {
    'iso_name': 'Zambia',
    'name': 'Zambia',
    'short_name': 'Zambia',
}


@register_setting
class CountryProfilesSetting(BaseSetting):
    BF = models.BooleanField(COUNTRIES['BF']['iso_name'], default=True)
    CD = models.BooleanField(COUNTRIES['CD']['iso_name'], default=True)
    ET = models.BooleanField(COUNTRIES['ET']['iso_name'], default=True)
    KE = models.BooleanField(COUNTRIES['KE']['iso_name'], default=True)
    NG = models.BooleanField(COUNTRIES['NG']['iso_name'], default=True)
    SN = models.BooleanField(COUNTRIES['SN']['iso_name'], default=True)
    ZA = models.BooleanField(COUNTRIES['ZA']['iso_name'], default=True)
    TZ = models.BooleanField(COUNTRIES['TZ']['iso_name'], default=True)
    UG = models.BooleanField(COUNTRIES['UG']['iso_name'], default=False)
    ZM = models.BooleanField(COUNTRIES['ZM']['iso_name'], default=False)

    class Meta:
        verbose_name = 'Country Profiles'
