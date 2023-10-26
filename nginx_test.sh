#!/bin/bash
docker build -t test_nginx srcs/requirements/nginx
docker run --name test -it test_nginx
