#!/bin/sh

conf=/media/home/conf
mkdir -p files &&                        \
  cp ../files/trusted-keys-buster files/ && \
  cp ../files/ustc-buster.list files/ && \
  sudo docker build -t nci/buster-slim-base .


