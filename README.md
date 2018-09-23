# TAKWIMU
[![Build Status](https://travis-ci.org/TakwimuAfrica/TAKWIMU.svg?branch=develop)](https://travis-ci.org/TakwimuAfrica/TAKWIMU)
[![Known Vulnerabilities](https://snyk.io/test/github/TakwimuAfrica/TAKWIMU/badge.svg?targetFile=requirements.txt)](https://snyk.io/test/github/TakwimuAfrica/TAKWIMU?targetFile=requirements.txt)


The TAKWIMU web platform powering insight from human development indicators. Helping to find the stories behind the data. Accessible at https://takwimu.africa/

## Background

TODO

---

## Landing Page

The landing page for TAKWIMU currently lives in the `/docs` folder hosted on [Github Pages](https://pages.github.com/), powered by [Jekyll](https://jekyllrb.com).

Once we replace https://takwimu.africa/ to point to Django App, this directory's contents will be replaced with actual platform documentation:

1. Platform management docs
2. Sphinx documentation
3. Style Dictionary


---

# Development

## Setup

There are a couple of ways one can setup their development environment but we currently support [Docker](https://www.docker.com/). It allows us to move away from the "but it works on my machine" issue when making changes or deploying.

You can download Docker Community Edition from here - https://www.docker.com/community-edition

With [Docker Compose](https://docs.docker.com/compose/), development set up is relatively quick:

```sh
git clone https://github.com/TakwimuAfrica/TAKWIMU.git
cd TAKWIMU
docker-compose build
make web
```

### Elasticsearch
Elasticsearch is automatically setup docker for development. To rebuild the search index from scratch,
we run the following command in `docker-entrypoint.sh`:
```sh
python manage.py update_index
```
The search index is automatically updated using Wagtail's provided search signal handlers; but in case
the index has to be rebuilt manually, run the following command:
```sh
docker-compose exec web python manage.py update_index
```

## Handling Data

### HURUmap Data

To import HURUmap data, we run the following command in `docker-entrypoint.sh`:
```sh
cat takwimu/sql/*.sql | psql -U takwimu -W takwimu
```

To export the HURUmap data you might be working on, run the following command:
```sh
docker-compose exec web python manage.py dumppsql --table TABLENAME > sql/TABLENAME.sql
```

To dump all data tables at once, run

```sh
for t in `ls takwimu/sql/[a-z]*.sql`
do
    echo $t
    pg_dump "postgres://takwimu:takwimu@localhost/takwimu" \
        -O -c --if-exists -t $(basename $t .sql) \
      | egrep -v "(idle_in_transaction_session_timeout|row_security)" \
      > takwimu/sql/$(basename $t .sql).sql
done
```

### Django / CMS Data Import

Once done, you'd want to load some data available to you:

**CAREFUL: Doing this will override whatever data you already have in the DB.**

```sh
# Docker
docker-compose exec web ./manage.py loaddata $(ls takwimu/fixtures)

```

#### Django / CMS Data Export

To export data, run the following commands:
```sh
# Docker
docker-compose exec web ./manage.py dumpdata takwimu.SupportService -o takwimu/fixtures/supportservice.json
docker-compose exec web ./manage.py dumpdata takwimu.FAQ -o takwimu/fixtures/faq.json
```

---

# Tests

TODO

---

# Deployment

TODO

---

## Contributing

If you'd like to contribute to TAKWIMU, check out [CONTRIBUTING.md](CONTRIBUTING.md) on how to get started.

---

## Attribution

TAKWIMU has been made possible thanks to:

- Consortium Members:
    - [africapractice](http://www.africapractice.com)
    - [Code for Africa](https://github.com/CodeForAfrica)
    - [iHub](https://ihub.co.ke)
- Contributors:
    - Sean Peaterson, [Zaang Designs](http://www.zaang.com)
- Technologies:
    - [HURUmap](https://github.com/CodeForAfrica/HURUmap)
    - [Wazimap](https://github.com/OpenUpSA/wazimap)
    - [Census Reporter](https://github.com/censusreporter/censusreporter)
    - [Django Framework](https://djangoproject.com/)
    - [Wagtail CMS](https://wagtail.io)
- Supported by:
    - [Bill and Melinda Gates Foundation](https://www.gatesfoundation.org)

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
