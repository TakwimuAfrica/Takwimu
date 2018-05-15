from django.conf.urls import include, url
from wagtail.documents import urls as wagtaildocs_urls

urlpatterns = [
    url(r'^', include(wagtaildocs_urls)),

]
