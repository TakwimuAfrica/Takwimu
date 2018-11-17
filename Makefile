COMPOSE = docker-compose
DEVDOCKER = $(COMPOSE) exec web

build:
	$(COMPOSE) build web

web:
	rm -fr static/*  # Workaround for whitenoise busyness in dev
	$(COMPOSE) up web

compilescss:
	$(DEVDOCKER) web ./manage.py compilescss
	rm -fr static/*
	$(DEVDOCKER) web ./manage.py collectstatic --noinput

update_index:
	$(DEVDOCKER) web ./manage.py update_index

# TODO - Do in Docker
test:
	psql -c 'drop database if exists test_takwimu;' -U postgres
	psql -c 'create database test_takwimu owner takwimu;' -U postgres
	./manage.py test --keepdb --no-input
