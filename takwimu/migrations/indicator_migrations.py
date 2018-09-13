import json
import uuid

from django.core.serializers.json import DjangoJSONEncoder
from wagtail.wagtailcore.blocks import StreamValue
from django.db import migrations


def indicators_to_indicator_groups(topic):
    indicator_groups = []
    if 'indicators' in topic['value'].keys():
        try:
            indicators = topic['value']['indicators']
            for indicator in indicators:
                indicator_groups.append({
                    'type': 'indicator_groups',
                    'id': str(uuid.uuid1()),
                    'value': {
                        'group_title': indicator['value']['title'],
                        'indicators': [indicator]
                    }
                })
            topic['value']['indicator_groups'] = indicator_groups
            del topic['value']['indicators']
            return topic
        except KeyError as e:
            print(e)
            del topic['value']['indicators']
            topic['value']['indicator_groups'] = []
            return topic
    else:
        return topic


def indicator_groups_to_indicators(topic):
    indicators = []
    if 'indicator_groups' in topic['value'].keys():
        try:
            groups = topic['value']['indicator_groups']
            for group in groups:
                indicators.append(
                    {
                        'indicators': group['value']['indicators']
                    }
                )

            topic['value']['indicators'] = indicators
            return topic
        except KeyError:
            topic['value']['indicators'] = []
            return topic
    else:
        return topic


def get_stream_data(page, mapper):
    stream_data = []
    for topic in page.body.stream_data:
        stream_data.append(mapper(topic))

    return stream_data


def migrate(apps, mapper):
    ProfileSectionPage = apps.get_model('takwimu', 'ProfileSectionPage')
    for page in ProfileSectionPage.objects.all():
        stream_data = get_stream_data(page, mapper)
        raw_text = json.dumps(stream_data, cls=DjangoJSONEncoder)
        stream_block = page.body.stream_block
        page.body = StreamValue(stream_block, [], is_lazy=True,
                                raw_text=raw_text)
        page.save()

    ProfilePage = apps.get_model('takwimu', 'ProfilePage')
    for page in ProfilePage.objects.all():
        stream_data = get_stream_data(page, mapper)
        raw_text = json.dumps(stream_data, cls=DjangoJSONEncoder)
        stream_block = page.body.stream_block
        page.body = StreamValue(stream_block, [], is_lazy=True,
                                raw_text=raw_text)
        page.save()




def forwards(apps, schema_editor):
    migrate(apps, indicators_to_indicator_groups)


def backwards(apps, schema_editor):
    migrate(apps, indicator_groups_to_indicators)


class Migration(migrations.Migration):
    dependencies = [
        ('takwimu', '0037_faqsetting_data'),
    ]

    operations = [
        migrations.RunPython(forwards, backwards),
    ]
