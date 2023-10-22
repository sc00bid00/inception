FROM debian:buster

RUN apt update -y &&\
	apt upgrade -y &&\
	apt install nano -y &&\
	apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/launch.sh /launch.sh
COPY conf/.bashrc /root/.bashrc


RUN chmod +x /launch.sh

ENTRYPOINT [ "/launch.sh" ]
