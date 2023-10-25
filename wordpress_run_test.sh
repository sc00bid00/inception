#!/bin/bash
if docker ps -a | grep -q 'wordpress'; then
  docker rm -f wordpress
fi
if ! docker network ls | grep -q 'inception'; then
  docker network create inception
fi
docker run --name wordpress --env-file $(pwd)/srcs/.env --network inception -dp 9000:9000 test_wordpress
