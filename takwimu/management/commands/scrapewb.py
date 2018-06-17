from django.core.management.base import BaseCommand, CommandError

import wbdata
from hurumap.models.data import DataIndicatorPublisher, DataIndicator, \
    DataIndicatorValue


class Command(BaseCommand):
    help = 'Scrape WorldBank Data Indicators'

    def handle(self, *args, **options):
        publisher, created = DataIndicatorPublisher.objects.get_or_create(
            slug='world-bank',
            defaults={
                'name': 'World Bank',
                'url': 'https://worldbank.org/',
                'description': 'Hello'
            }
        )

        wb_indicators = wbdata.get_indicator(display=False)
        for wb_indicator in wb_indicators:

            try:
                # takwimu_countries =
                wb_indicator_values = wbdata.get_data(
                    wb_indicator.get('id'),
                    country=["NG", "SN", "TZ"]
                )

                if len(filter(self.filter_indicators,
                              wb_indicator_values)) == 0:
                    self.stdout.write(self.style.WARNING(
                        'Skipped indicator "%s"' % wb_indicator.get(
                            'id')))
                    continue

                indicator, created = DataIndicator.objects.get_or_create(
                    publisher=publisher,
                    publisher_code=wb_indicator.get('id'),
                    defaults={
                        'publisher_data': wb_indicator,
                        'name': wb_indicator.get('name'),
                        'source': wb_indicator.get('source'),
                        'source_note': wb_indicator.get('sourceNote'),
                        'topics': list(wb_indicator.get('topics'))
                    }
                )

                for wb_indicator_val in wb_indicator_values:
                    indicator_val, created = DataIndicatorValue.objects.get_or_create(
                        indicator=indicator,
                        country=wb_indicator_val.get('country'),
                        date=wb_indicator_val.get('date'),
                        defaults={
                            'publisher_data': wb_indicator_val,
                            'decimal': wb_indicator_val.get('decimal'),
                            'value': wb_indicator_val.get('value')
                        }
                    )
                    self.stdout.write(self.style.SUCCESS(
                        'Successfully created indicator value "%s"' % wb_indicator.get(
                            'id')))
            except Exception as e:
                self.stdout.write(self.style.NOTICE(
                    'NOTICE "%s"' % e.message))
                continue

            self.stdout.write(self.style.SUCCESS(
                'Successfully created indicator "%s"' % wb_indicator.get('id')))

    def filter_indicators(self, indicator):
        if indicator.get('value', None):
            return True
        else:
            return False
