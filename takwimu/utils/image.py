import base64

from django.core.files.base import ContentFile


def decode_base64_file(data, file_name):
    format, imgstr = data.split(';base64,')
    ext = format.split('/')[-1]
    data = ContentFile(base64.b64decode(imgstr), name=f"{file_name}.{ext}")
    return data
