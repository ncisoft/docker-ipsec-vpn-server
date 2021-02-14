#!/bin/sh

conf=/media/home/conf
mkdir -p files &&                                                   \
  cp ${conf}/apt/ustc-buster.list files/ &&                         \
  cp ${conf}/shadowsocks/redsocks2/strongSwan-deploy.sh files/ &&   \
  cp ${conf}/shadowsocks/redsocks2/init-l2tp-redsocks2.sh files/ && \
  cp ${conf}/shadowsocks/redsocks2/rules.v4 files/ &&               \
  sudo docker build -t nci/ipsec-vpn-server .


