#!/bin/sh

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

container_name=nci-openvpn

exiterr()  { echo "Error: $1" >&2; exit 1; }


image_ids=$(sudo docker image ls|grep "<none>"|awk '{printf("%s\n", $3)}')

for id in $image_ids
do
  sudo docker rmi $id
done
sudo docker image ls
