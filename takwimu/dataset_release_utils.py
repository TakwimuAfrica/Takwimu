from django.conf import settings


def get_country_geo_code(geo):
    level = geo.geo_level.lower()
    country = geo.geo_code \
        if level == 'country' \
        else geo.ancestors()[-1].geo_code

    return country


def get_page_releases_per_country(dataset_name, geo, year, filter_releases=True):
    """
    Return the active release being viewed and a list of related releases
    for a geo and dataset
    """
    from wazimap.models import Dataset

    releases = {}
    releases.setdefault('other', [])

    query = Dataset.objects.get(name=dataset_name).releases.order_by('-year')

    # get available release years for this particular level
    available_years = settings.HURUMAP['available_release_years'].get(
        geo.geo_level, 9000)

    # get the available releases for this country
    country_code = get_country_geo_code(geo)
    print '\n\n\n\n\n\n\n\n\n\n'
    print country_code
    print '\n\n\n\n\n\n\n\n\n\n'
    country_available_years = settings.HURUMAP[
        'releases_available_per_country'].get(country_code, 8000)
    
    # get the available years for the level and country in which chosen geography exists
    available_years = list(set(available_years).intersection(set(country_available_years)))

    if filter_releases and available_years:
        query = query.filter(year__in=available_years)

    dataset_releases = [
        r.as_dict() for r in query.all()]

    # since countries might have census in different years, always make the latest the primary dataset

    releases['active'] = dataset_releases[0]
    releases['other'] = dataset_releases[1:]

    return releases
