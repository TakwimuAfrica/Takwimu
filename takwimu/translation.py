from .models import TopicPage
from modeltranslation.translator import TranslationOptions
from modeltranslation.decorators import register

@register(TopicPage)
class TopicPageTR(TranslationOptions):
    fields = (
        'description',
    )