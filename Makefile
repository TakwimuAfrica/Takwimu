build:
	docker build -t codeforafrica/takwimu:latest .

image-latest:
	docker build -t codeforafrica/takwimu:latest .
	docker push codeforafrica/takwimu:latest

# TODO: Pull from a VERSION file and connect to git flow release
image-release:
	docker build -t codeforafrica/takwimu:0.2.1
	docker push codeforafrica/takwimu:0.2.1

test:
	psql -c 'drop database if exists test_takwimu;' -U postgres
	psql -c 'create database test_takwimu owner takwimu;' -U postgres
	./manage.py test --keepdb --no-input

web:
	rm -fr static/*  # Workaround for whitenoise busyness in dev
	docker-compose up web
