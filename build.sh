#!/bin/bash

IMG_NAME='poc_cdata_sync_img'
WAR_CHECKSUM='2a8f906235fac6329dc8e9b143e291365357d9b9'

LOCAL_WAR_CHECKSUM=$(shasum DataSync2019/www/ROOT.war | cut -f1 -d' ')


if [ "$LOCAL_WAR_CHECKSUM" != "$WAR_CHECKSUM" ]; then
  #debug
  # echo "|${LOCAL_WAR_CHECKSUM}| != |${WAR_CHECKSUM}|"
  echo "Slow your roll, it looks like your ROOT.war file is the wrong size!"
  echo "Did you install and initalize git-lfs _before_ you cloned this repo?"
  echo "[Build cancelled]"
else
  docker build -t ${IMG_NAME} .
fi