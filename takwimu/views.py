import json
import operator

from django.conf import settings
from django.views.generic import TemplateView

from takwimu.models.dashboard import SupportService, ExplainerSteps, FAQ

class SupportServicesView(TemplateView):
    '''
    Support Sevices View
    --------------------
    View of support services page.
    '''
    template_name = 'takwimu/about/support-services.html'

    def get_context_data(self, **kwargs):
        context = super(SupportServicesView, self).get_context_data(**kwargs)
        services = SupportService.objects.all()
        context['support_services'] = services
        return context


class HomePageView(TemplateView):
    '''
    Home Page View:
    ---------------
    View of homepage.
    '''
    template_name = 'takwimu/home_page.html'

    def get_context_data(self, **kwargs):
        context = super(HomePageView, self).get_context_data(**kwargs)

        support_services = SupportService.objects.all()
        faqs = FAQ.objects.all()
        
        context['support_services'] = support_services
        context['explainer_steps'] = ExplainerSteps.objects.first()
        context['faqs'] = faqs
        
        return context
