build:
	docker build -t takwimu/app:latest .

image-latest:
	docker build -t takwimu/app:latest .
	docker push openafrica/app:latest

image-release:
	docker build -t takwimu/app:1.0.0.
	docker push takwimu/app:1.0.0