import uuid
from django import template
from django.template import Variable, VariableDoesNotExist

register = template.Library()

@register.simple_tag
def to_list(*args):
    return args

@register.simple_tag(name='uuid')
def next_uuid():
    return uuid.uuid4()

@register.filter
def object_value(obj, attr):
    pseudo_context = { 'object' : obj }
    try:
        value = Variable('object.%s' % attr).resolve(pseudo_context)
    except VariableDoesNotExist:
        value = None
    return value
