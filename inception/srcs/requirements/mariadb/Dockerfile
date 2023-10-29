FROM debian:11

RUN apt-get -y update && apt-get -y upgrade

# minimum requirement
RUN apt-get -y install mariadb-server
COPY /conf/mariadb.cnf /etc/mysql/mariadb.cnf
COPY /tools/launch.sh /launch.sh
RUN chmod +x /launch.sh

# for debug purpose also useful to have nano, dnsutils, net-tools and the coloured bash prompts with recurrent aliases installed
# omitted here for essentiality
CMD [ "./launch.sh" ]
