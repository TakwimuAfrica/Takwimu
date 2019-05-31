from io import BytesIO
import re
import time
import urllib.parse

from django.core.files.images import ImageFile

from wagtail.core.templatetags import wagtailcore_tags
from wagtail.images import get_image_model


def find_indicator_with_id_from_page(indicator_id, page):
    for topic in page.body.stream_data:
        for indicator in topic["value"].get("body"):
            if indicator["type"] == "indicator":
                if indicator_id == indicator["id"]:
                    return indicator
    return None

def filter_rich_text(text):
    filtered = wagtailcore_tags.richtext(text)
    if re.sub(r'<[^>]+>', '', filtered):
        return filtered

    return ''
