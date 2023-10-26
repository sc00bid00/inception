#!/bin/bash
docker build -t test_mariadb srcs/requirements/mariadb
docker build -t test_wordpress srcs/requirements/wordpress
docker build -t test_nginx srcs/requirements/nginx
