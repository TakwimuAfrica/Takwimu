#!/bin/bash

createdb takwimu

python manage.py migrate --noinput        # Apply database migrations
cat takwimu/sql/*.sql | psql              # Upload tables / data
python manage.py compilescss              # Compile SCSS (offline)
python manage.py collectstatic --noinput  # Collect static files
python manage.py update_topics_index      # Update topics index
python manage.py createcachetable         # Create CACHE table

# Prepare log files and start outputting logs to stdout
touch /srv/logs/gunicorn.log
touch /srv/logs/access.log
tail -n 0 -f /srv/logs/*.log &

# Start Gunicorn processes
echo Starting Gunicorn.
exec gunicorn takwimu.wsgi:application \
    --name takwimu \
    --bind 0.0.0.0:8000 \
    --workers 3 \
    --worker-class gevent \
    --log-level=info \
    --log-file=/srv/logs/gunicorn.log \
    --access-logfile=/srv/logs/access.log \
    --reload \
    "$@"
