#!/bin/bash
docker build -t test_nginx ../srcs/requirements/nginx
docker run --name test --env-file ../srcs/.env -it test_nginx
