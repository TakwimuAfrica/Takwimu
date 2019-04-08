import json
import logging

from django import forms
from django.db import models
from django.utils.html import format_html
from django.utils.text import slugify
from fontawesome.fields import IconField
from fontawesome.forms import IconFormField
from hurumap.models import DataIndicator
from meta.models import ModelMeta
from modelcluster.fields import ParentalKey
from rest_framework import serializers
from wagtail.admin.edit_handlers import (FieldPanel, InlinePanel,
                                         MultiFieldPanel, PageChooserPanel,
                                         StreamFieldPanel)
from wagtail.api import APIField
from wagtail.contrib.settings.context_processors import settings
from wagtail.contrib.settings.models import BaseSetting, register_setting
from wagtail.core import blocks
from wagtail.core.fields import RichTextField, StreamField
from wagtail.core.models import Orderable, Page
from wagtail.documents.blocks import DocumentChooserBlock
from wagtail.documents.edit_handlers import DocumentChooserPanel
from wagtail.contrib.settings.context_processors import settings as wagtail_settings
from wagtail.embeds.blocks import EmbedBlock
from wagtail.images.blocks import ImageChooserBlock
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.search import index
from wazimap.models import Geography

from takwimu.utils.helpers import (COUNTRIES, get_takwimu_countries,
                                   get_takwimu_stories)

logger = logging.getLogger(__name__)

json_data = open('takwimu/fixtures/sdg.json')
sdg_data = json.load(json_data)
sdg_choices = [(slugify(i.get('short')), i.get('short')) for i in sdg_data]
sdg_choices = [('', 'Please select an SDG')] + sdg_choices
country_choices = [(k, v['name']) for k, v in COUNTRIES.items()]


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
    ('worldbank-cereal_yield_kg_per_hectare', 'Cereal Yield in Kg Per Hectare'),
    ('worldbank-agricultural_land', 'Agricultural land (% of land area)'),
    ('worldbank-gini_index', 'GINI Index'),
    ('worldbank-access_to_basic_services',
     'People using at least basic drinking water services (% of population)'),
    ('worldbank-primary_school_enrollment',
     'School enrollment, primary, male (% gross)'),
    ('worldbank-account_ownership',
     'Account ownership at a financial institution or with a mobile-money-service provider, (% of population ages 15+)'),
    ('worldbank-youth_unemployment',
     'Unemployment, youth (% of labor force ages 15-24) (modeled ILO estimate)'),
    ('worldbank-adult_literacy_rate',
     'Literacy rate, adult (% of population ages 15 and above)'),
    ('worldbank-foreign_direct_investment_net_inflows',
     'Foreign direct investment, net inflows (% of GDP)'),
    ('worldbank-maternal_mortality',
     'Maternal mortality ratio (modeled estimate, per 100,000 live births)'),
    ('worldbank-hiv_prevalence', 'Prevalence of HIV, (% ages 15-24)'),
    ('worldbank-employment_to_population_ratio',
     'Employment to population ratio, 15+, (%) (modeled ILO estimate)'),
    ('worldbank-gdp_per_capita', 'GDP per capita (current US$)'),
    ('worldbank-primary_education_completion_rate',
     'Primary completion rate,(% of relevant age group)'),
    ('worldbank-secondary_school_enrollment',
     'School enrollment, secondary (% gross)'),
    ('worldbank-nurses_and_midwives', 'Nurses and midwives (per 1,000 people)'),
    ('worldbank-mobile_phone_subscriptions',
     'Mobile Phone Subscriptions(per 100 people)'),
    ('worldbank-gdp_per_capita_growth', 'GDP per capita growth (annual %)'),
    ('worldbank-prevalence_of_undernourishment',
     'Prevalence of undernourishment (% of population)'),
    ('worldbank-life_expectancy_at_birth', 'Life Expectancy At Birth (Years)'),
    ('worldbank-tax_as_percentage_of_gdp', 'Tax As Percentage Of GDP'),
    ('worldbank-births_attended_by_skilled_health_staff',
     'Births Attended By Skilled Health Staff (% of total)'),
    ('worldbank-incidence_of_malaria_per_1000_pop_at_risk',
     'Incidence Of Malaria Per 1000 Population At Risk'),
    ('worldbank-tax_revenue', 'Tax revenue (current LCU)'),
    ('worldbank-gdp', 'GDP'),
    ('worldbank-gdp_growth', 'GDP Growth'),
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
            ('chart_qualifier', blocks.RichTextBlock(
                features=['h5', 'h6', 'ol', 'ul', 'bold', 'italic', 'hr',
                          'link'],
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

    api_fields = [
        APIField('description'),
        APIField('body'),
        APIField('promotion_image'),
    ]

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

    api_fields = [
        APIField('body'),
        APIField('description'),
        APIField('date'),
        APIField('promotion_image'),
        APIField('promotion_image_thumbnail'),
    ]

    def get_context(self, request):
        context = super(ProfileSectionPage, self).get_context(request)

        context['meta'] = self.as_meta(request)
        return context

    def get_promotion_image(self):
        if self.promotion_image:
            return self.promotion_image.file.url

    def __str__(self):
        return f"{self.get_parent().title} - {self.title}"


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
    api_fields = [
        APIField('title'),
        APIField('geo'),
        APIField('date'),
        APIField('document'),
        APIField('body'),
        APIField('promotion_image'),
        APIField('promotion_image_thumbnail'),
    ]

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

    api_fields = [APIField('content'), ]


class ContactUsPage(Page):
    address = RichTextField()

    content_panels = [
        FieldPanel('title'),
        FieldPanel('address'),
        InlinePanel('key_contacts', label='Key Contacts'),
        InlinePanel('social_media', label='Social Media')
    ]

    api_fields = [
        APIField('title'),
        APIField('address'),
        APIField('key_contacts'),
        APIField('social_media'),
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


class FeaturedDataBlock(blocks.StructBlock):
    title = blocks.CharBlock(required=False)
    country = blocks.ChoiceBlock(required=True,
                                 choices=[
                                     ('ET', 'Ethiopia'),
                                     ('KE', 'Kenya'),
                                     ('NG', 'Nigeria'),
                                     ('SN', 'Senegal'),
                                     ('TZ', 'Tanzania'),
                                 ],
                                 label='Country')
    data_id = blocks.ChoiceBlock(required=True,
                                 choices=HURUMAP_DATA_DISTS,
                                 label='Data')
    chart_type = blocks.ChoiceBlock(required=True,
                                    choices=[
                                        ('histogram', 'Histogram'),
                                        ('pie', 'Pie Chart'),
                                        ('grouped_column',
                                         'Grouped Column')
                                    ],
                                    label='Chart Type')
    data_stat_type = blocks.ChoiceBlock(required=True,
                                        choices=[
                                            ('percentage',
                                             'Percentage'),
                                            ('scaled-percentage',
                                             'Scaled Percentage'),
                                            ('dollar', 'Dollar')
                                        ],
                                        label='Stat Type')
    chart_height = blocks.IntegerBlock(required=False,
                                       label='Chart Height',
                                       help_text='Default is 300px')
    description = blocks.TextBlock(
        required=False, label='Description of the data')


class PageSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProfileSectionPage
        fields = ['title', 'description']


class FeaturedAnalysisBlock(blocks.StructBlock):
    name = 'featured_analysis'
    from_country = blocks.ChoiceBlock(choices=country_choices)
    featured_page = blocks.PageChooserBlock(target_model=ProfileSectionPage)

    def get_api_representation(self, value, context=None):
        return dict([
            ('from_country', value['from_country']),
            ('featured_page', PageSerializer(
                context=context).to_representation(value['featured_page']))
        ])


class IndexPage(ModelMeta, Page):
    """
    The process for integrating Wagtail into an existing project is definitely
    less polished than starting a project from Wagtail's built-in template.
    The project template comes with an editable HomePage model.
    When you add wagtail to an existing project, it automatically create a root
    page for your site that can not be edited or extended
    (https://github.com/wagtail/wagtail/issues/3992)
    """
    template = 'takwimu/home_page.html'
    featured_analysis = StreamField([
        ('featured_analysis', FeaturedAnalysisBlock())
    ], blank=True)

    featured_data = StreamField([
        ('featured_data', FeaturedDataBlock())
    ], blank=True)

    content_panels = Page.content_panels + [
        StreamFieldPanel('featured_analysis'),
        StreamFieldPanel('featured_data')
    ]

    api_fields = [
        APIField('featured_analysis'),
        APIField('featured_data')
    ]

    def get_context(self, request, *args, **kwargs):
        country_profile_settings = CountryProfilesSetting.for_site(
            request.site)
        published_status = country_profile_settings.__dict__

        context = super(IndexPage, self).get_context(request, *args, **kwargs)
        context['explainer_steps'] = ExplainerSteps.objects.first()
        context['faqs'] = FAQ.objects.all()
        context['testimonials'] = Testimonial.objects.all().order_by('-id')[:3]
        context.update(wagtail_settings(request))
        context.update(get_takwimu_countries(published_status))
        context.update(get_takwimu_stories())
        return context


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
