import json

from django.conf import settings
from django.views.generic import TemplateView

from utils.medium import Medium


class CountryReport(TemplateView):
    """
    This view is for template debugging purposes
    """
    template_name = 'takwimu/report_page.html'

    def get_context_data(self, **kwargs):
        context = dict()
        try:
            if settings.DEBUG:
                with open('articles.json') as f:
                    stories = json.load(f)
            else:
                client = Medium()
                stories = client.get_publication_posts('code-for-africa',
                                                       count=20)
            context['recent_stories'] = stories[0:6]
            context['popular_stories'] = stories[6:8]
            context['most_shared'] = stories[8:10]
            context['recommended'] = stories[10:16]
            print context.keys()

            return context
        except Exception as e:
            return context
