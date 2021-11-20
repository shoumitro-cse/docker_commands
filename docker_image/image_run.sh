#!/bin/bash

echo "IMAGE = $1"

## image name is the first param
IMAGE="$1"

## container name is created combining the image and the folder address hash
CONTAINER="${IMAGE}-$(pwd | md5sum | cut -d ' ' -f 1)"
echo "${IMAGE} ${CONTAINER}"

# remove the image from this dir, if exists
## rm                                      remove container command
## pwd | md5                               get the unique code for the current folder
## "${IMAGE}-$(pwd | md5sum)"                   create a unique name for the container based in the folder and image
## --force                                 force the container be stopped and removed
if [[ "$2" == "--reset" || "$3" == "--reset" ]]; then
        echo "## removing previous container ${CONTAINER}"
        docker rm "${CONTAINER}" --force
fi

# create one special container for this folder based in the python image and let this folder mapped
## -it                                     interactive mode
## pwd | md5                               get the unique code for the current folder
## --name="${CONTAINER}"                   create one container with unique name based in the current folder and image
## -v "$(pwd)":/data                       create ad shared volume mapping the current folder to the /data inside your container
## -w /data                                define the /data as the working dir of your container
## -p 80:80                                some port mapping between the container and host ( not required )
## pyt#hon                                  name of the image used as the starting point
echo "## creating container ${CONTAINER} as ${IMAGE} image"
docker create -it --name="${CONTAINER}" -v "$(pwd)":/data -w /data -p 80:80 "${IMAGE}"

# start the container
docker start "${CONTAINER}"

# enter in the container, interactive mode, with the shared folder and running python
docker exec -it "${CONTAINER}" bash

# remove the container after exit
if [[ "$2" == "--remove" || "$3" == "--remove" ]]; then
        echo "## removing container ${CONTAINER}"
        docker rm "${CONTAINER}" --force
fi

