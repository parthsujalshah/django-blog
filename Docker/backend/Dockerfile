# pull official base image
FROM python:3.8.5-slim-buster

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . /usr/src/app/

CMD ["chmod", "u+x", "/usr/src/app/docker/backend/entrypoint.sh"]
CMD [ "python", "manage.py", "collectstatic" ]
ENTRYPOINT ["/usr/src/app/docker/server/entrypoint.sh"]

# expose port
EXPOSE 8000