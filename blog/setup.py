import os
from setuptools import find_packages, setup

with open(os.path.join(os.path.dirname(__file__), 'README.md')) as readme:
    README = readme.read()

# allow setup.py to be run from any path
os.chdir(os.path.normpath(os.path.join(os.path.abspath(__file__), os.pardir)))

setup(
    name='takwimu-blog',
    version='0.1',
    packages=find_packages(),
    include_package_data=True,
    license='BSD License',
    description='A blog using wagtail cms',
    long_description=README,
    url='https://codeforafrica.org',
    install_requires=[
        'wagtail',
        'Django>=1.11,<2.1',
        'wagtail>=1.0,<2.1',
        'django-el-pagination>=3.2.1',
        'django-social-share>=1.1.2',
        'django-colorful>=1.2'
    ],
    author='Code for Africa',
    author_email='hello@takwimu.africa',
    classifiers=[
        'Environment :: Web Environment',
        'Framework :: Django',
        'Framework :: Django :: 1.11',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: BSD License',
        'Operating System :: OS Independent',
        'Programming Language :: Python',
        'Programming Language :: Python :: 3.6',
        'Topic :: Internet :: WWW/HTTP',
        'Topic :: Internet :: WWW/HTTP :: Dynamic Content',
    ],
)
