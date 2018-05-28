FROM python:2.7
ENV PYTHONUNBUFFERED 1
ENV DATABASE_URL postgresql://takwimu:takwimu@db:5432/takwimu

RUN mkdir /app
WORKDIR /app

# Installing OS Dependencies
RUN apt-get update && apt-get upgrade -y

RUN pip install -U pip setuptools

COPY requirements.txt /app/

RUN pip install -r /app/requirements.txt

ADD . /app/

# Django service
EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]