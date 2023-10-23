FROM debian:11

RUN apt update -y &&\
	apt upgrade -y &&\
	apt install nano -y &&\
	apt-get -y install mariadb-server

COPY /conf/.bashrc /root/.bashrc
COPY /conf/mariadb.cnf /etc/mysql/mariadb.cnf
COPY /conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY /conf/launch.sh /launch.sh

RUN chmod +x /launch.sh

CMD [ "/launch.sh" ]
