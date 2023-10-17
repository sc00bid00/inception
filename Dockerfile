FROM debian:11

EXPOSE 80

RUN	apt update &&\
	apt install nginx -y &&\
	apt install systemctl -y

CMD ["systemctl", "start", "nginx"]
