FROM debian:buster

RUN apt update -y &&\
	apt upgrade -y &&\
	apt install nginx -y &&\
	apt install nano -y &&\
	apt install curl -y &&\
	mkdir -p /etc/nginx/ssl &&\
	apt install openssl -y &&\
	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=DE/ST=BW/L=Heilbronn/O=42/OU=42/CN=lsordo.42.fr/UID=lsordo" &&\
	mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/hosts /etc/hosts
COPY conf/.bashrc /root/.bashrc

RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

CMD [ "nginx","-g","daemon off;" ]
