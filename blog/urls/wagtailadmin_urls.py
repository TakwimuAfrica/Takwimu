from django.conf.urls import include, url
from wagtail.admin import urls as wagtailadmin_urls

urlpatterns = [
    url(r'^', include(wagtailadmin_urls)),

]
