import json
import operator

from takwimu import settings
from takwimu.utils.medium import Medium

from wagtail.wagtailsearch.backends import get_search_backend
from takwimu.models.dashboard import ProfileSectionPage
from takwimu.models.dashboard import TopicPage

def takwimu_stories(request):

    stories_latest = []
    stories_trending = []

    try:
        if settings.DEBUG:
            with open('data/articles.json') as f:
                stories = json.load(f)
        else:
            client = Medium()
            stories = client.get_publication_posts('code-for-africa',
                                                    count=20)
        stories_latest = stories[0:6]
        stories_trending = sorted(stories, key=operator.itemgetter('clap_count'), reverse=True)

    except Exception as e:
        print e.message

    return {
        'stories_latest': stories_latest,
        'stories_trending': stories_trending[0:6]
    }

# This function can be refactored or completely removed, it acts as sample dummy data
# For the topics with sub-topics 
def takwimu_topics(request):
    sample_topics = []

    try:
        # with open('data/sample_topics.json') as t:
            # topics = json.load(t)
        s = get_search_backend()
        takwimuTopics = []
        profileSections = ProfileSectionPage.objects.all()
        for profileSection in profileSections:
            takwimuTopic = {
                'id': str(profileSection.id),
                'title': profileSection.title,
            }
            takwimuTopics.append(takwimuTopic)

            takwimuTopic['subtopics'] = []
            topics = profileSection.topics.select_related('topic').all()
            for topic in topics:
                subtopic = {
                    'id': str(topic.id),
                    'title': topic.topic.title,
                }
                takwimuTopic['subtopics'].append(subtopic)

                subtopic['sub_subtopics'] = []
                indicators = topic.topic.data_indicators.select_related('indicator').all()
                for indicator in indicators:
                    sub_subtopic = {
                        'id': str(indicator.id),
                        'title': indicator.indicator.title,
                    }
                subtopic['sub_subtopics'].append(sub_subtopic)

    except Exception as e:
        print e.message

    return {
        'topics': takwimuTopics,
    }
