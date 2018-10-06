build:
	docker-compose build .

web:
	rm -fr static/*  # Workaround for whitenoise busyness in dev
	docker-compose up web

compilescss:
	docker-compose exec web ./manage.py compilescss
	rm -fr static/*
	docker-compose exec web ./manage.py collectstatic --noinput

update_index:
	docker-compose exec web ./manage.py update_index

# TODO - Do in Docker
test:
	psql -c 'drop database if exists test_takwimu;' -U postgres
	psql -c 'create database test_takwimu owner takwimu;' -U postgres
	./manage.py test --keepdb --no-input
