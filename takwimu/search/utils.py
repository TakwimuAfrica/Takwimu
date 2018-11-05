from takwimu.models import ProfileSectionPage, ProfilePage


def get_widget_data(widget):
    try:
        widget_id = widget['id']
        widget_value = widget['value']
        widget_type = widget['type']
    except KeyError:
        return None

    title = widget_value.get('title', '')
    source = widget_value.get('source', '')

    if widget_type == 'html':
        body = widget_value.get('raw_html', '')
    elif widget_type == 'free_form':
        body = widget_value.get('body', '')
    elif widget_type == 'embed':
        body = ''
    elif widget_type == 'document':
        body = ''
    elif widget_type == 'image':
        body = widget_value.get('caption', '')
    elif widget_type == 'hurumap':
        body = widget_value.get('subtitle', '')
    elif widget_type == 'entities':
        body = ''
        for entity in widget_value.get('entities', ''):
            entity_content = '\n'.join(
                [entity.get('name', ''), entity.get('description', '')])
            body = '\n\n'.join([body, entity_content])

    return {
        'widget_id': widget_id,
        'body': '\n'.join([title, body, source]),
    }


def get_page_details(page):
    country = ''
    category = ''
    parent_page_type = ''
    if isinstance(page, ProfileSectionPage):
        country = str(page.get_parent())
        category = page.title
        parent_page_type = 'ProfileSectionPage'
    elif isinstance(page, ProfilePage):
        country = str(page)
        category = 'Country Overview'
        parent_page_type = 'ProfilePage'

    return country, category, parent_page_type
