## Blogs App

Quick start
-----------

1. Add "blog" to your INSTALLED_APPS setting like this::

    INSTALLED_APPS = [
        ...
        'blog',
    ]
    
2. Add `blog` apps and middleware to `settings.py`
    ```python
    from blog import BLOG_APPS, BLOG_MIDDLEWARE
    MIDDLEWARE += BLOG_MIDDLEWARE
    INSTALLED_APPS += BLOG_APPS
    ```

3. Include the polls URLconf in your project urls.py like this::

    ```python
    url(r'^admin/', include(wagtailadmin_urls)),
    url(r'^documents/', include(wagtaildocs_urls)),
    url(r'^blog/', include(blogs_urls)),
    ```

4. Run `python manage.py migrate` to create the `blog` models.
