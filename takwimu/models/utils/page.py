import time
import urllib.parse

from io import BytesIO
from django.core.files.images import ImageFile
from wagtail.images import get_image_model


def find_indicator_with_id_from_page(indicator_id, page):
    for topic in page.body.stream_data:
        for indicator in topic["value"].get("body"):
            if indicator["type"] == "indicator":
                if indicator_id == indicator["id"]:
                    return indicator
    return None
