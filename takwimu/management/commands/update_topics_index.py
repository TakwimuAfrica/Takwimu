from django.core.management.base import BaseCommand, CommandError
from takwimu.models import ProfileSectionPage, ProfilePage

from takwimu.search.takwimu_search import TakwimuTopicSearch


class Command(BaseCommand):
    help = 'Add topics to the search index'

    def handle(self, *args, **options):
        topic_search = TakwimuTopicSearch()
        topic_search.reset_index()

        self.stdout.write(topic_search.es_index + ": Starting rebuild")
        self.index_topics(ProfileSectionPage.objects.live(), topic_search)
        self.index_topics(ProfilePage.objects.live(), topic_search)

    def get_widget_data(self, widget):
        try:
            title = widget['value'].get('title')
            source = widget['value'].get('source')
            body = None

            _type = widget['type']
            if _type == "html":
                body = widget['value'].get('raw_html', '')
            elif _type == 'free_form':
                body = widget['value'].get('body', '')
            elif _type == 'embed':
                body = ''

            elif _type == 'document':
                body = ''

            elif _type == 'image':
                body = widget['value'].get('caption', '')

            elif _type == 'hurumap':
                body = widget['value'].get('subtitle', '')

            elif _type == 'entities':
                body = ''
                for entity in widget['value']['entities']:
                    body += entity['description']
                    body += " "

            if title and source:
                return {
                    "widget_id": widget['id'],
                    "body": body + " " + title + " " + source,
                    "type": "indicator_widget"
                }
            return None
        except KeyError:
            return None

    def index_topics(self, queryset, search_backend):
        for i in queryset:
            country = ""
            category = ""
            parent_page_type = ""
            if isinstance(i, ProfileSectionPage):
                country = str(i.get_parent())
                category = i.title
                parent_page_type = 'ProfileSectionPage'
            elif isinstance(i, ProfilePage):
                country = str(i)
                category = "Country Overview"
                parent_page_type = 'ProfilePage'

            parent_page_id = i.id

            for topic in i.body.stream_data:
                topic_id = topic.get('id')
                topic_body = topic['value'].get('body', '')
                topic_summary = topic['value'].get('summary', '')
                body = topic_body + " " + topic_summary

                result, outcome = search_backend.add_to_index(category,
                                                              body,
                                                              country,
                                                              parent_page_id,
                                                              parent_page_type,
                                                              type="topic",
                                                              topic_id=topic_id)
                self.stdout.write(
                    search_backend.es_index + ": Indexing topic '%s result %s'" % (
                        topic_id,
                        outcome,
                    ))

                indicators = topic['value'].get('indicators', '')
                for indicator in indicators:
                    for widget in indicator['value']['widgets']:
                        data = self.get_widget_data(widget)
                        if data:
                            result, outcome = search_backend.add_to_index(
                                category,
                                data.get('body'),
                                country,
                                parent_page_id,
                                parent_page_type,
                                type='indicator_widget',
                                widget_id=data.get(
                                    'widget_id'))
                            self.stdout.write(
                                search_backend.es_index + ": Indexing widget '%s result %s'" % (
                                    data.get("widget_id"),
                                    outcome,
                                ))