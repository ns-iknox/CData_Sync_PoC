#!/bin/bash

IMG_NAME='poc_cdata_sync_img'

if [ -n "$(which git-lfs)" ] && [ -n "$(grep 'filter \"lfs\"' ~/.gitconfig)" ]; then
  docker build -t ${IMG_NAME} .
else
  echo "ERROR! git-LFS doesn't seem to be installed and/or initalized! Exiting!"
fi