#!/bin/bash

CONTAINER_NAME='poc_cdata_sync_cont'
IMG_NAME='poc_cdata_sync_img'

CONTAINER_EXISTS=$( docker ps -a | grep ${IMG_NAME} )

if [[ -n ${CONTAINER_EXISTS} ]]
then
  docker start -ai ${CONTAINER_NAME}
else
  docker run -it -p 8080:8080 --name ${CONTAINER_NAME} ${IMG_NAME}
fi
