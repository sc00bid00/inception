#!/bin/bash
if docker ps -a | grep -q 'nginx'; then
  docker rm -f nginx
fi
if ! docker network ls | grep -q 'inception'; then
  docker network create inception
fi
docker run --name nginx --env-file $(pwd)/srcs/.env --network inception -dp 443:443 test_nginx


