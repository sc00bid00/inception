FROM debian:buster

RUN alias ll="ls -la" &&\
	apt update -y &&\
	apt upgrade -y &&\
	apt install nano -y &&\
	apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
