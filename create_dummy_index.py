from takwimu.search import TakwimuTopicSearch
from takwimu.models import ProfileSectionPage, ProfilePage


top = TakwimuTopicSearch()
top.es_index = 'test-topics-4'
top.reset_index()


def index_topics(queryset, top):
    from takwimu.models import ProfileSectionPage, ProfilePage
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

            result, outcome = top.add_to_index(topic_id, category, topic_body,
                                               country, parent_page_id,
                                               parent_page_type)
            print(outcome, result)

index_topics(ProfileSectionPage.objects.live(), top)
index_topics(ProfilePage.objects.live(), top)

p={'query': {'bool': {'must': [{'match': {'body': 'primary'}}]}, 'filter': [{'terms': {'country': ['Kenya']}}]}}





