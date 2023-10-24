FROM debian:11

RUN	apt-get update &&\
	apt-get install -y wget php7.4-fpm php7.4-mysql mariadb-client

RUN	wget -q https://wordpress.org/latest.tar.gz -P /var/www
RUN	cd /var/www && tar -xzf latest.tar.gz && rm -rf latest.tar.gz

RUN wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d
COPY ./conf/autoconfig.sh /var/www/wordpress/autoconfig.sh
RUN	chmod +x /var/www/wordpress/autoconfig.sh

CMD [ "/var/www/wordpress/autoconfig.sh" ]
