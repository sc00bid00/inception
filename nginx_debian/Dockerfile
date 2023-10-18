FROM debian:11

EXPOSE 80

RUN	apt update &&\
	apt install nginx -y &&\
	apt install systemctl -y

COPY ./conf.d/default /etc/nginx/sites-available/default
COPY ./conf.d/nginx.conf /etc/nginx/nginx.conf

CMD ["systemctl", "start", "nginx"]
