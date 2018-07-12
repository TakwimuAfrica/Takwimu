from django import template
import time
register = template.Library()

def print_timestamp(timestamp):
    '''
    https://stackoverflow.com/a/10715876/1298144
    '''
    try:
        #assume, that timestamp is given in seconds with decimal point
        ts = float(timestamp)
    except ValueError:
        return None
    return time.strftime("%b %d", time.gmtime(ts))

register.filter(print_timestamp)
