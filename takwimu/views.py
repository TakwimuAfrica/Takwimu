from collections import OrderedDict
import json
from operator import itemgetter
import requests
import string

from django.conf import settings as takwimu_settings
from django.core.serializers.json import DjangoJSONEncoder
from django.shortcuts import render_to_response, render
from django.template import RequestContext
from django.utils.module_loading import import_string
from django.utils.safestring import SafeString
from django.utils.text import slugify
from django.views.generic import TemplateView

from elasticsearch_dsl import Search

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from wagtail.contrib.settings.context_processors import settings

from wazimap.views import GeographyDetailView
from wazimap.geo import geo_data, LocationNotFound
from wazimap.data.utils import dataset_context
from wazimap.profiles import enhance_api_data
from wazimap.views import GeographyDetailView

from takwimu.context_processors import (
    takwimu_countries,
    takwimu_stories,
    takwimu_topics,
)
from takwimu.models import ProfileData
from takwimu.models.dashboard import (
    ExplainerSteps,
    FAQ,
    FAQSetting,
    IndexPage,
    ProfileSectionPage,
    ProfilePage,
    Testimonial,
    search_analysis_and_data,
    DataByTopicPage)

from takwimu.models.utils.search import get_page_details
from takwimu.sdg import SDG
from takwimu.search import suggest

from .renderers import CSSRenderer
from rest_framework.renderers import StaticHTMLRenderer
from wagtail.documents.models import Document
from django.shortcuts import get_object_or_404
from wagtail.documents.models import get_document_model
import zipfile

from .data.utils import (
    get_page_releases_per_country,
    get_primary_release_year_per_geography,
)


class HomePageView(TemplateView):
    """
    Home Page View:
    ---------------
    View of homepage.
    """

    template_name = "takwimu/home_page.html"

    def get_context_data(self, **kwargs):
        context = super(HomePageView, self).get_context_data(**kwargs)

        context.update(settings(self.request))
        home = IndexPage.objects.first()
        if home:
            context.update(home.get_context(self.request))
        return context


class AboutPageRedirectView(TemplateView):
    template_name = 'takwimu/about_page.html'

    def get_context_data(self, **kwargs):
        context = super(AboutPageRedirectView, self).get_context_data(**kwargs)

        context['active_content'] = self.request.resolver_match.url_name

        return context


class LegalView(TemplateView):
    """
    Legal View:
    ---------------
    View of legal notices: Terms of Use, Privacy and Cookie policies.
    """

    template_name = "takwimu/about/legal.html"

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

    template_name = "takwimu/topic_page.html"

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

    template_name = "takwimu/sdg_topic_page.html"

    def get_context_data(self, **kwargs):

        # `sdgs` are loaded in context processor so check there first
        json_data = open("takwimu/fixtures/sdg.json")
        sdgs = json.load(json_data)
        sdg_indicators_map = self.load_sdg_indicators_map()
        for sdg in sdgs:
            sdg_indicators = sdg_indicators_map.get(slugify(sdg["short"]))
            if sdg_indicators:
                sdg["indicators"] = sdg_indicators
        context = super(SDGIndicatorView, self).get_context_data(**kwargs)
        context["sdgs"] = sdgs
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
            ProfileSectionPage.objects.live(), sdg_indicators_map
        )
        return sdg_indicators_map

    def _extract_sdgs_from_pages(self, pages, sdg_indicators_map):
        for page in pages:
            try:
                for topic in page.body.stream_data:
                    topic_title = slugify(topic["value"]["title"])
                    indicators = topic["value"].get("indicators")
                    for indicator in indicators:
                        widgets = indicator["value"].get("widgets")
                        for widget in widgets:
                            sdg = widget["value"].get("sdg")
                            if sdg:
                                country, _, _ = get_page_details(page)
                                url = page.get_url(self.request)
                                indicator = {
                                    "title": indicator["value"].get("title"),
                                    "country": country,
                                    "country_slug": slugify(country),
                                    "url": "{}#{}_{}-tab".format(
                                        url, slugify(
                                            topic_title), indicator["id"]
                                    ),
                                }
                                sdg_indicators = sdg_indicators_map.setdefault(
                                    sdg, [])
                                sdg_indicators.append(indicator)
            except KeyError:
                pass


def handler404(request):
    return render(request, "404.html")


def handler500(request):
    return render(request, "500.html")


class SupportServicesIndexView(TemplateView):
    """
    Support Services View
    --------------------
    View of support services page.
    """

    template_name = "takwimu/about/support_services.html"

    def get_context_data(self, **kwargs):
        context = super(SupportServicesIndexView,
                        self).get_context_data(**kwargs)

        context.update(settings(self.request))
        context.update(takwimu_countries(self.request))
        context.update(takwimu_stories(self.request))
        context.update(takwimu_topics(self.request))

        return context


class SearchAPIView(APIView):
    def get(self, request, *args, **kwargs):
        query = request.GET.get("q", "")
        if query:
            results = search_analysis_and_data(query, request)
            data = {"search": {"query": query, "results": results}}
            return Response(data=data, status=status.HTTP_200_OK)

        return Response(
            data={"error": "query can not be an empty string"},
            status=status.HTTP_400_BAD_REQUEST,
        )


class AutoCompleteAPIView(APIView):
    def get(self, request, *args, **kwargs):
        query = request.GET.get("q", "")
        suggestions = suggest(query)
        return Response(data={"suggestions": suggestions},
                        status=status.HTTP_200_OK)


class IndicatorsGeographyDetailView(GeographyDetailView):
    def get(self, request, *args, **kwargs):
        context = self.get_context_data(*args, **kwargs)
        context["data_indicators"] = "Takwimu Indicators"
        data = request.GET.get("data")
        if data and data.lower() == "sdg":
            context["data_indicators"] = "SDGs Indicators"
            context["sdg"] = SDG
            return render(
                request,
                template_name="profile/profile_detail_sdg.html",
                context=context,
            )
        return render(
            request,
            template_name="profile/profile_detail_takwimu.html",
            context=context,
        )

    def get_context_data(self, *args, **kwargs):
        json_data = open("takwimu/fixtures/sdg.json")
        data = json.load(json_data)

        ## get profileData aka summaries from wagtail
        summary_data = ProfileData.objects.filter(
            country_iso_code=self.geo.geo_code).values('id', 'chart_id',
                                                       'summary')

        page_context = {"profile_data_summaries": list(summary_data)}

        # get data by topic page text description
        try:
            page = DataByTopicPage.objects.get(country=self.geo)
            page_context['profile_data_description'] = page.description
        except DataByTopicPage.DoesNotExist:
            page_context[
                'profile_data_description'] = f"What lorem ipsum dolor sit amec cat this is an introduction to the demographics data topic for {self.geo.name} and should be editorially curated & populated via the backend."

        # load the profile
        profile_method = takwimu_settings.HURUMAP.get("profile_builder", None)
        self.profile_name = takwimu_settings.HURUMAP.get(
            "default_profile", "default")

        if not profile_method:
            raise ValueError(
                "You must define WAZIMAP.profile_builder in settings.py")
        profile_method = import_string(profile_method)

        year = self.request.GET.get(
            "release", get_primary_release_year_per_geography(self.geo)
        )

        with dataset_context(year=year):
            profile_data = profile_method(
                self.geo, self.profile_name, self.request)

        profile_data["geography"] = self.geo.as_dict_deep()
        profile_data["primary_releases"] = get_page_releases_per_country(
            takwimu_settings.HURUMAP["primary_dataset_name"], self.geo, year
        )

        profile_data = enhance_api_data(profile_data)
        page_context.update(profile_data)

        profile_data_json = SafeString(
            json.dumps(profile_data, cls=DjangoJSONEncoder))

        page_context.update({"profile_data_json": profile_data_json})

        # is this a head-to-head view?
        page_context["head2head"] = "h2h" in self.request.GET

        page_context["sdgs"] = data
        page_context.update(settings(self.request))
        page_context.update(takwimu_countries(self.request))
        page_context.update(takwimu_stories(self.request))
        page_context.update(takwimu_topics(self.request))

        return page_context


class FlourishView(APIView):
    renderer_classes = (StaticHTMLRenderer, CSSRenderer)

    def get(self, request, *args, **kwargs):
        Document = get_document_model()
        doc = get_object_or_404(Document, id=kwargs["document_id"])

        filename = "index.html"
        if "filename" in kwargs and kwargs["filename"]:
            filename = kwargs["filename"]

        zip_ref = zipfile.ZipFile(doc.file.path, "r")
        file_path = zip_ref.extract(filename, "/tmp/" + kwargs["document_id"])
        zip_ref.close()

        return Response(open(file_path).read())
