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

migrate:
	$(COMPOSE) exec web python manage.py migrate

createdb:
	$(COMPOSE) exec db createdb takwimu

dropdb:
	$(COMPOSE) exec db dropdb takwimu

makemigrations:
	$(COMPOSE) exec web python manage.py makemigrations

loaddata:
	$(COMPOSE) exec -T web ./contrib/loaddata.sh  # Load the DB with data


test:
	$(COMPOSE) exec web psql -c 'drop database if exists test_takwimu;'
	$(COMPOSE) exec web psql -c 'create database test_takwimu owner takwimu;'
	$(COMPOSE) exec web python manage.py test --keepdb --no-input


release:
	./contrib/docker/release.sh

release-build:
	./contrib/docker/release-build.sh

deploy:
	./contrib/deploy.sh
