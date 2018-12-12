from django.conf import settings

from takwimu.profiles.census import get_country_and_level

def get_page_releases_per_country(dataset_name, geo, year, filter_releases=True):
    """
    Return the active release being viewed and a list of related releases
    for a geo and dataset
    """
    from wazimap.models import Dataset

    releases = {}
    releases.setdefault('other', [])

    query = Dataset.objects.get(name=dataset_name).releases.order_by('-year')

    country, _ = get_country_and_level(geo)

    # Some releases don't have data for all geo_levels
    available_years = settings.WAZIMAP['available_release_years'].get(country, None)
    if filter_releases and available_years:
        query = query.filter(year__in=available_years)

    dataset_releases = [
        r.as_dict() for r in query.all()]

    if year == 'latest':
        releases['active'] = dataset_releases[0]
        releases['other'] = dataset_releases[1:]
    else:
        for r in dataset_releases:
            if r['year'] == str(year):
                releases['active'] = r
            else:
                releases['other'].append(r)

    return releases
