#!/bin/bash

cat takwimu/sql/*.sql | psql            # Load tables / data into DB (TBD)
python manage.py loaddata takwimu/fixtures/wazimap.json # Load fixtures
