FROM debian:11

RUN	apt-get update && apt-get upgrade

# minimum required
RUN	apt-get install -y wget unzip php7.4 php-fpm php-mysql mariadb-client
# debug site health
RUN apt-get install -y php-gd curl php-dom php-imagick php-mbstring php-zip php-intl
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# install wordpress
RUN	wget https://wordpress.org/latest.zip -P /var/www
RUN cd /var/www && unzip latest.zip && rm latest.zip

# install wordpress cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
	chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
COPY ./tools/autoconfig.sh /var/www/wordpress/autoconfig.sh
RUN chmod +x /var/www/wordpress/autoconfig.sh
RUN mkdir -p /run/php

CMD [ "/var/www/wordpress/autoconfig.sh" ]

# for debug purpose also useful to have nano, dnsutils, net-tools and the coloured bash prompts with recurrent aliases installed
# omitted here for essentiality
