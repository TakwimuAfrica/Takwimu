from django.conf.urls import url, include
from wagtail.admin import urls as wagtailadmin_urls

urlpatterns = [
    url(r'^', include(wagtailadmin_urls)),

]