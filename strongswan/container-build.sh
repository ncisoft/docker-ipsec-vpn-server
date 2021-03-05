#!/bin/sh

# https://github.com/hwdsl2/docker-ipsec-vpn-server
# https://github.com/hwdsl2/setup-ipsec-vpn/blob/master/docs/clients-zh.md

sudo docker run               \
  --name nci-ipsec-vpn-server \
  --env-file ../l2tp.env       \
  --restart=always            \
  -p 500:500/udp              \
  -p 4500:4500/udp            \
  -d --privileged             \
   nci/strongswan

