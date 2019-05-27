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
    render_style = 'binary'

    def render(self, data, media_type=None, renderer_context=None):
        return data


class FlourishHTMLRenderer(StaticHTMLRenderer):
    media_type = 'text/html'
    format = 'html'
    charset = 'utf-8'
    render_style = 'text'

    def render(self, data, media_type=None, renderer_context=None):
        return data
