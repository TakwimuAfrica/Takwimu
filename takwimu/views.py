import json
import operator

from django.conf import settings
from django.views.generic import TemplateView, View

from takwimu.models.dashboard import SupportService, ExplainerSteps, FAQ, Testimonial

class SupportServicesView(TemplateView):
    '''
    Support Sevices View
    --------------------
    View of support services page.
    '''
    template_name = 'takwimu/about/support-services.html'

    def get_context_data(self, **kwargs):
        context = super(SupportServicesView, self).get_context_data(**kwargs)
        context['support_services'] = SupportService.objects.all()
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
        
        context['support_services'] = SupportService.objects.all()
        context['explainer_steps'] = ExplainerSteps.objects.first()
        context['faqs'] = FAQ.objects.all()
        context['testimonials'] = Testimonial.objects.all().order_by('-id')[:3]
        
        return context


class AboutUsView(TemplateView):
    template_name = 'takwimu/about/index.html'

    def get_context_data(self, **kwargs):
        context = super(AboutUsView, self).get_context_data(**kwargs)
        context['support_services'] = SupportService.objects.all()
        return context
