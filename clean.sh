#!/bin/bash

CONTAINER_NAME='poc_cdata_sync_cont'
IMG_NAME='poc_cdata_sync_img'

docker ps -a | grep ${CONTAINER_NAME} | awk '{print $1}' | xargs docker rm -v && \
docker images -a | grep ${IMG_NAME} | awk '{print $3}' | xargs docker rmi
