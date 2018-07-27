import json
import operator

from collections import OrderedDict
from takwimu import settings
from takwimu.utils.medium import Medium

from takwimu.models.dashboard import Service
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
        stories_latest = stories[0:3]
        stories_trending = sorted(stories, key=operator.itemgetter('clap_count'), reverse=True)

    except Exception as e:
        print e.message

    return {
        'stories_latest': stories_latest,
        'stories_trending': stories_trending[0:3],
        'standard_services': Service.objects.filter(category='Standard'),
        'premium_services': Service.objects.filter(category='Premium')
    }

def takwimu_topics(request):
    sections = []
    try:
        profile_sections = ProfileSectionPage.objects.all()
        sections_by_title = OrderedDict()
        section_topics_by_title = OrderedDict()
        section_topic_indicators_by_title = OrderedDict()
        # topic_countries = {}
        for profile_section in profile_sections:
            # country = str(profile_section.get_parent())

            section_title = profile_section.title
            section = sections_by_title.setdefault(
                section_title.lower(), { 'title': section_title })
            topics_by_title = section_topics_by_title.setdefault(
                section_title.lower(), OrderedDict())
            topic_indicators_by_title = section_topic_indicators_by_title.setdefault(
                section_title.lower(), OrderedDict())
            for section_topic in profile_section.body:
                topic_title =  section_topic.value['title']
                topic = topics_by_title.setdefault(
                    topic_title.lower(), { 'title': topic_title })

                indicators_by_title = topic_indicators_by_title.setdefault(
                    topic_title.lower(), OrderedDict())
                for topic_indicator in section_topic.value['indicators']:
                    indicator_title = topic_indicator.value['title']
                    indicator = indicators_by_title.setdefault(
                        indicator_title.lower(), { 'title': indicator_title })
                    print(indicator)

                #     indicator = {
                #         'title': topic_indicator.value['title'],
                #     }
                #     topic['indicators'].append(indicator)
                    # topics.append(topic)
                # if not topic['indicators']:
                #     topic_country_list = topic_countries.setdefault(title, [])
                #     topic_country_list.append({
                #         'title': country,
                #         'topic': topic['title'],
                #     }
                #     section['countries'] = topic_country_list
                # else:
                #     section['topics'].append(topic)
                topic['indicators'] = indicators_by_title.viewvalues()
            section['topics'] = topics_by_title.viewvalues()
        sections = sections_by_title.viewvalues()

    except Exception as e:
        print e.message

    return {
        'sections': sections,
    }
