from django.apps import AppConfig


class TakwimuConfig(AppConfig):
    name = 'takwimu'

    def ready(self):
        import takwimu.signals
