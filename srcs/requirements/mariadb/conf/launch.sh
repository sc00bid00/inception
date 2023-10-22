#!/bin/bash

# Start the MariaDB service
service mysql start

# # Wait for MariaDB to start
sleep 10

# Set the root password
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;" || { echo "Failed to create database"; exit 1; }
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';" || { echo "Failed to create user"; exit 2; }
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';" || { echo "Failed to grant privileges"; exit 3; }
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" || { echo "Failed to change root password"; exit 4; }
# mysql -e "FLUSH PRIVILEGES;" || { echo "Failed to flush privileges"; exit 5; }

# Shutdown the MariaDB server
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# Start MariaDB safely
exec mysqld_safe
