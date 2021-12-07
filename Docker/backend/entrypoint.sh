python manage.py migrate
gunicorn django-blog.wsgi:application --bind 0.0.0.0:8000