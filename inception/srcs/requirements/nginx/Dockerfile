FROM debian:11

RUN apt-get update -y && apt-get upgrade -y

# minimum required
RUN	apt-get install -y nginx
RUN	mkdir -p /etc/nginx/ssl && apt-get install -y openssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=DE/ST=BW/L=Heilbronn/O=42 Heilbronn/OU=Students/CN=lsordo.42.fr/UID=lsordo" &&\
	mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/sites-enabled/default

RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

CMD [ "nginx","-g","daemon off;" ]

# for debug purpose also useful to have nano, dnsutils, net-tools and the coloured bash prompts with recurrent aliases installed
# omitted here for essentiality

