sudo systemctl daemon-reload
sudo systemctl restart  docker

# docker start, stop etc
systemctl start docker
systemctl enable docker
systemctl restart docker


# https://stackoverflow.com/questions/47854463/docker-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socke
# create socket permission
sudo usermod -a -G docker shoumitro
grep docker /etc/group
newgrp docker


# docker app build & run
sudo docker build -t docker_ex .
docker build -t my_app --network=host .
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


#docker package
https://hub.docker.com/search?q=&type=image


# show all container
docker ps -a

# remove contailer
docker rm containerID

# remove image
docker rmi -f 311c49c7c106


#Stop all running containers
docker stop $(docker ps -aq)

#Remove all containers
docker rm $(docker ps -aq)

#Remove all images
docker rmi $(docker images -q)


# container
docker rm $(docker ps -aq) #Remove all containers
docker stop $(docker ps -aq) #Stop all running containers
docker top 9f215ed0b0d3 #With this command, you can see the top processes within a container.
docker stop 9f215ed0b0d3 #This command is used to stop a running container.
docker rm 9f215ed0b0d3 #This command is used to delete a container.
docker start 3233e7747d41 #This command is used to start a container.
docker stats 3233e7747d41 #This command is used to provide the statistics of a running container.
docker attach 07b0b6f434fe #This command is used to attach to a running container.
docker pause 07b0b6f434fe # This command is used to pause the processes in a running container.
docker unpause 07b0b6f434fe # This command is used to unpause the processes in a running container.
docker kill 07b0b6f434fe # This command is used to kill the processes in a running container.


# image
docker build -t myapp ./work/dir/ # build image
docker run myapp # run image
docker images -q  # show all image id
docker inspect myapp #This command is used see the details of an image or container.
docker history cc133c69684



# https://phoenixnap.com/kb/docker-image-vs-container
#Difference between Docker Image and Docker Container :

"""Container is a real world entity. Image is created only once. Containers are created any number of times using image. Images are immutable. Containers are instances of Docker images that can be run using the Docker run command.

A Docker image is an immutable (unchangeable) file that contains the source code, libraries, dependencies, tools, and other files needed for an application to run.

"""


# https://docs.docker.com/compose/install/
# docker docker-compose install
 sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
 sudo chmod +x /usr/local/bin/docker-compose
 sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
 docker-compose --version
 
 # Upgrading
 docker-compose migrate-to-labels

 #Uninstallation
 sudo rm /usr/local/bin/docker-compose
 pip uninstall docker-compose # To uninstall Docker Compose if you installed using pip
 
 """
 Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application's services. Then, with a single command, you create and start all the services from your configuration.
 
 What is the difference between docker and docker-compose?
The difference between Docker and Docker-compose is simple: docker commands are focused on only one container (or image) at once while docker-compose manage several containers docker.
 """
 
 

