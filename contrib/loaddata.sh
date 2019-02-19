#!/bin/bash

cat takwimu/sql/*.sql | psql            # Load tables / data into DB (TBD)
python manage.py loaddata takwimu/fixtures/takwimu_wazimap_fixtures.json # Load fixtures
