# Use Alpine Linux as the base image
FROM alpine:latest

# Set environment variables


# Install MariaDB and create necessary directories
RUN apk --no-cache add mariadb mariadb-client && \
    mkdir -p /run/mysqld && \
    mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql

# Initialize MariaDB data directory
RUN mysql_install_db --user=mysql --ldata=/var/lib/mysql

# Expose the MariaDB port
EXPOSE 3306
