# pull official base image
FROM python:3.9.6-alpine

# set work directory
WORKDIR /home/shoumitro/Documents/html_ex/docker_ex/django-on-docker/app/

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# copy project
COPY . .


RUN adduser -D my_user
USER my_user

# CMD ["python", "manage.py", "runserver", "127.0.0.1:8000"]
