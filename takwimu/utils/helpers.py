import json
from collections import OrderedDict
from operator import itemgetter

from django.conf import settings
from django.utils.text import slugify

from wagtail.core.templatetags import wagtailcore_tags

from takwimu.utils.medium import Medium

COUNTRIES = OrderedDict()

COUNTRIES['BF'] = {
    'iso_name': 'Burkina Faso',
    'name': 'Burkina Faso',
    'short_name': 'Burkina Faso',
}
COUNTRIES['CD'] = {
    'iso_name': 'Congo, the Democratic Republic of the',
    'name': 'Democratic Republic of Congo',
    'short_name': 'DR Congo',
}
COUNTRIES['ET'] = {
    'iso_name': 'Ethiopia',
    'name': 'Ethiopia',
    'short_name': 'Ethiopia',
}
COUNTRIES['KE'] = {
    'iso_name': 'Kenya',
    'name': 'Kenya',
    'short_name': 'Kenya',
}
COUNTRIES['NG'] = {
    'iso_name': 'Nigeria',
    'name': 'Nigeria',
    'short_name': 'Nigeria',
}
COUNTRIES['SN'] = {
    'iso_name': 'Senegal',
    'name': 'Senegal',
    'short_name': 'Senegal',
}
COUNTRIES['ZA'] = {
    'iso_name': 'South Africa',
    'name': 'South Africa',
    'short_name': 'South Africa',
}
COUNTRIES['TZ'] = {
    'iso_name': 'Tanzania, United Republic of',
    'name': 'Tanzania',
    'short_name': 'Tanzania',
}
COUNTRIES['UG'] = {
    'iso_name': 'Uganda',
    'name': 'Uganda',
    'short_name': 'Uganda',
}
COUNTRIES['ZM'] = {
    'iso_name': 'Zambia',
    'name': 'Zambia',
    'short_name': 'Zambia',
}


def get_takwimu_stories(social_media_settings, return_dict=False):
    stories_latest = []

    try:
        if settings.HURUMAP.get('url').rstrip('/').endswith('takwimu.africa'):
            client = Medium()
            stories = client.get_posts(social_media_settings.medium, count=3,
                                       return_dict=True)
        else:
            with open('data/articles.json') as f:
                stories = json.load(f)

        stories_latest = stories[0:3]
    except Exception:
        pass

    if len(stories_latest) > 3:
        stories_latest = stories_latest[:3]

    return {
        'stories': stories_latest,
    }


def get_takwimu_countries(published_status):
    countries = []
    for code, names in COUNTRIES.items():
        country = {
            'iso_code': code,
            'name': names['name'],
            'iso_name': names['iso_name'],
            'short_name': names['short_name'],
            'slug': slugify(names['name']),
            'published': published_status[code]
        }
        countries.append(country)

    return {'countries': sorted(countries, key=itemgetter('iso_name'))}


def get_takwimu_profile_navigation(profile_settings):
    if profile_settings.other_topics_in_title:
        return {
            'type': 'profile_navigation',
            'value': {
                'title': profile_settings.other_topics_in_title,
            }
        }

    return {}


def get_takwimu_profile_read_next(profile_settings):
    if profile_settings.read_next_title:
        return {
            'type': 'read_next',
            'value': {
                'title': profile_settings.read_next_title,
            }
        }

    return {}


def get_takwimu_profile_view_country_content(profile_settings):
    if profile_settings.view_country_content:
        return {
            'type': 'view_country_content',
            'value': profile_settings.view_country_content[0].value,
        }

    return {}


def get_takwimu_services(service_settings):
    items = []
    for service in service_settings.services:
        if service.value['category'].lower() == 'persona':
            item = {
                'type': 'service',
                'value': {
                    'title': service.value['title'],
                    'description': str(wagtailcore_tags.richtext(service.value['description'])),
                }
            }
            items.append(item)

    return {
        'type': 'services',
        'value': {
            'label': service_settings.label,
            'title': service_settings.title,
            'description': wagtailcore_tags.richtext(service_settings.description),
            'services': items,
        }
    }


def get_takwimu_faqs(faq_settings):
    items = []
    for faq in faq_settings.faqs:
        item = {
            'type': 'faq',
            'value': {
                'question': faq.value['question'],
                'answer': str(wagtailcore_tags.richtext(faq.value['answer'])),
            }
        }
        items.append(item)

    return {
        'type': 'faqs',
        'value': {
            'label': faq_settings.label,
            'title': faq_settings.title,
            'description': wagtailcore_tags.richtext(faq_settings.description),
            'faqs': items
        }
    }
