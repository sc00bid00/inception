SRC=./srcs/docker-compose.yml
MDB_DIR = ~/data/mariadb
WPR_DIR = ~/data/wordpress

all up:
	@if [ ! -d "$(MDB_DIR)" ]; then mkdir -p $(MDB_DIR); fi
	@if [ ! -d "$(WPR_DIR)" ]; then mkdir -p $(WPR_DIR); fi
	docker-compose -f $(SRC) up --build
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
		docker network rm srcs_inception; \
	fi

vclean:
	@if [ $$(docker volume ls -q 2>/dev/null | wc -l) -ne 0 ]; then \
		docker rm -f $$(docker container ls -aq);\
		docker volume rm -f $$(docker volume ls -q); \
	fi
sclean:
	rm -rf $(MDB_DIR)
	rm -rf $(WPR_DIR)

dozer:
	docker system prune -af

re: fclean all

