SRC=./srcs/docker-compose.yml

all up:
	docker-compose -f $(SRC) up --build -d
stop:
	docker-compose stop nginx
	docker-compose stop wordpress
start:
	docker-compose start nginx
	docker-compose start wordpress
clean down:
	@if [ $$(docker container ls -q 2>/dev/null | wc -l) -ne 0 ]; then \
		docker-compose -f $(SRC) down; \
	fi
fclean:
	@if [ $$(docker container ls -q 2>/dev/null | wc -l) -ne 0 ]; then \
		docker container rm -f $$(docker container ls -q); \
	fi
	@if [ $$(docker image ls -q 2>/dev/null | wc -l) -ne 0 ]; then \
		docker image prune -af; \
	fi
