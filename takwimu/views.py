import json
import operator

from django.conf import settings
from django.views.generic import TemplateView

from takwimu.models.dashboard import SupportService
from utils.medium import Medium


class CountryProfile(TemplateView):
    """
    This view is for template debugging purposes
    """
    template_name = 'takwimu/profile_page.html'

    def get_context_data(self, **kwargs):
        context = dict()
        try:
            if settings.DEBUG:
                with open('data/articles.json') as f:
                    stories = json.load(f)
            else:
                client = Medium()
                stories = client.get_publication_posts('code-for-africa',
                                                       count=20)
            latest = stories[0:6]
            context['recent_stories'] = latest
            context['trending'] =sorted(latest, key=operator.itemgetter('clap_count'), reverse=True)
            return context
        except Exception as e:
            print e.message
            return context


class AboutUsPage(TemplateView):
    template_name = 'takwimu/about/index.html'

class ContactUsPage(TemplateView):
    template_name = 'takwimu/about/contact.html'

class SupportServicesPage(TemplateView):
    template_name = 'takwimu/about/support-services.html'

    def get_context_data(self, **kwargs):
        context = super(SupportServicesPage, self).get_context_data(**kwargs)
        services = SupportService.objects.all()
        context['support_services'] = services
        return context

