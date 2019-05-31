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
                topic_body = topic['value'].get('body', '')
                topic_summary = topic['value'].get('summary', '')
                body = '\n'.join([topic_summary, topic_body])
                metadata = ''

                _, outcome = search_backend.add_to_index(topic_id,
                                                         'topic',
                                                         country,
                                                         category,
                                                         title,
                                                         body,
                                                         metadata,
                                                         parent_page_id,
                                                         parent_page_type,
                                                         )
                self.stdout.write(
                    search_backend.es_index + ": Indexing topic '%s result %s'" % (
                        topic_id,
                        outcome,
                    ))

                indicators = topic['value'].get('indicators', '')
                for indicator in indicators:
                    for widget in indicator['value']['widgets']:
                        data = get_widget_data(widget)
                        if data:
                            _, outcome = search_backend.add_to_index(
                                data['id'],
                                'indicator_widget',
                                country,
                                category,
                                data['title'],
                                data['body'],
                                data['metadata'],
                                parent_page_id,
                                parent_page_type
                            )
                            self.stdout.write(
                                search_backend.es_index + ": Indexing widget '%s result %s'" % (
                                    data['id'],
                                    outcome,
                                ))
