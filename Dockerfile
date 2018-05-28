FROM python:2.7
ENV PYTHONUNBUFFERED 1

RUN mkdir /takwimu_app
WORKDIR /takwimu_app

# Installing OS Dependencies
RUN apt-get update && apt-get upgrade -y

RUN pip install -U pip setuptools

COPY requirements.txt /takwimu_app/

RUN pip install -r /takwimu/requirements.txt
RUN pip install -r /takwimu/requirements-opt.txt

ADD . /takwimu_app/

# Django service
EXPOSE 8000