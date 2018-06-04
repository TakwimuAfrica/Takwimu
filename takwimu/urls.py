from django.conf.urls.static import static

from takwimu import settings
from hurumap.urls import urlpatterns as hurumap_urlpatterns

urlpatterns = static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT) + \
              static(settings.STATIC_URL, document_root=settings.STATIC_ROOT) + \
              hurumap_urlpatterns
