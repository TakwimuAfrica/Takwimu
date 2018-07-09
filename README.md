# TAKWIMU
[![Build Status](https://travis-ci.org/TakwimuAfrica/TAKWIMU.svg?branch=develop)](https://travis-ci.org/TakwimuAfrica/TAKWIMU)
[![Known Vulnerabilities](https://snyk.io/test/github/TakwimuAfrica/TAKWIMU/badge.svg?targetFile=requirements.txt)](https://snyk.io/test/github/TakwimuAfrica/TAKWIMU?targetFile=requirements.txt)


The TAKWIMU web platform powering insight from human development indicators. Helping to find the stories behind the data. Accessible at https://takwimu.africa/

## Background

TODO

---

## Development

### Setup

#### Docker

With Docker, development set up is relatively quick:

```sh
git clone https://github.com/TakwimuAfrica/TAKWIMU.git
cd TAKWIMU
docker-compose build
docker-compose up web
```

#### Mac OS

1. Clone the repo
2. ``cd TAKWIMU``
3. ``virtualenv --no-site-packages env``
4. ``source env/bin/activate``
5. ``pip install -r requirements.txt``

You will need a Postgres database:

```
psql
create user takwimu with password takwimu;
create database takwimu;
grant all privileges on database takwimu to takwimu;
```
Run migrations to keep Django happy:
```
python manage.py migrate
```

Import the data into the new database (will overwrite some tables created by Django, but that's ok).
```
cat takwimu/sql/*.sql | psql -U takwimu -W takwimu
```

Start the server:
```
python manage.py runserver
```

### Handling Data

#### Loading Data

Once done, you'd want to load some data available to you:

**CAREFUL: Doing this will override whatever data you already have in the DB.**

```sh
# Docker
docker-compose exec web ./manage.py loaddata supportservice
docker-compose exec web ./manage.py loaddata faq
docker-compose exec web ./manage.py loaddata explainersteps
```

#### Exporting Data

To export data, run the following commands:
```sh
# Docker
docker-compose exec web ./manage.py dumpdata takwimu.SupportService -o takwimu/fixtures/supportservice.json
docker-compose exec web ./manage.py dumpdata takwimu.FAQ -o takwimu/fixtures/faq.json

# Dokku
# TODO
```

### Landing Page

The landing page for TAKWIMU currently lives in the `/docs` folder hosted on Github Pages, powered by Jekyll. This will be fully replaced with actual platform documentation.

### Web Platform

TODO

## Tests

TODO

## Deployment

TODO

---


## Contributing

If you'd like to contribute to TAKWIMU, check out [CONTRIBUTING.md](CONTRIBUTING.md) on how to get started.

## Attribution

TAKWIMU has been made possible thanks to:

- Consortium Members:
    - [africapractice](http://www.africapractice.com)
    - [Code for Africa](https://github.com/CodeForAfrica)
    - [iHub](https://ihub.co.ke)
- Contributors:
    - Sean Peaterson, [Zaang Designs](http://www.zaang.com)
- Technologies:
    - [Django Framework](https://djangoproject.com/)
    - [Wagtail CMS](https://wagtail.io)

---

## License

MIT License

Copyright (c) 2018 africapractice, Code for Africa, iHub

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

All content is released under a [Creative Commons 4 Attribution license](https://creativecommons.org/licenses/by/4.0/). If you use this software, please provide attribution to TAKWIMU, africapractice, Code for Africa, and iHub.
