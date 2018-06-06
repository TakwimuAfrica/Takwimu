from django.views.generic import TemplateView
from utils.medium import Medium


class CountryReport(TemplateView):
    """
    This view is for template debugging purposes
    """
    template_name = 'takwimu/report_page.html'