# Takwimu
[![Build Status](https://travis-ci.org/TakwimuAfrica/Takwimu.svg?branch=master)](https://travis-ci.org/TakwimuAfrica/Takwimu)
[![Known Vulnerabilities](https://snyk.io/test/github/TakwimuAfrica/TAKWIMU/badge.svg?targetFile=requirements.txt)](https://snyk.io/test/github/TakwimuAfrica/TAKWIMU?targetFile=requirements.txt)


The Takwimu web platform powering insight from human development data indicators. Helping to find the stories behind the data. Accessible at https://takwimu.africa/

## Background

People need accurate, objective information to make good decisions. However, uneven access to quality information weakens the impact of policy and programming in Africa as well as the ability of local development actors, particularly those with limited resources, to drive necessary change. 

Takwimu was launched in 2018 to empower African changemakers with the best data available and support their efforts to put this into effective use. We take a holistic view of what kinds of data are needed to drive change. 

Read more at https://takwimu.africa/about

---

## Platform Goals

The web-based platform seeks to:

1. Provide an intuitive platform for our [primary audiences](https://takwim.africa/about#audiences) to access insights from data
2. Make it easy for data curators and analysts to publish and manage content on Takwimu
3. Allow easy interaction and feedback between the two users above (publisher and audience)

We don't:

1. Re-invent the wheel: a lot of smart people have already developed the packages needed, we re-use, re-purpose and attribute
2. Shred data: where we can, we deprecate data models and keep data created always available
3. Develop Content Management Systems (CMSs): there are a lot of content management systems available. We re-use for best fit focussed on what our primary audiences need

---

# Development

## Setup

There are a couple of ways one can setup their development environment and we currently support [Docker](https://www.docker.com/). It allows us to move away from the "but it works on my machine" issue when making changes or deploying.

You can download Docker Community Edition from here - https://www.docker.com/community-edition

With [Docker Compose](https://docs.docker.com/compose/), development set up is relatively quick:

```shell
git clone https://github.com/TakwimuAfrica/TAKWIMU.git
cd TAKWIMU
make build
make web
make loaddata
```

Optionally you can also enable Redis as cache backend in your development environment by doing the following:

```shell
export TAKWIMU_CACHE=True
make web
```

### Admin a/c

TODO

### Load initial data

TODO


### Elasticsearch

The search index is automatically updated using Wagtail's provided search signal handlers; but in case
the index has to be rebuilt manually, run the following command:
```shell
make update_index
```

## Handling Data

### HURUmap Data

To import HURUmap data, we run the following command in `docker-entrypoint.sh`:
```shell
cat takwimu/sql/*.sql | psql -U takwimu -W takwimu
```

To export the HURUmap data you might be working on, run the following command:
```shell
docker-compose exec web python manage.py dumppsql --table TABLENAME > sql/TABLENAME.sql
```

To dump all data tables at once, run

```shell
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

```shell
# Docker
docker-compose exec web ./manage.py loaddata $(ls takwimu/fixtures)
```

#### Django / CMS Data Export

To export data, run the following commands:
```shell
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

GNU General Public License v3.0

Takwimu provides quality insights and data-driven analysis to
empower African development champions.

Copyright (C) 2018  africapractice, Code for Africa, iHub

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.


All content is released under a [Creative Commons 4 Attribution license](https://creativecommons.org/licenses/by/4.0/).
If you use this software, please provide attribution to Takwimu,
africapractice, Code for Africa, and iHub.
