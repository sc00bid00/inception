#!/bin/bash
if docker ps -a | grep -q 'mariadb'; then
  docker rm -f mariadb
fi
if ! docker network ls | grep -q 'inception'; then
  docker network create inception
fi
docker run --name mariadb --env-file $(pwd)/srcs/.env --network inception -dp 3306:3306 test_mariadb
