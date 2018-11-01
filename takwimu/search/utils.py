
def get_widget_data(widget):
    try:
        title = widget['value'].get('title')
        source = widget['value'].get('source')
        body = None

        _type = widget['type']
        if _type == "html":
            body = widget['value'].get('raw_html', '')
        elif _type == 'free_form':
            body = widget['value'].get('body', '')
        elif _type == 'embed':
            body = ''

        elif _type == 'document':
            body = ''

        elif _type == 'image':
            body = widget['value'].get('caption', '')

        elif _type == 'hurumap':
            body = widget['value'].get('subtitle', '')

        elif _type == 'entities':
            body = ''
            for entity in widget['value']['entities']:
                body += entity['description']
                body += " "

        if title and source:
            return {
                "widget_id": widget['id'],
                "body": body + " " + title + " " + source,
                "type": "indicator_widget"
            }
        return None
    except KeyError:
        return None