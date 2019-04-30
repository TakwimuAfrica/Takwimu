from django.core.management.base import BaseCommand, CommandError

from takwimu.models import ProfileSectionPage, ProfilePage
from takwimu.search.takwimu_search import TakwimuTopicSearch
from takwimu.search.utils import get_widget_data, get_page_details


class Command(BaseCommand):
    help = 'Add topics to the search index'

    def handle(self, *args, **options):
        topic_search = TakwimuTopicSearch()
        topic_search.reset_index()

        self.stdout.write(topic_search.es_index + ": Starting rebuild")
        self.index_topics(ProfileSectionPage.objects.live(), topic_search)
        self.index_topics(ProfilePage.objects.live(), topic_search)

    def index_topics(self, queryset, search_backend):
        for i in queryset:
            country, category, parent_page_type = get_page_details(i)

            parent_page_id = i.id

            for topic in i.body.stream_data:
                topic_id = topic['id']
                title = topic['value'].get('title', '')
                topic_summary = topic['value'].get('summary', '')
                topic_body = topic['value'].get('body', '')
                for k in topic_body:
                    if k['type'] == 'text':
                        text = k.get('value', '')
                        body = '\n'.join([topic_summary, text])
                        metadata = ''

                        _, outcome = search_backend.add_to_index(
                            content_id=topic_id, content_type='topic',
                            country=country, category=category, title=title,
                            body=body, metadata=metadata,
                            parent_page_id=parent_page_id,
                            parent_page_type=parent_page_type,
                            result_type='Analysis', summary=topic_summary)
                        self.stdout.write(
                            search_backend.es_index + ": Indexing topic '%s result %s'" % (
                                topic_id,
                                outcome,
                            ))

                    elif k['type'] == 'indicator':
                        indicator = k.get('value', [])
                        indicator_summary = k.get('summary', '')
                        for widget in indicator['widget']:
                            data = get_widget_data(widget)
                            if data:
                                _, outcome = search_backend.add_to_index(
                                    content_id=data['id'],
                                    content_type='indicator_widget',
                                    country=country, category=category,
                                    title=data['title'], body=data['body'],
                                    metadata=data['metadata'],
                                    parent_page_id=parent_page_id,
                                    parent_page_type=parent_page_type,
                                    result_type='Data', summary=indicator_summary)

                                self.stdout.write(
                                    search_backend.es_index + ": Indexing widget '%s result %s'" % (
                                        data['id'],
                                        outcome,
                                    ))
