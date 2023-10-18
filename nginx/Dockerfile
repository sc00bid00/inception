# Use the Alpine Linux base image
FROM alpine:latest

RUN apk update &&\
	apk --no-cache add nginx

# access and error logs
RUN mkdir -p /var/log/nginx

COPY ./conf.d/default /etc/nginx/http.d/default.conf
COPY ./conf.d/index.html /var/www/localhost/index.html

# Expose ports for HTTP and HTTPS
EXPOSE 443 9000

# Start Nginx - thanks cgtp ;-)
# CMD ["nginx", "-g", "daemon off;"]
