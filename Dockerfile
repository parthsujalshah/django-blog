FROM python:3.8.10-alpine

WORKDIR /usr/src/app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

EXPOSE 8000

RUN apk add --no-cache mariadb-connector-c-dev
RUN apk update \
&& apk add python3 python3-dev mariadb-dev build-base \
&& pip3 install mysqlclient \
&& apk del python3-dev mariadb-dev build-base \
&& apk add --no-cache jpeg-dev zlib-dev \
&& apk add --no-cache --virtual .build-deps build-base linux-headers \
&& pip install Pillow

RUN apk add netcat-openbsd

RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY . .

ENV USE_S3 FALSE
ENV IN_CLOUD TRUE


# CMD ["chmod", "u+x", "/usr/src/app/entrypoint.sh"]
CMD ["chmod", "+x", "/usr/src/app/entrypoint.sh"]
ENTRYPOINT ["sh", "/usr/src/app/entrypoint.sh"]