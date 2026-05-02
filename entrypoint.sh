#!/bin/sh
set -e

mkdir -p /app/data

python manage.py migrate --no-input

exec gunicorn blogproject.wsgi:application \
    --bind 0.0.0.0:8000 \
    --workers 2
