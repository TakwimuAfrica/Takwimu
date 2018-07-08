from django.conf.urls import include, url
from django.conf.urls.static import static
from django.views.generic import RedirectView
from hurumap.urls import urlpatterns as hurumap_urlpatterns
from takwimu.feed import CountryProfileFeed

from takwimu import settings
from takwimu.views import HomePageView, SupportServicesView

urlpatterns = static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT) + \
              static(settings.STATIC_URL, document_root=settings.STATIC_ROOT) + \
              [
                  url(r'^$', HomePageView.as_view(), name='home'),
                  url(r'^about/support-services', SupportServicesView.as_view(), name='about_support_services'),
                  url(r'^about$', RedirectView.as_view(permanent=False,   url='/about/')),
                  url(r'^feed/$', CountryProfileFeed(), name='rss_feed')
              ] + \
              hurumap_urlpatterns

if settings.DEBUG:
    import debug_toolbar
    urlpatterns = [
        url(r'^__debug__/', include(debug_toolbar.urls)),
    ] + urlpatterns