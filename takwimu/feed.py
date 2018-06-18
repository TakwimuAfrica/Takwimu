from django.core.urlresolvers import reverse
from django.db import models
from django.contrib.syndication.views import Feed
from takwimu.models import ReportPage


class CountryReportFeed(Feed):
    title = "Country Reports Feed"
    link = "/report-feed/"
    description = "Updates on changes to country reports"

    def items(self):
        return ReportPage.objects.order_by('-latest_revision_created_at')

    def item_title(self, item):
        return item.title

    def item_description(self, item):
        return ''

    def item_link(self, item):
        return item.get_url()