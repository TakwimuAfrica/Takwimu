build:
	docker build -t codeforafrica/takwimu:latest .

image-latest:
	docker build -t codeforafrica/takwimu:latest .
	docker push codeforafrica/takwimu:latest

image-release:
	docker build -t codeforafrica/takwimu:0.0.6
	docker push codeforafrica/takwimu:0.0.6

test:
	psql -c 'drop database if exists test_takwimu;' -U postgres
	psql -c 'create database test_takwimu owner takwimu;' -U postgres
	./manage.py test --keepdb --no-input
