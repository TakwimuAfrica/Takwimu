from django import template

register = template.Library()

CENSUS = {
    'tanzania': '2012',
    'nigeria': '2006',
    'senegal': '2013'
}


@register.filter
def census_year(country):
    return CENSUS.get(country.lower(), 'Unknown')


