from django.core.management.base import BaseCommand
from takwimu.models.dashboard import ProfilePage, ProfileSectionPage

from selenium import webdriver
from takwimu.models.utils.page import page_indicators_to_images


class Command(BaseCommand):
    help = ''

    def handle(self, *args, **options):
        options = webdriver.ChromeOptions()
        options.add_argument('headless')
        # chrome can not be run as root, which is the case in docker
        options.add_argument('no-sandbox')
        options.add_argument('disable-gpu')
        browser = webdriver.Chrome(options=options)

        for page in ProfilePage.objects.live():
            page_indicators_to_images(page, browser)
        for page in ProfileSectionPage.objects.live():
            page_indicators_to_images(page, browser)
