from django.core.management.base import BaseCommand, CommandError

import csv
from  urllib.request import urlopen

import wbdata
from hurumap.models.data import DataIndicatorPublisher, DataIndicator


class Command(BaseCommand):
    help = 'Scrape WorldBank Data Indicators'

    def handle(self, *args, **options):

        scraper = 'wb'
        scraper_source_url = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQypCD98NFYyTynEmKnx_m-cZ6BDOYCOu_GrzziImtRBTqo9zeviAi0ilcTzRJCMOTILx6GKleUz2cw/pub?gid=680891341&single=true&output=csv'

        # Create publisher if doesn't exist
        publisher, created = DataIndicatorPublisher.objects.update_or_create(
            slug='world-bank-data-scraper',
            defaults={
                'name': 'World Bank Data Scraper',
                'url': 'https://data.worldbank.org/',
                'description': 'Free and open access to global development data.'
            }
        )

        # CSV to array
        scraper_source_csv = csv.reader(urlopen(scraper_source_url))
        scraper_source_csv_data = []
        for row in scraper_source_csv:
            scraper_source_csv_data.append(row)
        scraper_source_csv_data.pop(0)

        # Create dict of the indicators
        scraper_source_csv_header = ['code','title', 'description', 'indicators', 'publisher']
        scraper_indicators = []
        for data in scraper_source_csv_data:
            scraper_indicators.append(dict(zip(scraper_source_csv_header, data)))
        
        # Countries to scrape + map the id with Wazimap Geo Ids (geo_level + geo_code)
        scraper_countries = ["NG", "SN", "TZ"]
        wazimap_geo_ids = ["country-NGA", "country-SEN", "country-TZA"]
        scraper_countries_wazimap = dict(zip(scraper_countries, wazimap_geo_ids))

        for scraper_indicator in scraper_indicators:

            # DataIndicator needs
            code = 'scraper' + '.' + scraper + '.' + scraper_indicator.get('code')
            publisher_codes = ','.join(map(str.strip, scraper_indicator.get('indicators').split('\n')))
            publisher_data = {
                'type': 'api',
                'values': []
            }
            data_values = {}

            # Create geo and _total + _average under each geo
            for scraper_country in scraper_countries:
                default_total_avg = {
                    '_default': 0,
                    'values': {}
                }
                data_values[scraper_country] = {
                    '_total': default_total_avg,
                    '_average': default_total_avg
                }
            
            # Download WB indicators and set values
            wb_indicators = []
            for publisher_code in publisher_codes.split(','):
                wb_indicators.append(wbdata.get_indicator(indicator=publisher_code, display=False)[0])
            
            for wb_indicator in wb_indicators:
                
                data_values_wb = {
                    '_name': wb_indicator.get('name'),

                    # TODO: Set these under data_values = {'<geo_code>': ... , '_indicators': {'<indicator.code>': ... }}
                    '_topics': wb_indicator.get('topics'),
                    '_source': wb_indicator.get('source'),
                    '_sourceNote': wb_indicator.get('sourceNote'),
                    '_sourceOrganization': wb_indicator.get('sourceOrganization'),

                    '_default': 0,
                    'values': {}
                }

                # Create indicator under each geo
                for scraper_country in scraper_countries:
                    data_values[scraper_country][wb_indicator.get('id')] = data_values_wb

                try:
                    wb_indicator_values = wbdata.get_data(
                        wb_indicator.get('id'),
                        country=scraper_countries
                    )

                    # Whatever we receive, we add to publisher_data
                    publisher_data['values'].append(wb_indicator_values)

                    # Skip indicator if no values
                    if len(filter(self.filter_indicators,
                                wb_indicator_values)) == 0:
                        self.stdout.write(self.style.WARNING(
                            'Skipped WB Indicator "%s"' % wb_indicator.get(
                                'id')))
                        continue
                    
                    # Set default + total indicator value
                    # TODO: Determine how to use wb_indicator_values[0].get('decimal')
                    data_values[wb_indicator_values[0].get('country').get('id')][wb_indicator.get('id')]\
                        ['_default'] = int(wb_indicator_values[0].get('value'))
                    data_values[wb_indicator_values[0].get('country').get('id')]['_total']\
                        ['_default'] += int(wb_indicator_values[0].get('value'))
                    # Set the rest of the indicator values
                    for wb_indicator_value in wb_indicator_values:
                        # TODO: Determine how to use wb_indicator_value.get('decimal')
                        data_values[wb_indicator_value.get('country').get('id')][wb_indicator.get('id')]['values']\
                            [wb_indicator_value.get('date')] = int(wb_indicator_value.get('value'))
                
                except Exception as e:
                    self.stdout.write(self.style.NOTICE(
                        'NOTICE "%s"' % e.message))
                    continue
                
                
            
            # TODO: Set the _average of all values:

            # Change data_value keys from scraper_countries to wazimap_geo_ids
            data_values_old = data_values
            data_values = {}
            for data_value_old_key, data_value_old in data_values_old.items():
                data_values[scraper_countries_wazimap[data_value_old_key]] = data_value_old

            # Create DataIndicator if it doesn't exist, update otherwise
            indicator, created = DataIndicator.objects.update_or_create(
                code=code,
                publisher=publisher,
                scraper=scraper,
                defaults={
                    'title': scraper_indicator.get('title'),
                    'description': scraper_indicator.get('description'),

                    'publisher_codes': publisher_codes,
                    'publisher_data': publisher_data,

                    'data_values': data_values
                }
            )

            self.stdout.write(self.style.SUCCESS(
                    'Successfully created indicator "%s"' % indicator.code))

    def filter_indicators(self, indicator):
        if indicator.get('value', None):
            return True
        else:
            return False
