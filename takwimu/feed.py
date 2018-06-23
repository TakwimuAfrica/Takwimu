from django.core.urlresolvers import reverse
from django.db import models
from django.contrib.syndication.views import Feed
from takwimu.models import ReportPage


class CountryReportFeed(Feed):
    title = "Country Profiles Feed"
    link = "/feed/"
    description = "Updates on changes to country profiles"

    def items(self):
        return ReportPage.objects.live().order_by('-latest_revision_created_at')

    def item_title(self, item):
        return item.title

    def item_description(self, item):
        return 'Country Profile for {}'.format(item.title)

    def item_link(self, item):
        return item.get_absolute_url()
