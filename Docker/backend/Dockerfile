# pull official base image
FROM python:3.9.9-alpine

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY . /usr/src/app/

# Dependencies for mysql
RUN apk add gcc musl-dev mariadb-connector-c-dev

# Dependencies for Pillow
RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add jpeg-dev zlib-dev libjpeg \
    && pip install Pillow \
    && apk del build-deps

# install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD ["chmod", "u+x", "/usr/src/app/Docker/backend/entrypoint.sh"]
CMD [ "python", "manage.py", "collectstatic" ]
ENTRYPOINT ["/usr/src/app/Docker/backend/entrypoint.sh"]

# expose port
EXPOSE 8000