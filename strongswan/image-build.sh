#!/bin/sh

conf=/media/home/conf
set -ex
mkdir -p files &&                                                  \
  cp /media/home/conf/shadowsocks/redsocks2/init-l2tp-redsocks2.sh files && \
  cp /media/home/conf/shadowsocks/redsocks2/init-ipset.sh files && \
  sudo docker build -t nci/strongswan .


