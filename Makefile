SRC=./srcs/docker-compose.yml

all up:
	docker-compose -f $(SRC) --project-name inception up --build -d
stop:
	docker-compose stop nginx
	docker-compose stop wordpress
start:
	docker-compose start nginx
	docker-compose start wordpress
clean down:
	@if [ $$(docker container ls -q 2>/dev/null | wc -l) -ne 0 ]; then \
		docker-compose -f $(SRC) down -v; \
	fi
fclean:
	@if [ $$(docker container ls -q 2>/dev/null | wc -l) -ne 0 ]; then \
		docker container rm -f $$(docker container ls -q); \
	fi
	@if [ $$(docker image ls -q 2>/dev/null | wc -l) -ne 0 ]; then \
		docker image prune -af; \
	fi
	@if [ $$(docker volume ls -q 2>/dev/null | wc -l) -ne 0 ]; then \
		docker volume rm -f $$(docker volume ls -q); \
	fi
	@if [ $$(docker network ls -q 2>/dev/null | wc -l) -ge 4 ]; then \
		docker network rm -f inception_inception; \
	fi

re: fclean all

