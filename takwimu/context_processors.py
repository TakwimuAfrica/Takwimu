import json
import operator

from collections import OrderedDict
from takwimu import settings
from takwimu.utils.medium import Medium

from takwimu.models.dashboard import ProfileSectionPage
from takwimu.models.dashboard import TopicPage


def takwimu_stories(request):

    stories_latest = []
    stories_trending = []

    try:
        if settings.HURUMAP.get('url') != 'https://takwimu.africa':
            with open('data/articles.json') as f:
                stories = json.load(f)
        else:
            client = Medium()
            stories = client.get_publication_posts('takwimu-africa',
                                                    count=20)
        stories_latest = stories[0:3]
        stories_trending = sorted(
            stories, key=operator.itemgetter('clap_count'), reverse=True)

    except Exception as e:
        print(e.message)

    return {
        'stories_latest': stories_latest,
        'stories_trending': stories_trending[0:3]
    }


def takwimu_topics(request):
    """
        Sections, topics with indicators and key issues
    """

    sections = []
    try:
        profile_sections = ProfileSectionPage.objects.live()
        sections_by_title = OrderedDict()
        section_topics_by_title = OrderedDict()
        section_topic_indicators_by_title = OrderedDict()
        for section_num, profile_section in enumerate(profile_sections, start=1):
            country = str(profile_section.get_parent())
            default_section = {
                'id': 'section-{}'.format(section_num),
                'title': profile_section.title,
                'href': 'section-{}-topics'.format(section_num),
                'key_issues': [],
            }
            section = sections_by_title.setdefault(
                default_section['title'].lower(), default_section)
            topics_by_title = section_topics_by_title.setdefault(
                default_section['title'].lower(), OrderedDict())
            topic_indicators_by_title = section_topic_indicators_by_title.setdefault(
                default_section['title'].lower(), OrderedDict())
            for topic_num, section_topic in enumerate(profile_section.body, start=1):
                # Topics that have no indicators (key issues) should be
                # displayed separately.
                topic_title = section_topic.value['title']
                if not section_topic.value['indicators']:
                    section['key_issues'].append({
                        'id': '{}-key_issue-{}'.format(section['id'], topic_num),
                        'title': topic_title,
                        'country': country,
                        'href': profile_section.get_url(request),
                    })
                else:
                    default_topic = {
                        'id': 'topic-{}'.format(topic_num),
                        'title': topic_title,
                        'href': '{}-topic-{}-indicators'.format(section['id'], topic_num),
                    }
                    topic = topics_by_title.setdefault(
                        default_topic['title'].lower(), default_topic)
                    indicators_by_title = topic_indicators_by_title.setdefault(
                        topic_title.lower(), OrderedDict())
                    for indicator_num, topic_indicator in enumerate(section_topic.value['indicators'], start=1):
                        indicator_title = topic_indicator.value['title']
                        default_indicator = {
                            'id': 'indicator-{}'.format(indicator_num),
                            'title': indicator_title,
                            'href': '{}-country-selection'.format(topic['href']),
                            'countries': [],
                        }
                        indicator = indicators_by_title.setdefault(
                            indicator_title.lower(), default_indicator)
                        indicator['countries'].append({
                            'title': country,
                            'href': profile_section.get_url(request),
                        })

                    topic['indicators'] = indicators_by_title.values()

            section['topics'] = topics_by_title.values()

        sections = sections_by_title.values()
    except Exception as e:
        print(e.message)

    return {
        'sections': sections,
    }
