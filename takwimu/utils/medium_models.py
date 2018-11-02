def to_dict(model):
    return dict((get_key(key), value)
                for key, value in model.__dict__.items()
                if not callable(value) and not key.startswith("__"))


def get_key(key):
    return key.replace("_", "", 1) if key.startswith("_") else key


class Post:
    def __init__(self, post_id):
        self.post_id = post_id

    @property
    def title(self):
        return self._title

    @title.setter
    def title(self, title):
        self._title = title

    @property
    def subtitle(self):
        return self._subtitle

    @subtitle.setter
    def subtitle(self, subtitle):
        self._subtitle = subtitle

    @property
    def post_date(self):
        return self._post_date

    @post_date.setter
    def post_date(self, date):
        self._post_date = date

    @property
    def url(self):
        return self._url

    @url.setter
    def url(self, url):
        self._url = url

    @property
    def recommend_count(self):
        return self._recommend_count

    @recommend_count.setter
    def recommend_count(self, count):
        self._recommend_count = count

    @property
    def response_count(self):
        return self._response_count

    @response_count.setter
    def response_count(self, count):
        self._response_count = count

    @property
    def clap_count(self):
        return self._clap_count

    @clap_count.setter
    def clap_count(self, count):
        self._clap_count = count

    @property
    def read_time(self):
        return self._read_time

    @read_time.setter
    def read_time(self, time):
        self._read_time = time

    @property
    def word_count(self):
        return self._word_count

    @word_count.setter
    def word_count(self, count):
        self._word_count = count

    @property
    def image_count(self):
        return self._image_count

    @image_count.setter
    def image_count(self, count):
        self._image_count = count

    @property
    def preview_image(self):
        return self._preview_image

    @preview_image.setter
    def preview_image(self, image):
        self._preview_image = image

    @property
    def post_tags(self):
        return self._post_tags

    @post_tags.setter
    def post_tags(self, tags):
        self._post_tags = tags

    def __str__(self, *args, **kwargs):
        return str(to_dict(self))

    def __repr__(self, *args, **kwargs):
        return str(to_dict(self))

    def __dict__(self):
        return to_dict(self)


class Image:
    def __init__(self, image_id):
        self.image_id = image_id

    @property
    def original_height(self):
        return self._original_height

    @original_height.setter
    def original_height(self, height):
        self._original_height = height

    @property
    def original_width(self):
        return self._original_width

    @original_width.setter
    def original_width(self, width):
        self._original_width = width

    @property
    def url(self):
        return self._url

    @url.setter
    def url(self, url):
        self._url = url

    def __str__(self, *args, **kwargs):
        return str(to_dict(self))

    def __repr__(self, *args, **kwargs):
        return str(to_dict(self))
