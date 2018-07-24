from django import template
from django.utils.safestring import mark_safe
from django.template.loader import render_to_string

import codecs
import markdown

register = template.Library()


@register.filter
def safemark(content):
    return markitdown(content)


def markitdown(contents):
    return mark_safe(markdown.markdown(contents, output_format='html5'))


@register.filter
def safemarktemplate(template_name, **kargs):
    contents = render_to_string(template_name, kargs)
    return markitdown(contents)


@register.filter
def safemarkfile(filename):
    contents_file = codecs.open(filename, mode='r', encoding='utf-8')
    contents = contents_file.read()
    return markitdown(contents)
