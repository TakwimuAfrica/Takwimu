#!/usr/bin/env bash

cd takwimu/
python manage.py migrate

cat takwimu/sql/*.sql | psql -U takwimu -W takwimu

python manage.py collectstatic --noinput
python manage.py runserver 0.0.0.0:8000