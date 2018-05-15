## Blogs App

Quick start
-----------

1. Add "blog" to your INSTALLED_APPS setting like this::

    INSTALLED_APPS = [
        ...
        'blog',
    ]

2. Include the polls URLconf in your project urls.py like this::

    ```python
    url(r'^admin/', include(wagtailadmin_urls)),
    url(r'^documents/', include(wagtaildocs_urls)),
    url(r'^blog/', include(blogs_urls)),
    ```

3. Run `python manage.py migrate` to create the `blog` models.
