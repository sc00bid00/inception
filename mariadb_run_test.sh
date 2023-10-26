#!/bin/bash
if docker ps -a | grep -q 'mariadb'; then
  docker rm -f mariadb
fi
if ! docker network ls | grep -q 'inception'; then
  docker network create srcs_inception
fi
docker run --name mariadb --env-file $(pwd)/srcs/.env --network srcs_inception -v /home/luca/inception/data/mariadb:/var/lib/mysql -dp 3306:3306 test_mariadb
