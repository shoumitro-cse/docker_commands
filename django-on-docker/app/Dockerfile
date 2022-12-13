# pull official base image
FROM python:3.6

# set work directory
WORKDIR my_app/

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# copy project
COPY . .

RUN adduser my_user
USER my_user


# CMD ["python", "manage.py", "runserver", "127.0.0.1:8000"]
# ENTRYPOINT ["python", "manage.py", "runserver", "0.0.0.0:7000"]
