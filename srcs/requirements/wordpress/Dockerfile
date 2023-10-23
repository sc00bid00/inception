FROM debian:buster

COPY ./conf/.bashrc /root/.bashrc

RUN	apt update &&\
	apt upgrade &&\
	apt-get install -y nano &&\
	apt-get install -y wget &&\
	apt-get install -y php7.3 &&\
	apt-get install -y dnsutils &&\
	apt-get install -y php-fpm &&\
	apt-get install -y php-mysql &&\
	apt-get install -y mariadb-client

RUN	wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN	cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress

COPY ./conf/php.ini /etc/php/7.3/fpm/php.ini

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
	chmod +x wp-cli.phar &&\
	mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/autoconfig.sh /var/www/wordpress/autoconfig.sh
RUN chmod +x /var/www/wordpress/autoconfig.sh
RUN mkdir -p /run/php
CMD [ "/var/www/wordpress/autoconfig.sh" ]
