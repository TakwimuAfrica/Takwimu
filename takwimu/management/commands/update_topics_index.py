from django.core.management.base import BaseCommand, CommandError
from takwimu.models import ProfileSectionPage, ProfilePage

from takwimu.search import TakwimuTopicSearch


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

                result, outcome = search_backend.add_to_index(topic_id, category, topic_body,
                                                              country, parent_page_id,
                                                              parent_page_type)
                self.stdout.write(search_backend.es_index + ": Indexing topic '%s result %s'" % (
                    topic_id,
                    outcome,
                ))
