build:
	docker build -t codeforafrica/takwimu:latest .

image-latest:
	docker build -t codeforafrica/takwimu:latest .
	docker push codeforafrica/takwimu:latest

image-release:
	docker build -t codeforafrica/takwimu:0.0.6
	docker push codeforafrica/takwimu:0.0.6
