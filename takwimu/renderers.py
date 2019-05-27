from rest_framework.renderers import BaseRenderer, StaticHTMLRenderer


class CSSRenderer(BaseRenderer):
    media_type = "text/css"
    format = "css"
    charset = "utf-8"
    render_style = "text"

    def render(self, data, accepted_media_type=None, renderer_context=None):
        return data

class JavaScriptRenderer(BaseRenderer):
    media_type = "text/javascript"
    format = "js"
    charset = "utf-8"
    render_style = "text"

    def render(self, data, accepted_media_type=None, renderer_context=None):
        return data


class JPEGRenderer(BaseRenderer):
    media_type = 'image/jpeg'
    format = 'jpg'
    charset = None
    render_style = 'binary'

    def render(self, data, media_type=None, renderer_context=None):
        return data


class FlourishHTMLRenderer(StaticHTMLRenderer):
    media_type = 'text/html'
    format = 'html'
    charset = 'utf-8'
    render_style = 'text'

    def render(self, data, media_type=None, renderer_context=None):
        """
        Override the render to allow us to render unicode easily,
        the checks in here kept throwing
        AssertionError: renderer returned unicode, and did not specify a charset value
        """
        return data
