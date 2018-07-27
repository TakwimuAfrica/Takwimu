import json
import operator

from django.conf import settings
from django.http import Http404
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.views.generic import TemplateView, ListView
from django.views.generic.edit import FormMixin

from takwimu.models.dashboard import Service, ExplainerSteps, FAQ, Testimonial
from forms import SupportServicesContactForm


# class SupportServicesIndexView(ListView):
#     """
#     Support Services View
#     --------------------
#     View of support services page.
#     """
#     template_name = 'takwimu/about/support_services.html'
#
#     def get_queryset(self):
#         return Service.objects.all().exclude(category='Persona')


class HomePageView(TemplateView):
    """
    Home Page View:
    ---------------
    View of homepage.
    """
    template_name = 'takwimu/home_page.html'

    def get_context_data(self, **kwargs):
        context = super(HomePageView, self).get_context_data(**kwargs)
        context['support_services'] = Service.objects.all().filter(
            category="Persona")
        context['explainer_steps'] = ExplainerSteps.objects.first()
        context['faqs'] = FAQ.objects.all()
        context['testimonials'] = Testimonial.objects.all().order_by('-id')[:3]
        return context


class AboutUsView(TemplateView):
    template_name = 'takwimu/about/index.html'

    def get_context_data(self, **kwargs):
        context = super(AboutUsView, self).get_context_data(**kwargs)
        context['support_services'] = Service.objects.all().filter(
            category="Persona")
        return context


class LegalView(TemplateView):
    """
    Legal View:
    ---------------
    View of legal notices: Terms of Use, Privacy and Cookie policies.
    """
    template_name = 'takwimu/about/legal.html'


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


class FormListView(FormMixin, ListView):
    def get(self, request, *args, **kwargs):
        form_class = self.get_form_class()
        self.form = self.get_form(form_class)

        self.object_list = self.get_queryset()
        allow_empty = self.get_allow_empty()
        if not allow_empty and len(self.object_list) == 0:
            raise Http404(
                u"Empty list and '%(class_name)s.allow_empty' is False."
                % {'class_name': self.__class__.__name__})

        context = self.get_context_data(object_list=self.object_list,
                                        form=self.form)
        return self.render_to_response(context)

    def post(self, request, *args, **kwargs):
        return self.get(request, *args, **kwargs)


class SupportServicesIndexView(FormListView):
    """
    Support Services View
    --------------------
    View of support services page.
    """
    model = Service
    template_name = 'takwimu/about/support_services.html'
    form_class = SupportServicesContactForm
    success_url = '/'

    def get_queryset(self):
        return Service.objects.all().exclude(category='Persona')

    def form_valid(self, form):
        email = self.form.cleaned_data['email']
        location = self.form.cleaned_data['location']
        role = self.form.cleaned_data['role']
        help_wanted = self.form.cleaned_data['help']

        print('\n\n\n\n\n\n')

        print(email)
        print(location)
        print(role)
        print(help_wanted)

        return super(SupportServicesIndexView, self).form_valid(form)

    def form_invalid(self, form):
        email = self.form.cleaned_data['email']
        location = self.form.cleaned_data['location']
        role = self.form.cleaned_data['role']
        help_wanted = self.form.cleaned_data['help']

        print('\n\n\n\n\n\n')

        print(email)
        print(location)
        print(role)
        print(help_wanted)

        return super(SupportServicesIndexView, self).form_invalid(form)

    def post(self, request, *args, **kwargs):
        print "\n\n\n\n\n\n"
        print "Shit has been posted"
        print "\n\n\n\n\n\n"
        return super(SupportServicesIndexView, self).post(request, *args, **kwargs)
