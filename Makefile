COMPOSE = docker-compose

build:
	$(COMPOSE) build

web:
	$(COMPOSE) up web

enter:
	$(COMPOSE) exec web bash

compilescss:
	$(COMPOSE) exec web python manage.py compilescss
	$(COMPOSE) exec web python manage.py collectstatic --clear --noinput

update_index:
	$(COMPOSE) exec web python manage.py update_topics_index

makemigrations:
	$(COMPOSE) exec web python manage.py makemigrations


test:
	$(COMPOSE) exec web psql -c 'drop database if exists test_takwimu;'
	$(COMPOSE) exec web psql -c 'create database test_takwimu owner takwimu;'
	$(COMPOSE) exec web python manage.py test --keepdb --no-input


release:
	./contrib/docker/release.sh

release-build:
	./contrib/docker/release-build.sh
