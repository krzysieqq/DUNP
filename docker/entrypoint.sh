#!/bin/bash
set -e

echo "${0}: wait for postgres."
bash ../docker/wait-for-it.sh "$DB_HOST":"$DB_PORT"

echo "${0}: running migrations."
python manage.py migrate --noinput

# echo "${0}: collecting statics."
# python manage.py collectstatic --noinput

echo "${0}: starting project."
uwsgi --ini /code/configs/uwsgi.ini
"$@"
