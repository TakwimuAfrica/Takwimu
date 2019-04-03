import json
import operator
from collections import OrderedDict

from django.conf import settings
from django.utils.text import slugify

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


def get_takwimu_stories():
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

        stories_dict = [i.__dict__ for i in stories]
        stories_trending = sorted(
            stories_dict, key=operator.itemgetter('clap_count'), reverse=True)
    except Exception as e:
        pass

    return {
        'stories_latest': stories_latest,
        'stories_trending': stories_trending[0:3]
    }


def get_takwimu_countries(published_status):
    countries = []
    for code, names in COUNTRIES.items():
        country = {
            'name': names['name'],
            'short_name': names['short_name'],
            'slug': slugify(names['name']),
            'published': published_status[code]
        }
        countries.append(country)

    return {'countries': countries}
