#!/bin/bash

while ! nc -z $DB_HOSTNAME $DB_PORT; do
    echo "Waiting for the MySQL Server"
    sleep 0.1
done

echo "MySQL Started"


echo "running migrations."
python manage.py migrate --noinput

echo "collecting statics."

python manage.py collectstatic --noinput
gunicorn -w 3 -b :8000 django_project.wsgi.application

exec "$@"