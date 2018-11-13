import json
import requests
import string

from operator import itemgetter

from collections import OrderedDict
from django.conf import settings
from django.shortcuts import render_to_response, render
from django.template import RequestContext
from django.views.generic import TemplateView, FormView, View
from django.views.generic.base import TemplateView
from wazimap.views import HomepageView, GeographyDetailView

from takwimu.models.dashboard import ExplainerSteps, FAQ, Testimonial, \
    TopicPage, ProfileSectionPage, ProfilePage
from forms import SupportServicesContactForm

from sdg import SDG
from takwimu.search.takwimu_search import TakwimuTopicSearch
from takwimu.search.utils import get_page_details


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
        context['faqs'] = FAQ.objects.all()
        context['testimonials'] = Testimonial.objects.all().order_by('-id')[:3]
        return context


class AboutUsView(TemplateView):
    template_name = 'takwimu/about/index.html'

    def get_context_data(self, **kwargs):
        context = super(AboutUsView, self).get_context_data(**kwargs)
        return context


class LegalView(TemplateView):
    """
    Legal View:
    ---------------
    View of legal notices: Terms of Use, Privacy and Cookie policies.
    """
    template_name = 'takwimu/about/legal.html'


class TopicView(TemplateView):
    """
    Topic View:
    ---------------
    Finding Data by Topic View.
    """
    template_name = 'takwimu/topic_page.html'


class SDGIndicatorView(TemplateView):
    """
    SDG Indicator View:
    ---------------
    Finding data by SDG indicator.
    """

    template_name = 'takwimu/sdg_topic_page.html'

    def get_context_data(self, **kwargs):
        json_data = open('takwimu/fixtures/sdg.json')
        data = json.load(json_data)
        context = super(SDGIndicatorView, self).get_context_data(
            **kwargs)
        context['sdgs'] = data
        return context


def handler404(request):
    response = render_to_response('404.html', {},
                                  context_instance=RequestContext(request))
    response.status_code = 404
    return response


def handler500(request):
    response = render_to_response('500.html', {},
                                  context_instance=RequestContext(request))
    response.status_code = 500
    return response


class SupportServicesIndexView(FormView):
    """
    Support Services View
    --------------------
    View of support services page.
    """
    template_name = 'takwimu/about/support_services.html'
    form_class = SupportServicesContactForm
    success_url = '/'

    def get_context_data(self, **kwargs):
        context = super(SupportServicesIndexView, self).get_context_data(
            **kwargs)
        context['ticket_success'] = False
        return context

    def form_valid(self, form):
        email = form.cleaned_data['email']
        name = form.cleaned_data['name']
        location = form.cleaned_data['location']
        role = form.cleaned_data['role']
        help_wanted = form.cleaned_data['help']
        print '\n\n\n\n\n\n\n\n'
        data = {
            'request': {
                'requester': {
                    "name": name,
                    "email": email
                },
                'subject': 'Enquiry: {} a(n) {} from {} asks'.format(name, role,
                                                                     location),
                'comment': {
                    'body': help_wanted
                }
            }
        }

        headers = {'content-type': 'application/json'}

        user = email + '/token'
        api_token = settings.ZENDESK_API_TOKEN

        request = requests.post(
            settings.ZENDESK_API,
            data=json.dumps(data),
            auth=(user, api_token),
            headers=headers
        )

        print '\n\n\n\n\n\n\n\n'
        print request.status_code
        print request.json()

        if request.status_code != 201:
            # add non field error
            form.add_error(None,
                           'Could not open a ticket at the moment. Please try again later')
            return super(SupportServicesIndexView, self).form_invalid(form)

        context = self.get_context_data(form=form)
        # hide form and show the success dialog
        context['ticket_success'] = True
        return self.render_to_response(context)

    def form_invalid(self, form):
        return super(SupportServicesIndexView, self).form_invalid(form)


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
