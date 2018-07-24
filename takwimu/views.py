import json
import operator

from django.conf import settings
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.views.generic import TemplateView, ListView

from takwimu.models.dashboard import Service, ExplainerSteps, FAQ, Testimonial


class SupportServicesIndexView(ListView):
    """
    Support Sevices View
    --------------------
    View of support services page.
    """
    template_name = 'takwimu/about/support_services.html'
    model = Service


class HomePageView(TemplateView):
    """
    Home Page View:
    ---------------
    View of homepage.
    """
    template_name = 'takwimu/home_page.html'

    def get_context_data(self, **kwargs):
        context = super(HomePageView, self).get_context_data(**kwargs)
        context['support_services'] = Service.objects.all().filter(category="Persona")
        context['explainer_steps'] = ExplainerSteps.objects.first()
        context['faqs'] = FAQ.objects.all()
        context['testimonials'] = Testimonial.objects.all().order_by('-id')[:3]
        return context

class AboutUsView(TemplateView):
    template_name = 'takwimu/about/index.html'

    def get_context_data(self, **kwargs):
        context = super(AboutUsView, self).get_context_data(**kwargs)
        context['support_services'] = Service.objects.all().filter(category="Persona")
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