from django.core.management.base import BaseCommand
from takwimu.models.dashboard import ProfilePage

import time
import urllib.parse
from selenium import webdriver

from io import BytesIO
from django.core.files.images import ImageFile
from wagtail.images.models import Image


class Command(BaseCommand):
    help = ''

    def handle(self, *args, **options):
        options = webdriver.ChromeOptions()
        options.add_argument('headless')
        # chrome can not be run as root, which is the case in docker
        options.add_argument('no-sandbox')
        options.add_argument('disable-gpu')
        browser = webdriver.Chrome(options=options)

        profile_page = ProfilePage.objects.first()
        for topic in profile_page.body.stream_data:
            for item in topic["value"].get("body"):
                if item["type"] == "indicator":
                    widget = item["value"]["widget"][0]
                    if widget["type"] == "html":
                        data = widget["value"]
                        browser.get(f"""data:text/html;charset=utf-8,{urllib.parse.quote(data["raw_html"])}""")
                        time.sleep(5)
                        browser.save_screenshot(f'screenshots/{widget["id"]}.png')
                        png = browser.get_screenshot_as_png()

                        image = Image.objects.filter(title=widget["id"]).first()
                        if image is None:
                            print('creating')
                            image = Image(title=widget["id"], file=ImageFile(BytesIO(png), name=widget["id"]))
                        else:
                            print('updating')
                            image.file = ImageFile(BytesIO(png), name=widget["id"])
                        image.save()
                        print(image.id)
                        print(image.file)