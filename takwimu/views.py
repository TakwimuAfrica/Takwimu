from collections import OrderedDict
from operator import itemgetter
import json
import string

from django.core.serializers.json import DjangoJSONEncoder
from django.utils.safestring import SafeString
from django.utils.module_loading import import_string
from django.shortcuts import render_to_response, render
from django.template import RequestContext
from django.utils.text import slugify
from django.views.generic import TemplateView

import requests
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from wazimap.views import GeographyDetailView
from wazimap.geo import geo_data, LocationNotFound
from wazimap.data.utils import dataset_context
from wazimap.profiles import enhance_api_data

from takwimu.models.dashboard import ExplainerSteps, FAQ, Testimonial, FAQSetting, \
    ProfileSectionPage, ProfilePage
from takwimu.sdg import SDG
from takwimu.search.takwimu_search import TakwimuTopicSearch
from takwimu.search.utils import get_page_details

from .data.utils import get_page_releases_per_country, \
    get_primary_release_year_per_geography
from wagtail.contrib.settings.context_processors import settings
from takwimu.context_processors import takwimu_countries, takwimu_stories, takwimu_topics

from django.conf import settings as takwimu_settings


class HomePageView(TemplateView):
    """
    Home Page View:
    ---------------
    View of homepage.
    """
    template_name = 'takwimu/home_page.html'

    def get_context_data(self, **kwargs):
        context = super(HomePageView, self).get_context_data(**kwargs)
        context['explainer_steps'] = ExplainerSteps.objects.first()
        context['testimonials'] = Testimonial.objects.all().order_by('-id')[:3]

        context.update(settings(self.request))
        context.update(takwimu_countries(self.request))
        context.update(takwimu_stories(self.request))
        context.update(takwimu_topics(self.request))
        return context


class AboutUsView(TemplateView):
    template_name = 'takwimu/about/index.html'

    def get_context_data(self, **kwargs):
        context = super(AboutUsView, self).get_context_data(**kwargs)
        context.update(settings(self.request))
        context.update(takwimu_countries(self.request))
        context.update(takwimu_stories(self.request))
        context.update(takwimu_topics(self.request))

        return context


class LegalView(TemplateView):
    """
    Legal View:
    ---------------
    View of legal notices: Terms of Use, Privacy and Cookie policies.
    """
    template_name = 'takwimu/about/legal.html'

    def get_context_data(self, **kwargs):
        context = super(LegalView, self).get_context_data(**kwargs)
        context.update(settings(self.request))
        context.update(takwimu_countries(self.request))
        context.update(takwimu_stories(self.request))
        context.update(takwimu_topics(self.request))

        return context


class TopicView(TemplateView):
    """
    Topic View:
    ---------------
    Finding Data by Topic View.
    """
    template_name = 'takwimu/topic_page.html'

    def get_context_data(self, **kwargs):
        context = super(TopicView, self).get_context_data(**kwargs)

        context.update(settings(self.request))
        context.update(takwimu_countries(self.request))
        context.update(takwimu_stories(self.request))
        context.update(takwimu_topics(self.request))

        return context


class SDGIndicatorView(TemplateView):
    """
    SDG Indicator View:
    ---------------
    Finding data by SDG indicator.
    """

    template_name = 'takwimu/sdg_topic_page.html'

    def get_context_data(self, **kwargs):

        # `sdgs` are loaded in context processor so check there first
        json_data = open('takwimu/fixtures/sdg.json')
        sdgs = json.load(json_data)
        sdg_indicators_map = self.load_sdg_indicators_map()
        for sdg in sdgs:
            sdg_indicators = sdg_indicators_map.get(slugify(sdg['short']))
            if sdg_indicators:
                sdg['indicators'] = sdg_indicators
        context = super(SDGIndicatorView, self).get_context_data(
            **kwargs)
        context['sdgs'] = sdgs
        context.update(settings(self.request))
        context.update(takwimu_countries(self.request))
        context.update(takwimu_stories(self.request))
        context.update(takwimu_topics(self.request))

        return context

    def load_sdg_indicators_map(self):
        """
        Process all live pages looking for widgets tagged with SGD goals.
        """

        sdg_indicators_map = {}
        self._extract_sdgs_from_pages(
            ProfilePage.objects.live(), sdg_indicators_map)
        self._extract_sdgs_from_pages(
            ProfileSectionPage.objects.live(), sdg_indicators_map)
        return sdg_indicators_map

    def _extract_sdgs_from_pages(self, pages, sdg_indicators_map):
        for page in pages:
            try:
                for topic in page.body.stream_data:
                    topic_title = slugify(topic['value']['title'])
                    indicators = topic['value'].get('indicators')
                    for indicator in indicators:
                        widgets = indicator['value'].get('widgets')
                        for widget in widgets:
                            sdg = widget['value'].get('sdg')
                            if sdg:
                                country, _, _ = get_page_details(page)
                                url = page.get_url(self.request)
                                indicator = {
                                    'title': indicator['value'].get('title'),
                                    'country': country,
                                    'country_slug': slugify(country),
                                    'url': '{}#{}_{}-tab'.format(url, slugify(topic_title), indicator['id']),
                                }
                                sdg_indicators = sdg_indicators_map.setdefault(
                                    sdg, [])
                                sdg_indicators.append(indicator)
            except KeyError:
                pass


def handler404(request):
    return render(request, '404.html')

def handler500(request):
    return render(request, '500.html')


class SupportServicesIndexView(TemplateView):
    """
    Support Services View
    --------------------
    View of support services page.
    """
    template_name = 'takwimu/about/support_services.html'

    def get_context_data(self, **kwargs):
        context = super(SupportServicesIndexView, self).get_context_data(
            **kwargs)

        context.update(settings(self.request))
        context.update(takwimu_countries(self.request))
        context.update(takwimu_stories(self.request))
        context.update(takwimu_topics(self.request))

        return context


class SearchView(TemplateView):
    """
    Search View
    -----------
    Displays search results.

    """
    template_name = 'search_results.html'

    def get(self, request, *args, **kwargs):
        query = request.GET.get('q', '')
        orderby = request.GET.get('orderby', 'relevance')
        countries_filter = request.GET.getlist('country[]')
        topics_filter = request.GET.getlist('topic[]')

        self.profilepages = ProfilePage.objects.live()
        self.profilesectionpages = ProfileSectionPage.objects.live()

        self.topics_widgets_map = {}
        self.create_results_map()

        self.items = []
        self.countries = OrderedDict()
        self.topics = OrderedDict()

        operator = 'or'
        strip_chars = string.whitespace
        if query.startswith('"') and query.endswith('"'):
            # search in quotes means phrase search
            operator = 'and'
            strip_chars += '"'

        search_query = query.strip(strip_chars)
        results = TakwimuTopicSearch().search(search_query, operator,
                                              country_filters=countries_filter,
                                              category_filters=topics_filter)

        for result in results:
            parent_page_id = result['parent_page_id']
            page = None
            if result['parent_page_type'] == 'ProfileSectionPage':
                page = self.profilesectionpages.get(id=parent_page_id)
            elif result['parent_page_type'] == 'ProfilePage':
                page = self.profilepages.get(id=parent_page_id)

            if page:
                country, category, _ = get_page_details(page)
                result['country'] = country
                result['category'] = category
                self.countries[country] = 1
                self.topics[category] = 1

                id = result['content_id']
                data_point = self.topics_widgets_map.get(id)

                result['data_point'] = data_point
                result['url'] = page.get_url(request)
                self.items.append(result)

        if orderby == 'location':
            self.items = sorted(self.items, key=itemgetter('country'))

        return render(request, self.template_name, {
            'search_query': query,
            'orderby': orderby,
            'query_params': {
                'countries': countries_filter,
                'topics': topics_filter,
            },
            'search_results': {
                'items': self.items,
                'countries': self.countries.keys(),
                'topics': self.topics.keys(),
            },
        })

    def get_topic_from_page(self, topic_id, page):
        for topic in page.body:
            if topic.id == topic_id:
                return topic

    def create_results_map(self):
        for profilepage in self.profilepages:
            for topic in profilepage.body:
                self.topics_widgets_map[topic.id] = topic

                for indicator in topic.value['indicators']:
                    for widget in indicator.value['widgets']:
                        self.topics_widgets_map[widget.id] = widget

        for profilesectionpage in self.profilesectionpages:
            for topic in profilesectionpage.body:
                self.topics_widgets_map[topic.id] = topic

                for indicator in topic.value['indicators']:
                    for widget in indicator.value['widgets']:
                        self.topics_widgets_map[widget.id] = widget

    def get_context_data(self, **kwargs):
        json_data = open('takwimu/fixtures/sdg.json')
        data = json.load(json_data)

        context = super(SearchView, self).get_context_data(
            **kwargs)
        context['sdgs'] = data

        context.update(settings(self.request))
        context.update(takwimu_countries(self.request))
        context.update(takwimu_stories(self.request))
        context.update(takwimu_topics(self.request))

        return context


class SearchAPIView(APIView):
    def get(self, request, *args, **kwargs):
        query = request.GET.get('q', '')
        profilepages = ProfilePage.objects.live()
        profilesectionpages = ProfileSectionPage.objects.live()

        results = []

        if query:
            operator = 'or'
            strip_chars = string.whitespace
            if query.startswith('"') and query.endswith('"'):
                # search in quotes means phrase search
                operator = 'and'
                strip_chars += '"'

            search_query = query.strip(strip_chars)
            hits = TakwimuTopicSearch().search(search_query, operator)
            for hit in hits:
                parent_page_id = hit['parent_page_id']
            if parent_page_id:
                page = None
                if hit['parent_page_type'] == 'ProfileSectionPage':
                    page = profilesectionpages.get(id=parent_page_id)
                elif hit['parent_page_type'] == 'ProfilePage':
                    page = profilepages.get(id=parent_page_id)
                if page:
                    hit['link'] = page.get_url(request)
                    results.append(hit)
            else:
                results.append(hit)

            return Response(data=results, status=status.HTTP_200_OK)

        return Response(data={'error': "query can not be an empty string"},
                        status=status.HTTP_400_BAD_REQUEST)


class IndicatorsGeographyDetailView(GeographyDetailView):

    def get(self, request, *args, **kwargs):
        context = self.get_context_data(*args, **kwargs)
        context['data_indicators'] = 'Takwimu Indicators'
        data = request.GET.get('data')
        if data and data.lower() == 'sdg':
            context['data_indicators'] = 'SDGs Indicators'
            context['sdg'] = SDG
            return render(request,
                          template_name='profile/profile_detail_sdg.html',
                          context=context)
        return render(request,
                      template_name='profile/profile_detail_takwimu.html',
                      context=context)


    def get_context_data(self, *args, **kwargs):
        json_data = open('takwimu/fixtures/sdg.json')
        data = json.load(json_data)

        page_context = {}

        # load the profile
        profile_method = takwimu_settings.HURUMAP.get('profile_builder', None)
        self.profile_name = takwimu_settings.HURUMAP.get('default_profile', 'default')

        if not profile_method:
            raise ValueError("You must define WAZIMAP.profile_builder in settings.py")
        profile_method = import_string(profile_method)

        year = self.request.GET.get('release', get_primary_release_year_per_geography(self.geo))
        # if takwimu_settings.HURUMAP['latest_release_year'] == year:
        #     year = 'latest'

        with dataset_context(year=year):
            profile_data = profile_method(self.geo, self.profile_name, self.request)

        profile_data['geography'] = self.geo.as_dict_deep()
        profile_data['primary_releases'] = get_page_releases_per_country(
            takwimu_settings.HURUMAP['primary_dataset_name'], self.geo, year)

        profile_data = enhance_api_data(profile_data)
        page_context.update(profile_data)

        profile_data_json = SafeString(json.dumps(profile_data, cls=DjangoJSONEncoder))

        page_context.update({
            'profile_data_json': profile_data_json
        })

        # is this a head-to-head view?
        page_context['head2head'] = 'h2h' in self.request.GET

        page_context['sdgs'] = data
        page_context.update(settings(self.request))
        page_context.update(takwimu_countries(self.request))
        page_context.update(takwimu_stories(self.request))
        page_context.update(takwimu_topics(self.request))

        return page_context
