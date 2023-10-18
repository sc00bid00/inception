# Use the Alpine Linux base image
FROM alpine:latest

# Install necessary packages
RUN apk add php81-fpm php81-mysqli php81-common php81-curl php81-opcache php81-session &&\
	apk add php81-mbstring php81-tokenizer php81-xml php81-xmlreader php81-xmlwriter php81-zip &&\
	apk add php81-gd php81-pdo php81-pdo_mysql

# Create a directory for WordPress
RUN mkdir -p /var/www/html

# # Download and install WordPress
RUN wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar xfz /tmp/wordpress.tar.gz -C /var/www/html && \
    rm -f /tmp/wordpress.tar.gz

# # Configure PHP-FPM
COPY ./conf.d/www.conf /etc/php7/php-fpm.d/www.conf

# # Expose the PHP-FPM port
EXPOSE 9000 3306

# # Start PHP-FPM
# CMD ["php-fpm81", "-F"]
