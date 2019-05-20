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


def page_indicators_to_images(page, browser):
    for topic in page.body.stream_data:
        for item in topic["value"].get("body"):
            if item["type"] == "indicator":
                indicator_id = item["id"]
                widget = item["value"]["widget"][0]

                data = None
                if widget["type"] == "html":
                    data = widget["value"]
                    browser.get(
                        f"""data:text/html;charset=utf-8,{urllib.parse.quote(data["raw_html"])}""")
                if widget["type"] == "flourish":
                    data = widget["value"]
                    browser.get(
                        f"""data:text/html;charset=utf-8,<html><body><iframe src="/flourish/{data["html"]}"/></body></html>""")
                if widget["type"] == "hurumap":
                    data = widget["value"]
                    browser.get(
                        f"""data:text/html;charset=utf-8,<iframe
                            allowFullScreen
                            title="${data["title"]}"
                            src="/embed/iframe.html?geoID=country-${
                            data["data_country"]
                            }&geoVersion=2009&chartDataID=${data["data_id"]}&dataYear=2011&chartType=${
                            data["chart_type"]
                        }&chartHeight=300&chartTitle=${data["title"]}&initialSort=&statType=${
                            data["data_stat_type"]
                        }"
                        />""")

                if data:
                    # Wait for animation
                    # in some indicators
                    time.sleep(5)

                    png = browser.get_screenshot_as_png()

                    model = get_image_model()

                    image = model.objects.filter(title=indicator_id).first()
                    if image is None:
                        image = model(title=indicator_id, file=ImageFile(
                            BytesIO(png), name=indicator_id))
                    else:
                        image.file = ImageFile(BytesIO(png), name=indicator_id)
                    image.save()
