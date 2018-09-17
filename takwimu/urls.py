from django.conf.urls import include, url
from django.conf.urls.static import static
from django.views.generic import RedirectView

from takwimu import settings
from takwimu.views import HomePageView, SupportServicesIndexView, AboutUsView, \
    LegalView, TopicView, SearchView, IndicatorsGeographyDetailView, SDGTopicView
from takwimu.views import handler404, handler500
from wazimap.views import HomepageView as ProfileView
from takwimu.feed import CountryProfileFeed
from hurumap.urls import urlpatterns as hurumap_urlpatterns

takwimu_urlpatterns = [
    url(r'^$', HomePageView.as_view(), name='home'),
    url(r'^about/support-services',
        SupportServicesIndexView.as_view(),
        name='about_support_services'),
    url(r'^about/?$', AboutUsView.as_view(), name='about_page'),
    url(r'^legal$', LegalView.as_view(), name='legal'),
    url(r'^profiles/$', ProfileView.as_view(), name='profiles'),
    url(
        r'^profiles/(?P<geography_id>\w+-\w+)(-(?P<slug>[\w-]+))?/$',
        IndicatorsGeographyDetailView.as_view(),
        name='geography_detail'),
    url(r'^topics/$', TopicView.as_view(), name='topics'),
    url(r'^sdg/$', SDGTopicView.as_view(), name='sdg'),
    url(r'^feed/$', CountryProfileFeed(), name='rss_feed'),
    url(r'^search/$', SearchView.as_view(), name='search'),
]

urlpatterns = static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT) + \
    static(settings.STATIC_URL, document_root=settings.STATIC_ROOT) + \
    takwimu_urlpatterns + \
    hurumap_urlpatterns

if settings.DEBUG:
    import debug_toolbar

    urlpatterns = [
        url(r'^404/$', handler404, name='error_404'),
        url(r'^500/$', handler500, name='error_500'),
        url(r'^__debug__/', include(debug_toolbar.urls)),
    ] + urlpatterns

handler404 = 'takwimu.views.handler404'
handler500 = 'takwimu.views.handler500'
