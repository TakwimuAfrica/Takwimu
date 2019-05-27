import json
import logging

from django import forms
from django.db import models
from django.utils.text import slugify
from fontawesome.fields import IconField
from fontawesome.forms import IconFormField
from hurumap.models import DataIndicator
from meta.models import ModelMeta
from modelcluster.fields import ParentalKey
from modelcluster.models import ClusterableModel
from rest_framework import serializers
from wagtail.admin.edit_handlers import (FieldPanel, InlinePanel,
                                         MultiFieldPanel, PageChooserPanel,
                                         StreamFieldPanel)
from wagtail.api import APIField
from wagtail.contrib.settings.models import BaseSetting, register_setting
from wagtail.core import blocks
from wagtail.core.fields import RichTextField, StreamField
from wagtail.core.models import Orderable, Page
from wagtail.core.templatetags import wagtailcore_tags
from wagtail.documents.models import Document
from wagtail.documents.blocks import DocumentChooserBlock
from wagtail.documents.edit_handlers import DocumentChooserPanel
from wagtail.contrib.settings.context_processors import settings as wagtail_settings
from wagtail.embeds.blocks import EmbedBlock
from wagtail.images import get_image_model
from wagtail.images.blocks import ImageChooserBlock
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.search import index
from wagtail.snippets.blocks import SnippetChooserBlock
from wagtail.snippets.models import register_snippet
from wazimap.models import Geography

from takwimu.models.data import ProfileData
from takwimu.models.utils.page import find_indicator_with_id_from_page, filter_rich_text
from takwimu.search import search
from takwimu.utils.helpers import (COUNTRIES,
                                   get_takwimu_stories, get_takwimu_faqs,
                                   get_takwimu_services, get_takwimu_profile_view_country_content,
                                   get_takwimu_profile_navigation, get_takwimu_profile_read_next)

logger = logging.getLogger(__name__)

INDICATOR_LAYOUT_HELP_TEXT= \
    ("'Default Layout' means Takwimu will try to pick either 'Half' or 'Full' "
     "width layout based on the indicator type and its content. Manually "
     "choose the layout if the Takwimu picked layout does not produce the "
     "desired results.")
DEFAULT_DESCRIPTION_TEXT = \
    ("Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
     "Integer et lorem eros. Integer vel venenatis urna. Nam vestibulum "
     "felis vitae scelerisque imperdiet. Nulla nisl libero, vestibulum eu "
     "lorem at, consequat finibus libero. Ut tincidunt rutrum purus vitae "
     "interdum. Phasellus efficitur tincidunt lorem ut blandit.")
DEFAULT_ABOUT_TEXT = \
    ("<p>People need accurate, objective information to make good decisions. "
     "However, uneven access to quality information weakens the impact of "
     "policy and programming in Africa as well as the ability of local "
     "development actors, particularly those with limited resources, to drive "
     "necessary change.</p><br/><p>Takwimu was launched in 2018 to empower "
     "African changemakers with the best data available and support their "
     "efforts to put this into effective use. We take a holistic view of what "
     "kinds of data are needed to drive change.</p><br/><p>Takwimu provides "
     "access to a growing body of national and sub-national statistics in the "
     "health, agriculture, education and financial inclusion sectors - "
     "combined with expert analysis of the key stakeholders, decision "
     "processes, policies, organisations and budgets that are driving "
     "development outcomes. All Takwimu content is visualised and packaged "
     "to be easily understood and freely shared.</p><br/><p>Takwimu currently "
     "covers 10 countries: Burkina Faso, Democratic Republic of Congo, "
     "Ethiopia, Kenya, Nigeria, Senegal, South Africa, Tanzania, Uganda and "
     "Zambia, in English and French. We&rsquo;re working to add more "
     "countries and additional languages. Takwimu is supported by the "
     "Bill &amp; Melinda Gates Foundation</p>")

json_data = open('takwimu/fixtures/sdg.json')
sdg_data = json.load(json_data)
sdg_choices = [(slugify(i.get('short')), i.get('short')) for i in sdg_data]
sdg_choices = [('', 'Please select an SDG')] + sdg_choices
country_choices = [(k, v['name']) for k, v in COUNTRIES.items()]


# Fix Geography __str__
def _geography__str__(self):
    return '{}'.format(self.name)

Geography.__str__ = _geography__str__


class DataByTopicPage(Page):
    country = models.OneToOneField(Geography, on_delete=models.SET_NULL,
                            null=True, db_constraint=False,
                            limit_choices_to={'geo_level': 'country'})
    description = RichTextField()

    content_panels = Page.content_panels + [
        FieldPanel('country'),
        FieldPanel('description')
    ]

    class Meta:
        verbose_name = 'Data by Topic'
        verbose_name_plural = 'Data by Topic'


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
    title = blocks.CharBlock()
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


class FlourishWidget(blocks.StructBlock):
    label = blocks.CharBlock(required=False, help_text="This widget's tab label on the indicator")
    title = blocks.CharBlock()
    hide_title = blocks.BooleanBlock(default=False, required=False)
    html = DocumentChooserBlock(required=True)
    sdg = blocks.ChoiceBlock(required=False, choices=sdg_choices, label='SDG Goal')
    source = blocks.RichTextBlock(features=['link'], required=False)

    class Meta:
        icon = 'folder-inverse'
        template = 'takwimu/_includes/dataview/code.html'


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

    flourish = FlourishWidget()

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
                                                  ('grouped_column', 'Grouped Column'),
                                              ],
                                              label='Chart Type')),
            ('data_stat_type', blocks.ChoiceBlock(required=True,
                                                  choices=[
                                                      ('dollar', 'Dollar'),
                                                      ('number', 'Number'),
                                                      ('percentage', 'Percentage'),
                                                      ('scaled-percentage', 'Scaled Percentage'),
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

    hurumap_snippet = SnippetChooserBlock(ProfileData)

    class Meta:
        icon = 'form'


class LayoutChoiceBlock(blocks.ChoiceBlock):
    choices = (
        ('auto', 'Default Layout'),
        ('half_width', 'Half Width Layout'),
        ('full_width', 'Full Width Layout'),
    )


class IndicatorBlock(blocks.StructBlock):
    title = blocks.CharBlock()
    widget = IndicatorWidgetsBlock(min_num=1, max_num=1)
    summary = blocks.RichTextBlock(required=False,
                                   default='')
    layout = LayoutChoiceBlock(default='auto', help_text=INDICATOR_LAYOUT_HELP_TEXT)

    # Since this block will only have only one of widget type, there is no need
    # to return a list; return the first item
    def get_api_representation(self, value, context=None):
        representation = super(IndicatorBlock, self).get_api_representation(value, context=context)
        if representation:
            widget = representation['widget'][0]
            if widget and widget['type'] == 'hurumap_snippet':
                snippet = ProfileData.objects.get(id=widget['value'])
                widget['value'] = {
                    'title': snippet.chart_title,
                    'data_country': snippet.country_iso_code,
                    'data_id': snippet.chart_id,
                    'chart_type': snippet.chart_type,
                    'data_stat_type': snippet.data_stat_type,
                    'chart_height': snippet.chart_height,
                    'description': snippet.description,
                }

                # For now lets use snippet summary as indicator summary until
                # we can figure out how to store indicator summary in
                # ProfileData
                representation['summary'] = snippet.summary
            representation['widget'] = widget

        return representation


class TopicBodyBlock(blocks.StreamBlock):
    text= blocks.RichTextBlock(required=False)
    indicator= IndicatorBlock(required=False)

    # Since `layout` isn't really a `value`, remove it from indicator `value`
    # and store it in indicator `meta` object
    def get_api_representation(self, value, context=None):
        representation = super(TopicBodyBlock, self).get_api_representation(value, context=context)
        for r in representation:
            if r['type'] == 'indicator':
                r['meta'] = { 'layout': r['value'].pop('layout', 'auto') }

        return representation


class IconChoiceBlock(blocks.FieldBlock):
    field = IconFormField(required=False)


class TopicBlock(blocks.StructBlock):
    title = blocks.CharBlock(required=False)
    icon = IconChoiceBlock(required=False)
    summary = blocks.RichTextBlock(required=False)
    body = TopicBodyBlock(required=False)

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


class CarouselTopic(blocks.StructBlock):
    title = blocks.CharBlock(required=False)
    icon = IconChoiceBlock(required=False)
    summary = blocks.RichTextBlock(required=False)
    body = blocks.ListBlock(EntityStructBlock())

    def js_initializer(self):
        parent_initializer = super(CarouselTopic, self).js_initializer()
        return "Topic(%s)" % parent_initializer

    @property
    def media(self):
        # need to pull in StructBlock's own js code as well as our fontawesome script for our icon
        return super(CarouselTopic, self).media + forms.Media(
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


class HeroContentBlock(blocks.StructBlock):
    title = blocks.CharBlock(default='Actionable insights for African changemakers', max_length=1024)
    tagline = blocks.RichTextBlock(default='<p>Data driven analysis on development policies, programmes & outcomes in 10 African countries <a href=\"/about\">find out more about us</a></p>')
    watch_video_link_label = blocks.CharBlock(default='Watch the overview video', max_length=1024)


class HeroBlock(blocks.StreamBlock):
    hero = HeroContentBlock()

    # This block is only there to ensure structural integrity: Skip it in API
    def get_api_representation(self, value, context=None):
        representation = super(HeroBlock, self).get_api_representation(value, context=context)
        if representation:
            return representation[0]
        return {}


class LinkBlock(blocks.StreamBlock):
    url = blocks.StructBlock([
        ('title', blocks.TextBlock()),
        ('link', blocks.URLBlock()),
    ],
        icon='link'
    )
    page = blocks.PageChooserBlock(required=False)

    # Since this block will only have one of url or page, there is no need
    # to return a list; return the first item & convert it to (title, link)
    # if it's a page
    def get_api_representation(self, value, context=None):
        representation = super(LinkBlock, self).get_api_representation(value, context=context)[0]
        if representation['type'] == 'page':
            representation['value'] = {
                'title': value[0].value.title,
                'link': value[0].value.get_url()
            }
        return representation

    class Meta:
        icon = 'cogs'


class LinkChooserBlock(blocks.StructBlock):
    link = LinkBlock(min_num=1, max_num=1, block_counts={'url': { 'max_num': 1 }, 'page': { 'max_num': 1 } })

    # This block is only there to ensure structural integrity: Skip it in API
    def get_api_representation(self, value, context=None):
        representation = super(LinkChooserBlock, self).get_api_representation(value, context=context)
        if representation:
            representation = representation['link']
        return representation


class RelatedLinkBlock(blocks.StreamBlock):
     related_link = LinkChooserBlock()


class RelatedContentLinksBlock(blocks.StructBlock):
    title = blocks.CharBlock(default="Related Content", max_length=1024)
    related_links = RelatedLinkBlock(max_num=10)


class RelatedContentBlock(blocks.StreamBlock):
    related_content_links = RelatedContentLinksBlock()

    # This block is only there to ensure structural integrity: Skip it in API
    def get_api_representation(self, value, context=None):
        representation = super(RelatedContentBlock, self).get_api_representation(value, context=context)
        if representation:
            return representation[0]
        return {}


class ProfileSectionPage(ModelMeta, Page):
    '''
    Profile Section Page
    -------------------
    After overview, each of the sections have the following structure
    '''
    description = RichTextField(blank=True)
    date = models.DateField("Last Updated", blank=True,
                            null=True, auto_now=True)
    body = StreamField([
        ('topic', TopicBlock()),
        ('carousel_topic', CarouselTopic())
    ], blank=True)
    related_content = StreamField(RelatedContentBlock(required=False, max_num=1), blank=True)

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
        APIField('country',
                 serializer=serializers.DictField(source='get_country')),
        APIField('description'),
        APIField('profile_navigation',
                 serializer=serializers.DictField(source='get_profile_navigation')),
        APIField('body'),
        APIField('read_next',
                 serializer=serializers.DictField(source='get_read_next')),
        APIField('view_country_content',
                 serializer=serializers.DictField(source='get_view_country_content')),
        APIField('related_content'),
        APIField('promotion_image'),
        APIField('date'),
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
        StreamFieldPanel('related_content'),
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

        if request.method == 'GET':
            indicator_id = request.GET.get('indicator', None)
            if indicator_id:
                indicator = self.find_indicator_with_id(indicator_id)
                if indicator:
                    context['twitter'] = self.get_twitter_meta(
                        indicator
                    )

        context['country'] = self.get_country()
        context['meta'] = self.as_meta(request)

        return context

    def find_indicator_with_id(self, indicator_id):
        indicator = find_indicator_with_id_from_page(indicator_id, self)
        if indicator:
            return indicator
        return None

    def get_twitter_meta(self, indicator):
        model = get_image_model()
        image = model.objects.filter(title=indicator["id"]).get()
        return {
            'image_url': image.get_rendition('width-600').url,
            'description': indicator["value"]["summary"] if indicator else '',
            'title': indicator["value"]["title"] if indicator else ''
        }

    def get_promotion_image(self):
        if self.promotion_image:
            return self.promotion_image.file.url

    def get_country(self):
        slug = self.get_parent().slug
        for code, names in COUNTRIES.items():
            if slug == slugify(names['name']):
                return {
                    'iso_code': code,
                    'name': names['name'],
                    'short_name': names['short_name'],
                    'slug': slugify(names['name'])
                }
        return {}

    def get_profile_navigation(self):
        profiles_settings = CountryProfilesSetting.for_site(self.get_site())
        return get_takwimu_profile_navigation(profiles_settings)

    def get_read_next(self):
        profiles_settings = CountryProfilesSetting.for_site(self.get_site())
        return get_takwimu_profile_read_next(profiles_settings)

    def get_view_country_content(self):
        profiles_settings = CountryProfilesSetting.for_site(self.get_site())
        return get_takwimu_profile_view_country_content(profiles_settings)

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
    label = models.CharField(default="Politics", max_length=1024, verbose_name='label',
        help_text="Title of profile name i.e. county name doesn't explain what the page contains")
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
        ('topic', TopicBlock()),
        ('carousel_topic', CarouselTopic())
    ], blank=True)
    related_content = StreamField(RelatedContentBlock(required=False, max_num=1), blank=True)

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
        APIField('country',
                 serializer=serializers.DictField(source='get_country')),
        APIField('title'),
        APIField('label'),
        APIField('geo'),
        APIField('date'),
        APIField('document'),
        APIField('profile_navigation',
                 serializer=serializers.DictField(source='get_profile_navigation')),
        APIField('body'),
        APIField('read_next',
                 serializer=serializers.DictField(source='get_read_next')),
        APIField('view_country_content',
                 serializer=serializers.DictField(source='get_view_country_content')),
        APIField('related_content'),
    ]

    # Search index configuration

    search_fields = Page.search_fields + [
        index.FilterField('geo'),
        index.SearchField('body'),
    ]

    # Editor panels configuration

    content_panels = Page.content_panels + [
        MultiFieldPanel([
                FieldPanel('label'),
            ],
            heading="Label",
            classname="collapsible",
        ),
        FieldPanel('geo'),
        DocumentChooserPanel('document'),
        StreamFieldPanel('body'),
        StreamFieldPanel('related_content'),
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

    def get_promotion_image(self):
        if self.promotion_image:
            return self.promotion_image.file.url

    def get_country(self):
        slug = self.slug
        for code, names in COUNTRIES.items():
            if slug == slugify(names['name']):
                return {
                    'iso_code': code,
                    'name': names['name'],
                    'short_name': names['short_name'],
                    'slug': slugify(names['name'])
                }
        return {}

    def get_profile_navigation(self):
        profiles_settings = CountryProfilesSetting.for_site(self.get_site())
        return get_takwimu_profile_navigation(profiles_settings)

    def get_read_next(self):
        profiles_settings = CountryProfilesSetting.for_site(self.get_site())
        return get_takwimu_profile_read_next(profiles_settings)

    def get_view_country_content(self):
        profiles_settings = CountryProfilesSetting.for_site(self.get_site())
        return get_takwimu_profile_view_country_content(profiles_settings)

    def get_absolute_url(self):
        return self.full_url

    def find_indicator_with_id(self, indicator_id):
        indicator = find_indicator_with_id_from_page(indicator_id, self)
        if indicator:
            return indicator
        return None

    def get_twitter_meta(self, indicator):
        model = get_image_model()
        image = model.objects.filter(title=indicator["id"]).get()
        return {
            'image_url': image.get_rendition('width-600').url,
            'description': indicator["value"]["summary"] if indicator else '',
            'title': indicator["value"]["title"] if indicator else ''
        }

    def get_context(self, request):
        context = super(ProfilePage, self).get_context(request)

        if request.method == 'GET':
            indicator_id = request.GET.get('indicator', None)
            if indicator_id:
                indicator = self.find_indicator_with_id(indicator_id)
                if indicator:
                    context['twitter'] = self.get_twitter_meta(
                        indicator
                    )

        context['country'] = self.get_country()
        profiles_settings = CountryProfilesSetting.for_site(self.get_site())
        context['meta'] = self.as_meta(request)

        return context


class AboutTakwimuContentBlock(blocks.StructBlock):
    label = blocks.CharBlock(default="About Takwimu", max_length=255,
                             help_text="Short title used in navigation, etc.")
    title = blocks.CharBlock(default="About Takwimu", max_length=1024)
    description = blocks.RichTextBlock(required=False, default=DEFAULT_ABOUT_TEXT)


class AboutTakwimuBlock(blocks.StreamBlock):
    about_takwimu_content = AboutTakwimuContentBlock()

    # This block is only there to ensure structural integrity: Skip it in API
    def get_api_representation(self, value, context=None):
        representation = super(AboutTakwimuBlock, self).get_api_representation(value, context=context)
        if representation:
            content = representation[0]
            description = content['value']['description']
            if description:
                content['value']['description'] = wagtailcore_tags.richtext(description)

            return content

        return {}


class MethodologyContentBlock(blocks.StructBlock):
    label = blocks.CharBlock(default="Methodology", max_length=255,
                             help_text="Short title used in navigation, etc.")
    title = blocks.CharBlock(default="Methodology", max_length=1024)
    description = blocks.RichTextBlock(required=False, default=DEFAULT_DESCRIPTION_TEXT)


class MethodologyBlock(blocks.StreamBlock):
    methodology_content = MethodologyContentBlock()

    # This block is only there to ensure structural integrity: Skip it in API
    def get_api_representation(self, value, context=None):
        representation = super(MethodologyBlock, self).get_api_representation(value, context=context)
        if representation:
            content = representation[0]
            description = content['value']['description']
            if description:
                content['value']['description'] = wagtailcore_tags.richtext(description)

            return content

        return {}

class AboutPage(ModelMeta, Page):
    content_navigation_title = models.CharField(default="On this page", max_length=1024, verbose_name='title')
    about_takwimu = StreamField(AboutTakwimuBlock(required=False, max_num=1), blank=True)
    methodology = StreamField(MethodologyBlock(required=False, max_num=1), blank=True)
    related_content = StreamField(RelatedContentBlock(required=False, max_num=1), blank=True)

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
        APIField('content_navigation',
                 serializer=serializers.DictField(source='get_content_navigation')),
        APIField('about_takwimu'),
        APIField('methodology'),
        APIField('services',
                 serializer=serializers.DictField(source='get_services')),
        APIField('faqs',
                 serializer=serializers.DictField(source='get_faqs')),
        APIField('related_content'),
    ]

    # Editor panels configuration

    content_panels = Page.content_panels + [
        MultiFieldPanel([
                FieldPanel('content_navigation_title'),
            ],
            heading="Content navigation",
            classname="collapsible",
        ),
        StreamFieldPanel('about_takwimu'),
        StreamFieldPanel('methodology'),
        StreamFieldPanel('related_content'),
    ]
    promote_panels = [
        MultiFieldPanel(Page.promote_panels, 'Common page configuration'),
        FieldPanel('twitter_card'),
        FieldPanel('tweet_creator'),
        ImageChooserPanel('promotion_image'),
    ]

    def get_promotion_image(self):
        if self.promotion_image:
            return self.promotion_image.file.url

    def get_context(self, request):
        context = super(AboutPage, self).get_context(request)

        context['active_content'] = 'about'
        context['meta'] = self.as_meta(request)
        return context

    def get_content_navigation(self):
        return {
            'type': 'content_navigation',
            'value': {
                'title': self.content_navigation_title
            }
        }

    def get_services(self):
        service_settings = SupportServicesSetting.for_site(self.get_site())

        return get_takwimu_services(service_settings)

    def get_faqs(self):
        faq_settings = FAQSetting.for_site(self.get_site())

        return get_takwimu_faqs(faq_settings)


class TermsContentBlock(blocks.StructBlock):
    label = blocks.CharBlock(default="Terms", max_length=255,
                             help_text="Short title used in navigation, etc.")
    title = blocks.CharBlock(default="Terms of use", max_length=1024)
    description = blocks.RichTextBlock(default=DEFAULT_DESCRIPTION_TEXT)


class TermsBlock(blocks.StreamBlock):
    terms = TermsContentBlock()

    def get_api_representation(self, value, context=None):
        representation = super(TermsBlock, self).get_api_representation(value, context=context)
        if representation:
            content = representation[0]
            description = content['value']['description']
            if description:
                content['value']['description'] = filter_rich_text(description)

            return content

        return {}


class PrivacyPolicyContentBlock(blocks.StructBlock):
    label = blocks.CharBlock(default="Privacy", max_length=255,
                             help_text="Short title used in navigation, etc.")
    title = blocks.CharBlock(default="Privacy policy", max_length=1024)
    description = blocks.RichTextBlock(default=DEFAULT_DESCRIPTION_TEXT)


class PrivacyPolicyBlock(blocks.StreamBlock):
    privacy = PrivacyPolicyContentBlock()

    def get_api_representation(self, value, context=None):
        representation = super(PrivacyPolicyBlock, self).get_api_representation(value, context=context)
        if representation:
            content = representation[0]
            description = content['value']['description']
            if description:
                content['value']['description'] = filter_rich_text(description)

            return content

        return {}


class LegalBodyBlock(blocks.StreamBlock):
    terms = TermsBlock(max_num=1)
    privacy_policy = PrivacyPolicyBlock(max_num=1)

    # This block is only there to ensure structural integrity: Skip it in API
    def get_api_representation(self, value, context=None):
        representation = super(LegalBodyBlock, self).get_api_representation(value, context=context)
        for i, r in enumerate(representation):
            representation[i] = r['value']

        return representation


class LegalPage(ModelMeta, Page):
    content_navigation_title = models.CharField(default="On this page", max_length=1024, verbose_name='title')
    body = StreamField(LegalBodyBlock(max_num=2, block_counts={'terms': { 'max_num':1 }, 'privacy_policy': { 'max_num':1 }}))
    related_content = StreamField(RelatedContentBlock(required=False, max_num=1), blank=True)

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
        APIField('content_navigation',
                 serializer=serializers.DictField(source='get_content_navigation')),
        APIField('body'),
        APIField('related_content'),
    ]

    # Editor panels configuration

    content_panels = Page.content_panels + [
        MultiFieldPanel([
                FieldPanel('content_navigation_title'),
            ],
            heading="Content navigation",
            classname="collapsible",
        ),
        StreamFieldPanel('body'),
        StreamFieldPanel('related_content'),
    ]
    promote_panels = [
        MultiFieldPanel(Page.promote_panels, 'Common page configuration'),
        FieldPanel('twitter_card'),
        FieldPanel('tweet_creator'),
        ImageChooserPanel('promotion_image'),
    ]

    def get_promotion_image(self):
        if self.promotion_image:
            return self.promotion_image.file.url

    def get_context(self, request):
        context = super(LegalPage, self).get_context(request)

        context['meta'] = self.as_meta(request)
        return context

    def get_content_navigation(self):
        return {
            'type': 'content_navigation',
            'value': {
                'title': self.content_navigation_title
            }
        }


class ContactAddressContentBlock(blocks.StructBlock):
    label = blocks.CharBlock(default="Address", max_length=255,
                             help_text="Short title used in navigation, etc.")
    title = blocks.CharBlock(default="Address", max_length=1024)
    description = blocks.RichTextBlock(required=False,
        default='<p>africapractice East Africa Ltd<br/>P.O Box 40868 – 00100<br/>Mitsumi Business Park, 7th Floor<br/>Muthithi Road, Westlands</p><p></p><p>Nairobi, Kenya</p>')


class ContactAddressBlock(blocks.StreamBlock):
    contact_address_content = ContactAddressContentBlock()

    # This block is only there to ensure structural integrity: Skip it in API
    def get_api_representation(self, value, context=None):
        representation = super(ContactAddressBlock, self).get_api_representation(value, context=context)
        if representation:
            return representation[0]
        return {}


@register_snippet
class KeyContacts(ClusterableModel):
    name = models.CharField(default="Default", max_length=1024,
        help_text="If you're planning to maintain more than one list of contacts, then provide a unique name for this list")
    label = models.CharField(default="Key contacts", max_length=255,
                             help_text="Short title used in navigation, etc.")
    title = models.CharField(default="Key contacts", max_length=1024)

    panels = [
        FieldPanel('name'),
        FieldPanel('label'),
        FieldPanel('title'),
        InlinePanel('contacts', label='Contacts'),
    ]

    def __str__(self):
        return '{}'.format(self.name)

    class Meta:
        verbose_name = 'Contact Us | Key Contacts'
        verbose_name_plural = 'Contact Us | Key Contacts'


class KeyContact(Orderable):
    title = models.TextField()
    contact_details = models.TextField()
    link = models.TextField()
    parent = ParentalKey(KeyContacts, related_name='contacts')

    api_fields = [
        APIField('title'),
        APIField('contact_details'),
        APIField('link'),
    ]


class KeyContactsBlock(blocks.StreamBlock):
    key_contacts = SnippetChooserBlock(KeyContacts)

    # This block is only there to ensure structural integrity: Skip it in API
    def get_api_representation(self, value, context=None):
        representation = super(KeyContactsBlock, self).get_api_representation(value, context=context)
        if representation:
            block = representation[0]
            snippet = KeyContacts.objects.get(id=block['value'])
            block['value'] = {
                'label': snippet.label,
                'title': snippet.title,
                'contacts': [{ 'title': c.title, 'contact_details': c.contact_details, 'link': c.link } for c in snippet.contacts.all()],
            }
            return block
        return {}


@register_snippet
class SocialMedia(ClusterableModel):
    name = models.CharField(default="Default", max_length=1024,
        help_text="If you're planning to maintain more than one list of contacts, then provide a unique name for this list")
    label = models.CharField(default="Social", max_length=255,
                             help_text="Short title used in navigation, etc.")
    title = models.CharField(default="Social", max_length=1024)

    panels = [
        FieldPanel('name'),
        FieldPanel('label'),
        FieldPanel('title'),
        InlinePanel('accounts', label='Social Media Accounts', help_text='Social media accounts to show on Contact page'),
    ]

    def __str__(self):
        return '{}'.format(self.name)

    class Meta:
        verbose_name = 'Contact Us | Social Media'
        verbose_name_plural = 'Contact Us | Social Media'


SOCIAL_MEDIA = (
    ('facebook', 'Facebook'),
    ('github', 'GitHub'),
    ('instagram', 'Instagram'),
    ('linkedin', 'LinkedIn'),
    ('medium', 'Medium'),
    ('twitter', 'Twitter'),
    ('youtube', 'YouTube'),
)


class SocialMediaAccount(Orderable):
    name = models.CharField(max_length=255, choices=SOCIAL_MEDIA)
    parent = ParentalKey(SocialMedia, related_name='accounts')

    api_fields = [
        APIField('name'),
    ]

    def __str__(self):
        return self.name


class SocialMediaBlock(blocks.StreamBlock):
    social_media = SnippetChooserBlock(SocialMedia)

    # This block is only there to ensure structural integrity: Skip it in API
    def get_api_representation(self, value, context=None):
        representation = super(SocialMediaBlock, self).get_api_representation(value, context=context)
        if representation:
            block = representation[0]
            snippet = SocialMedia.objects.get(id=block['value'])
            block['value'] = {
                'label': snippet.label,
                'title': snippet.title,
                'accounts': [{ 'name': a.name } for a in snippet.accounts.all()],
            }
            return block
        return {}


class ContactPage(ModelMeta, Page):
    address = StreamField(ContactAddressBlock(required=False, max_num=1), blank=True)
    social_media = StreamField(SocialMediaBlock(required=False, max_num=1), blank=True)
    key_contacts = StreamField(KeyContactsBlock(required=False, max_num=1), blank=True)
    related_content = StreamField(RelatedContentBlock(required=False, max_num=1), blank=True)

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

    # Editor panels configuration

    content_panels = Page.content_panels + [
        StreamFieldPanel('address'),
        StreamFieldPanel('key_contacts'),
        StreamFieldPanel('social_media'),
        StreamFieldPanel('related_content'),
    ]
    promote_panels = [
        MultiFieldPanel(Page.promote_panels, 'Common page configuration'),
        FieldPanel('twitter_card'),
        FieldPanel('tweet_creator'),
        ImageChooserPanel('promotion_image'),
    ]

    api_fields = [
        APIField('title'),
        APIField('address'),
        APIField('key_contacts'),
        APIField('social_media'),
        APIField('related_content'),
    ]


def search_analysis_and_data(query, request):
    hits = search(query)
    if not hits:
        return []

    profile_pages = ProfilePage.objects.live()
    profile_section_pages = ProfileSectionPage.objects.live()
    results = []
    for hit in hits:
        parent_page_id = hit['parent_page_id']
        if parent_page_id:
            page = None
            if hit['parent_page_type'] == 'ProfileSectionPage':
                page = profile_section_pages.get(id=parent_page_id)
            elif hit['parent_page_type'] == 'ProfilePage':
                page = profile_pages.get(id=parent_page_id)

            if page:
                hit['link'] = page.get_url(request)
            else:
                hit['link'] = '/'
        results.append({ 'type': 'search_result', 'value': hit })
    return results


class SearchPage(Page):
    def get_context(self, request):
        context = super(SearchPage, self).get_context(request)

        query = request.GET.get('q', '')
        results = search_analysis_and_data(query, request)
        context['search'] = {
            'query': query,
            'results': results
        }
        return context


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


# HURUmap style widget for FeaturedData.
class FeaturedDataWidgetBlock(blocks.StructBlock):
    title = blocks.CharBlock(required=True, default="")
    data_country = blocks.ChoiceBlock(required=True,
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
                                        ('grouped_column', 'Grouped Column'),
                                    ],
                                    label='Chart Type')
    data_stat_type = blocks.ChoiceBlock(required=True,
                                        choices=[
                                            ('dollar', 'Dollar'),
                                            ('number', 'Number'),
                                            ('percentage', 'Percentage'),
                                            ('scaled-percentage', 'Scaled Percentage'),
                                        ],
                                        label='Stat Type')
    chart_height = blocks.IntegerBlock(required=False,
                                       label='Chart Height',
                                       help_text='Default is 300px')
    description = blocks.TextBlock(
        required=False, label='Description of the data')


class FeaturedDataWidgetChooserBlock(blocks.StreamBlock):
    hurumap_snippet = SnippetChooserBlock(ProfileData)
    flourish = FlourishWidget()
    hurumap = FeaturedDataWidgetBlock()


# FeaturedDataIndicator is structurally similar to Indicator as in they both
# made up various widgets. For now, FeaturedDataIndicator only supports
# HURUmap type of widgets via FeaturedDataWidget
class FeaturedDataIndicatorBlock(blocks.StructBlock):
    widget = FeaturedDataWidgetChooserBlock(min_num=1, max_num=1)

    # Since this block will only have only one of widget type, there is no need
    # to return a list; return the first item
    def get_api_representation(self, value, context=None):
        representation = super(FeaturedDataIndicatorBlock, self).get_api_representation(value, context=context)
        if representation:
            widget = representation['widget'][0]
            if widget and widget['type'] == 'hurumap_snippet':
                snippet = ProfileData.objects.get(id=widget['value'])
                widget['value'] = {
                    'title': snippet.chart_title,
                    'data_country': snippet.country_iso_code,
                    'data_id': snippet.chart_id,
                    'chart_type': snippet.chart_type,
                    'data_stat_type': snippet.data_stat_type,
                    'chart_height': snippet.chart_height,
                    'description': snippet.description,
                }
            representation['widget'] = widget

        return representation


class FeaturedDataIndicatorsBlock(blocks.StreamBlock):
    indicator = FeaturedDataIndicatorBlock()

    # FeaturedDataIndicator **must** be displayed at 'half_width' per design
    def get_api_representation(self, value, context=None):
        representation = super(FeaturedDataIndicatorsBlock, self).get_api_representation(value, context=context)
        for r in representation:
            r['meta'] = { 'layout': 'half_width' }

        return representation


class FeaturedDataContentBlock(blocks.StructBlock):
    title = blocks.CharBlock(default='Featured Data', max_length=1024)
    featured_data = FeaturedDataIndicatorsBlock(max_num=2)


class FeaturedDataBlock(blocks.StreamBlock):
    featured_data_content = FeaturedDataContentBlock()

    # This block is only there to ensure structural integrity: Skip it in API
    def get_api_representation(self, value, context=None):
        representation = super(FeaturedDataBlock, self).get_api_representation(value, context=context)
        if representation:
            return representation[0]
        return {}


class PageSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProfileSectionPage
        fields = ['title', 'description', 'slug']


class FeaturedAnalysisPageBlock(blocks.StructBlock):
    name = 'featured_analysis'
    featured_page = blocks.PageChooserBlock(target_model=ProfileSectionPage)
    from_country = blocks.ChoiceBlock(
        choices=country_choices, help_text="This is for labelling only.")

    def get_api_representation(self, value, context=None):
        representation = PageSerializer(
            context=context).to_representation(value['featured_page'])
        country_slug = value['featured_page'].get_parent().slug
        country_code, = [
            code for (code, country) in COUNTRIES.items() if slugify(country['name']) == country_slug]
        country = {
            'iso_code': country_code,
            'slug': country_slug,
        }
        representation['country'] = country
        return representation

class FeaturedAnalysisPageChooserBlock(blocks.StreamBlock):
    featured_analysis_page = FeaturedAnalysisPageBlock()

class FeaturedAnalysisContentBlock(blocks.StructBlock):
    title = blocks.CharBlock(default='Featured Analysis', max_length=1024)
    featured_analyses = FeaturedAnalysisPageChooserBlock(max_num=3)
    read_analysis_link_label = blocks.CharBlock(default='Read the full analysis', max_length=1024)
    view_profile_link_label = blocks.CharBlock(default='View country profile', max_length=1024)

class FeaturedAnalysisBlock(blocks.StreamBlock):
    featured_analysis_content = FeaturedAnalysisContentBlock()

    # This block is only there to ensure structural integrity: Skip it in API
    def get_api_representation(self, value, context=None):
        representation = super(FeaturedAnalysisBlock, self).get_api_representation(value, context=context)
        if representation:
            return representation[0]
        return {}

class UseOfTakwimuBlock(blocks.StructBlock):
    title = blocks.CharBlock(max_length=1024)
    description = blocks.TextBlock(required=False, default="Lorem ipsum dolor sit amet, adipiscing elitauris con lorem ipsum dolor sit amet.")


class UsesOfTakwimuBlock(blocks.StreamBlock):
    use_of_takwimu = UseOfTakwimuBlock()


class WhatYouCanDoWithTakwimuContentBlock(blocks.StructBlock):
    title = blocks.CharBlock(default="What you can do with Takwimu", max_length=1024)
    uses_of_takwimu = UsesOfTakwimuBlock(max_num=3)


class WhatYouCanDoWithTakwimuBlock(blocks.StreamBlock):
    what_you_can_do_with_takwimu_content = WhatYouCanDoWithTakwimuContentBlock()

    # This block is only there to ensure structural integrity: Skip it in API
    def get_api_representation(self, value, context=None):
        representation = super(WhatYouCanDoWithTakwimuBlock, self).get_api_representation(value, context=context)
        if representation:
            return representation[0]
        return {}


class MakingOfTakwimuContentBlock(blocks.StructBlock):
    title = blocks.CharBlock(default="The Making of Takwimu", max_length=1024)
    description = blocks.RichTextBlock(required=False, default="<p>Highlights from the Takwimu design sprint at iHub Kenya.</p>")
    link = blocks.URLBlock(default="https://www.youtube-nocookie.com/embed/DvDCCETHsTo")


class MakingOfTakwimuBlock(blocks.StreamBlock):
    making_of_takwimu_content = MakingOfTakwimuContentBlock()

    # This block is only there to ensure structural integrity: Skip it in API
    def get_api_representation(self, value, context=None):
        representation = super(MakingOfTakwimuBlock, self).get_api_representation(value, context=context)
        if representation:
            return representation[0]
        return {}


class LatestNewsStoriesContentBlock(blocks.StructBlock):
    title = blocks.CharBlock(default="Latest News & Stories", max_length=1024)
    description = blocks.RichTextBlock(required=False, default="<p>Lorem ipsum dolor sit amet, adipiscing elitauris con lorem ipsum dolor sit amet.</p>")
    read_more_link_label = blocks.CharBlock(default="Read more stories on Medium", max_length=1024)


class LatestNewsStoriesBlock(blocks.StreamBlock):
    latest_news_stories_content = LatestNewsStoriesContentBlock()

    # This block is only there to ensure structural integrity: Skip it in API
    def get_api_representation(self, value, context=None):
        representation = super(LatestNewsStoriesBlock, self).get_api_representation(value, context=context)
        if representation:
            return representation[0]
        return {}


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

    hero = StreamField(HeroBlock(required=False, max_num=1), blank=True)

    featured_analysis = StreamField(FeaturedAnalysisBlock(required=False, max_num=1), blank=True)

    featured_data = StreamField(FeaturedDataBlock(required=False, max_num=1), blank=True)

    what_you_can_do_with_takwimu = StreamField(WhatYouCanDoWithTakwimuBlock(required=False, max_num=1), blank=True)

    making_of_takwimu = StreamField(MakingOfTakwimuBlock(required=False, max_num=1), blank=True)

    latest_news_stories = StreamField(LatestNewsStoriesBlock(required=False, max_num=1), blank=True)

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

    content_panels = Page.content_panels + [
        StreamFieldPanel('hero'),
        StreamFieldPanel('featured_analysis'),
        StreamFieldPanel('featured_data'),
        StreamFieldPanel('what_you_can_do_with_takwimu'),
        StreamFieldPanel('making_of_takwimu'),
        StreamFieldPanel('latest_news_stories'),
    ]

    promote_panels = [
        MultiFieldPanel(Page.promote_panels, 'Common page configuration'),
        FieldPanel('twitter_card'),
        FieldPanel('tweet_creator'),
        ImageChooserPanel('promotion_image'),
    ]

    api_fields = [
        APIField('hero'),
        APIField('featured_analysis'),
        APIField('featured_data'),
        APIField('what_you_can_do_with_takwimu'),
        APIField('making_of_takwimu'),
        APIField('latest_news_stories',
                 serializer=serializers.DictField(source='get_latest_news_stories')),
    ]

    def get_promotion_image(self):
        if self.promotion_image:
            return self.promotion_image.file.url

    def get_latest_news_stories(self):
        if self.latest_news_stories:
            latest_news_stories = {
                'title': self.latest_news_stories[0].value['title'],
                'description': str(self.latest_news_stories[0].value['description']),
                'read_more_link_label': str(self.latest_news_stories[0].value['read_more_link_label']),
            }
            social_media_settings = SocialMediaSetting.for_site(self.get_site())
            latest_news_stories.update(get_takwimu_stories(social_media_settings, return_dict=True))
            return latest_news_stories

        return {}

    def find_indicator_with_id(self, indicator_id):
        for featured_data in self.featured_data.stream_data:
            if featured_data["value"]["featured_data"][0]["id"] == indicator_id:
                return featured_data["value"]["featured_data"][0]
        return None

    def get_twitter_meta(self, indicator):
        model = get_image_model()
        image = model.objects.filter(title=indicator["id"]).get()
        return {
            'image_url': image.get_rendition('width-600').url,
            'description': indicator['value']['widget'][0]['value'].get('description', '') if indicator else '',
            'title': indicator["value"]["widget"][0]['value']["title"] if indicator else ''
        }

    def get_context(self, request, *args, **kwargs):
        context = super(IndexPage, self).get_context(request, *args, **kwargs)

        if request.method == 'GET':
            indicator_id = request.GET.get('indicator', None)
            if indicator_id:
                indicator = self.find_indicator_with_id(indicator_id)
                if indicator:
                    context['twitter'] = self.get_twitter_meta(
                        indicator
                    )

        context.update(wagtail_settings(request))
        if self.hero:
            context['title'] = self.hero[0].value['title']
        context['meta'] = self.as_meta(request)

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
    label = models.CharField(default="Services", max_length=255,
                             help_text="Short title used in navigation, etc.")
    title = models.CharField(default="Services", max_length=1024)
    description = RichTextField(blank=False, default=DEFAULT_DESCRIPTION_TEXT)
    services = StreamField([
        ('service', ServiceBlock())
    ], blank=True)

    panels = [
        FieldPanel('label'),
        FieldPanel('title'),
        FieldPanel('description'),
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
    label = models.CharField(default="FAQs", max_length=255,
                             help_text="Short title used in navigation, etc.")
    title = models.CharField(default="Frequently Asked Questions", max_length=1024)
    description = RichTextField(blank=False, default=DEFAULT_DESCRIPTION_TEXT)
    faqs = StreamField([
        ('faq', FAQBlock())
    ], blank=True, verbose_name='Questions & Answers')

    panels = [
        FieldPanel('label'),
        FieldPanel('title'),
        FieldPanel('description'),
        StreamFieldPanel('faqs')
    ]

    class Meta:
        verbose_name = 'FAQs'


class ViewCountryContentContentBlock(blocks.StructBlock):
    title = blocks.CharBlock(default='View analysis or data for a specific country', max_length=1024)
    content_selection_label = blocks.CharBlock(default='Show me', max_length=1024)
    country_selection_label = blocks.CharBlock(default='for', max_length=1024)
    view_content_action_label = blocks.CharBlock(default='Go', max_length=1024)


class ViewCountryContentBlock(blocks.StreamBlock):
    view_country_content = ViewCountryContentContentBlock()

    # This block is only there to ensure structural integrity: Skip it in API
    def get_api_representation(self, value, context=None):
        representation = super(ViewCountryContentBlock, self).get_api_representation(value, context=context)
        if representation:
            return representation[0]
        return {}


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
    other_topics_in_title = models.CharField(default="Other topics in", max_length=1024, verbose_name='title')
    read_next_title = models.CharField(default="Read next...", max_length=1024, verbose_name='title')
    view_country_content = StreamField(ViewCountryContentBlock(required=False, max_num=1), blank=True, verbose_name="View Country Content Section")

    panels = [
        MultiFieldPanel([
                FieldPanel('BF'),
                FieldPanel('CD'),
                FieldPanel('ET'),
                FieldPanel('KE'),
                FieldPanel('NG'),
                FieldPanel('SN'),
                FieldPanel('ZA'),
                FieldPanel('TZ'),
                FieldPanel('UG'),
                FieldPanel('ZM'),
            ],
            heading="Countries",
            classname="collapsible collapsed",
        ),
        MultiFieldPanel([
                FieldPanel('other_topics_in_title'),
            ],
            heading="Profile Navigation",
            classname="collapsible",
        ),
        MultiFieldPanel([
                FieldPanel('read_next_title'),
            ],
            heading="Read Next Section",
            classname="collapsible",
        ),
        StreamFieldPanel('view_country_content'),
    ]

    class Meta:
        verbose_name = 'Country Profiles'


@register_setting
class NavigationSetting(BaseSetting):
    country_analysis = RichTextField(blank=False, default='<p>Lorem ipsum dolor sit amet, adipiscing elitauris con lorem ipsum dolor sit amet.</p>', verbose_name="description")
    data_by_topic = RichTextField(blank=False, default='<p>Lorem ipsum dolor sit amet, adipiscing elitauris con lorem ipsum dolor sit amet.</p>', verbose_name="description")

    panels = [
        MultiFieldPanel([
                FieldPanel('country_analysis'),
            ],
            heading="Country Analysis",
            classname="collapsible",
        ),
        MultiFieldPanel([
                FieldPanel('data_by_topic'),
            ],
            heading="Data by Topic",
            classname="collapsible",
        ),
    ]

    class Meta:
        verbose_name = 'Navigation'
