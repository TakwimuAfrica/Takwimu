from django.conf.urls import url
from django.conf.urls.static import static
from hurumap.urls import urlpatterns as hurumap_urlpatterns

from takwimu import settings
from takwimu.views import CountryReport, ContactUsPage

urlpatterns = static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT) + \
              static(settings.STATIC_URL, document_root=settings.STATIC_ROOT) + \
              [ url(r'^report', CountryReport.as_view(), name='country_report'),
                url(r'^about/contact', ContactUsPage.as_view(), name='contact'), ] + \
              hurumap_urlpatterns 
