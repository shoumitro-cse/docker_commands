# https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/

mkdir django-on-docker && cd django-on-docker
mkdir app && cd app
python3.9 -m venv env
source env/bin/activate
pip install django==3.2.6
django-admin.py startproject hello_django .
python manage.py migrate
python manage.py runserver


docker build --network=host .
docker build -t docker_ex .

# create images
cd app
docker build -t my_django_app --network=host .
cd ..
docker-compose build
docker-compose up -d
docker-compose logs -f

docker images
docker run django-on-docker_web
# go to
http://0.0.0.0:7000/


# app install
docker exec -it e99c67b72497 python
docker exec -it e99c67b72497 ls /etc/
docker exec -it e99c67b72497 ls /bin/
docker exec -it e99c67b72497 ls /
docker exec -it e99c67b72497 ls /home/shoumitro/Documents/html_ex/docker_ex/django-on-docker/app/

