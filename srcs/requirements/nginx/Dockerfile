# Use the Alpine Linux base image
FROM alpine:latest

# RUN apk update &&\
# 	apk --no-cache add nginx
RUN apk update && \
	apk --no-cache add nginx &&\
	mkdir -p /var/log/nginx -p /etc/nginx/certificates

COPY ./conf.d/default.conf /etc/nginx/http.d/default.conf
COPY ./conf.d/index.html /var/www/localhost/index.html
COPY ./conf.d/my_cert.crt /etc/nginx/certificates/my_cert.crt
COPY ./conf.d/my_unencrypted_key.key /etc/nginx/certificates/my_unencrypted_key.key

# Expose ports for HTTP and HTTPS
EXPOSE 443 9000

# Start Nginx - thanks cgtp ;-)
CMD ["nginx", "-g", "daemon off;"]
