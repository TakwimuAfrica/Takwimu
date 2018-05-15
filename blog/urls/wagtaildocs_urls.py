from django.conf.urls import url, include
from wagtail.documents import urls as wagtaildocs_urls

urlpatterns = [
    url(r'^', include(wagtaildocs_urls)),

]