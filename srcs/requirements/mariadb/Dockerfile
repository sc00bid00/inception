FROM debian:11

RUN apt-get -y update && apt-get -y upgrade

# minimum requirement
RUN apt-get -y install mariadb-server
COPY /conf/mariadb.cnf /etc/mysql/mariadb.cnf
COPY /tools/launch.sh /launch.sh
RUN chmod +x /launch.sh

CMD [ "./launch.sh" ]

# nice to have for debug
# RUN apt-get -y install nano dnsutils
# COPY /conf/.bashrc /root/.bashrc
