#!/bin/bash
docker build -t test_wordpress srcs/requirements/wordpress
docker build -t test_mariadb srcs/requirements/mariadb
