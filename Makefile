SRC=./srcs/docker-compose.yml
MDB_DIR = home/$(USER)/data/mariadb
WPR_DIR = home/$(USER)/data/wordpress

all up:
	@if [ ! -d "$(MDB_DIR)" ]; then mkdir -p $(MDB_DIR); fi
	@if [ ! -d "$(WPR_DIR)" ]; then mkdir -p $(WPR_DIR); fi
	docker-compose -f $(SRC) up --build
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

# cleans volumes, leaves local files
vclean:
	@if [ $$(docker volume ls -q 2>/dev/null | wc -l) -ne 0 ]; then \
		docker rm -f $$(docker container ls -aq);\
		docker volume rm -f $$(docker volume ls -q); \
	fi

# rm local files
sclean:
	sudo rm -rf ./data

# total erasure == nuclear attack
dozer: fclean sclean
	docker system prune -af

re: fclean all

