from .models import TopicPageDataIndicator, TopicPage
from modeltranslation.translator import TranslationOptions
from modeltranslation.decorators import register

@register(TopicPageDataIndicator)
class TopicPageDataIndicatorTR(TranslationOptions):
    fields = (
        'indicator',
    )

@register(TopicPage)
class TopicPageTR(TranslationOptions):
    fields = (
        'description',
    )