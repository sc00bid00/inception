FROM debian:buster

RUN alias ll="ls -la" &&\
	apt update -y &&\
	apt upgrade -y &&\
	apt install nano -y &&\
	apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/launch.sh /launch.sh

RUN chmod +x /launch.sh

CMD [ "/launch.sh" ]
