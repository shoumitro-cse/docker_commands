# https://stackoverflow.com/questions/25101596/docker-interactive-mode-and-executing-script

sudo cp image_run.sh  /usr/local/bin/
sudo chmod +x /usr/local/bin/image_run.sh  

# creates if not exists a unique container for this folder and image. Access it using ssh.
image_run.sh python

# destroy if the container already exists and replace it
image_run.sh python --replace

# destroy the container after closing the interactive mode
image_run.sh python --remove





# docker app build & run
sudo docker build -t docker_ex .
sudo docker run  docker_ex 

# simple image run using bash, here, python is image
# docker run -i -t image /bin/bash
docker run -i -t python /bin/bash


# Just create interactive container. No start but named for future reference. Use your own image.
docker create -it --name new-container <image>
docker start new-container # Now start it.
docker exec -it new-container bash # Now attach bash session.

# example
docker create -it --name my_py  python
docker start my_py
docker exec -it my_py bash

# example of ubuntu set up
# docker create -it --name="my_ubuntu" -p 8000:800 "ubuntu" # using port
docker create -it --name my_ubuntu ubuntu
docker start my_ubuntu
docker exec -it my_ubuntu bash

apt-get install iputils-ping
apt-get install python3-pip
apt-get install python-pip

python3 -m django startproject mysite

# app install, Here, e99c67b72497 is container id
docker exec -it e99c67b72497 python
docker exec -it e99c67b72497 ls /etc/
docker exec -it e99c67b72497 ls /bin/
docker exec -it e99c67b72497 ls /
docker exec -it e99c67b72497 ls /home/shoumitro/Documents/html_ex/docker_ex/django-on-docker/app/


