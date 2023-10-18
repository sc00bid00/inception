FROM debian:11

EXPOSE 80

RUN	apt update &&\
	apt install nginx -y &&\
	apt install systemctl -y

COPY ./nginx_conf/default /etc/nginx/sites-available/default
COPY ./nginx_conf/nginx.conf /etc/nginx/nginx.conf

CMD ["systemctl", "start", "nginx"]
