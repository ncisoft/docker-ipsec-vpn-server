#!/bin/bash

BRED='\033[1;31m'
NC='\033[0m'

container_id=nci-strongswan
function shell()
{
  sudo docker exec -it $container_id /bin/bash
}

function start()
{
  sudo docker container start $container_id
}

function stop()
{
  sudo docker container stop $container_id
}

function restart()
{
  sudo systemctl restart docker.service
  sudo docker container restart $container_id
}

function log()
{
  sudo docker container logs $container_id
}

cmd=$1
case $cmd in
  log)
    log
    ;;
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    restart
    ;;
  sh)
    shell
    ;;
  *)
    echo "./run.sh restart | stop | sh | log"
    exit 0
    ;;
esac

