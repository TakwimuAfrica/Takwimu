from django.core.management.base import BaseCommand
from django.conf import settings
from takwimu.models.dashboard import ProfilePage, ProfilePageSection

from wagtail.core.blocks import StructValue
from selenium import webdriver

class Command(BaseCommand):
    help = "Scrape WorldBank Data Indicators"

    def handle(self, *args, **options):
        options = webdriver.ChromeOptions()
        options.add_argument('headless')
        # chrome can not be run as root, which is the case in docker
        options.add_argument('no-sandbox')
        options.add_argument('disable-gpu')
        browser = webdriver.Chrome(options=options)

        for profile in ProfilePage.objects.iterator():
            for topic in profile.body:
                for content in topic.value["body"]:
                    if isinstance(content.value, StructValue):
                        for widget in content.value["widget"]:
                            if "raw_html" in widget.value:
                                browser.get("data:text/html;charset=utf-8," + """
                                            <html>
                                                <body>
                                                    %s
                                                </body>
                                            </html>
                                        """
                                        % widget.value["raw_html"])
                                try:
                                    iframe = browser.find_element_by_tag_name("iframe")
                                except:
                                    continue

                                if 'https://' not in iframe.get_attribute('src'):
                                    browser.execute_script("document.getElementsByTagName('iframe')[0].setAttribute('src', 'https:' + document.getElementsByTagName('iframe')[0].getAttribute('src'))")

                                browser.switch_to.frame(browser.find_element_by_tag_name("iframe"))
                                html = browser.page_source
                                if html:
                                    with open('./indicators/%s.html' % widget.id, 'w') as f:
                                        f.write(html)
                                    widget.value["raw_html"] = html
                                    profile.save()
                                else:
                                    with open('./indicators/empty-%s.html' % widget.id, 'w') as f:
                                        f.write(widget.value["raw_html"])
