SRC=./srcs/docker-compose.yml

all up:
	docker-compose -f $(SRC) up --build -d
stop:
	docker-compose -f $(SRC) stop nginx
	docker-compose -f $(SRC) stop wordpress
	docker-compose -f $(SRC) stop mariadb
start:
	docker-compose -f $(SRC) start nginx
	docker-compose -f $(SRC) start wordpress
	docker-compose -f $(SRC) start mariadb
clean down:
	@if [ $$(docker container ls -q 2>/dev/null | wc -l) -ne 0 ]; then \
		docker-compose -f $(SRC) down -v; \
	fi
fclean:
	@if [ $$(docker container ls -aq 2>/dev/null | wc -l) -ne 0 ]; then \
		docker container rm -f $$(docker container ls -aq); \
	fi
	@if [ $$(docker image ls -q 2>/dev/null | wc -l) -ne 0 ]; then \
		docker image prune -af; \
	fi
	@if [ $$(docker volume ls -q 2>/dev/null | wc -l) -ne 0 ]; then \
		docker volume rm -f $$(docker volume ls -q); \
	fi
	@if [ $$(docker network ls -q 2>/dev/null | wc -l) -ge 4 ]; then \
		docker network rm -f srcs_inception; \
	fi

re: fclean all

