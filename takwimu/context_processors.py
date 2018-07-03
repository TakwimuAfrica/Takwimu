import json
import operator

from takwimu import settings
from takwimu.utils.medium import Medium

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
        # Only do this on development
        if settings.DEBUG:
            with open('data/sample_topics.json') as t:
                topics = json.load(t)
        
        # Query the database on production
        else:
            return

        sample_topics = topics

    except Exception as e:
        print e.message

    return {
        'topics': sample_topics,
    }
