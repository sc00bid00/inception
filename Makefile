all up:
	docker-compose up --build -d
stop:
	docker-compose stop nginx
	docker-compose stop wordpress
start:
	docker-compose start nginx
	docker-compose start wordpress
clean down:
	@if [ $$(docker container ls -q 2>/dev/null | wc -l) -ne 0 ]; then \
		docker-compose down; \
	fi
fclean:
	@if [ $$(docker image ls -q 2>/dev/null | wc -l) -ne 0 ]; then \
		docker image prune -af; \
	fi

