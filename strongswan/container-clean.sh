#!/bin/sh

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

sontainer_name=nci-openvpn

exiterr()  { echo "Error: $1" >&2; exit 1; }


#container_id=$(sudo docker ps -a|grep $container_name |awk '{printf("%s\n", $1)}')


container_ids=$(sudo docker ps -a |grep -v CONTAINER |awk '{printf("%s\n", $1)}')
for id in $container_ids
do
  sudo docker container stop $id  2>&1 > /dev/null && \
  echo "stop container  $id" && \
  sudo docker container rm $id  2>&1 >/dev/null && \
  echo "  rm container  $id"
done

sudo docker ps -a
