# Use the Alpine Linux base image
FROM alpine:latest

RUN apk update &&\
	apk --no-cache add nginx

# access and error logs
RUN mkdir -p /var/log/nginx

COPY ./nginx_conf/default /etc/nginx/http.d/default.conf
COPY ./nginx_conf/index.html /var/www/localhost/index.html

# Expose ports for HTTP and HTTPS
EXPOSE 80 443

# Start Nginx - thanks cgtp ;-)
CMD ["nginx", "-g", "daemon off;"]
