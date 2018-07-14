from takwimu.signals import return_data_values
from django.test import TestCase


class TestCSVUpload(TestCase):
    def test_upload_non_csv_returns_exception(self):
        self.fail('Not Implemented')

    def test_upload_csv_with_no_geo_column_raises_exception(self):
        self.fail('Not implemented')

    def test_upload_csv_with_no_value_column_raises_exception(self):
        self.fail('Not implemented')

    def test_none_disaggregated_data_computed_successfuly(self):
        self.fail('Not implemented')

    def test_data_values_format(self):
        self.fail('Not Implemented')