from django.conf.urls.static import static
from hurumap.urls import urlpatterns as hurumap_urlpatterns

from takwimu import settings

urlpatterns = static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT) + \
              static(settings.STATIC_URL, document_root=settings.STATIC_ROOT) + \
              hurumap_urlpatterns
