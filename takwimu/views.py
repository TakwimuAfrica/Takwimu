from django.views.generic import TemplateView
from utils.medium import Medium


class CountryReport(TemplateView):
    """
    This view is for template debugging purposes
    """
    template_name = 'takwimu/report_page.html'

    def get_context_data(self, **kwargs):
        context = dict()
        client = Medium()
        stories = client.get_publication_posts('code-for-africa', count=6)
        context['stories'] = stories
        return context

