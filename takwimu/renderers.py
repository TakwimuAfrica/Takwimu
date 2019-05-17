from rest_framework.renderers import BaseRenderer


class CSSRenderer(BaseRenderer):
    media_type = "text/css"
    format = "css"
    charset = "utf-8"
    render_style = "text"

    def render(self, data, accepted_media_type=None, renderer_context=None):
        return data
