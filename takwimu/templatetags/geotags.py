from django import template

register = template.Library()

CENSUS = {
    'tanzania': '2012',
    'kenya': '2009',
    'nigeria': '2006',
    'senegal': '2013',
    'ethiopia': '2007',
}

LEVEL1_NAMES = {
    'tanzania': 'Region',
    'kenya': 'County',
    'nigeria': 'State',
    'senegal': 'Region',
    'ethiopia': 'Region',
}


@register.filter
def census_year(country):
    return CENSUS.get(country.lower(), 'Unknown')


@register.filter
def geo_level(geo):
    current_geo = geo.get('this')
    if current_geo.get('geo_level') == 'level1':
        try:
            country_name = geo['parents']['country']['short_name']
            return LEVEL1_NAMES.get(country_name.lower(), 'Level1')
        except KeyError:
            return 'Level1'
    else:
        return current_geo['geo_level'].title()



