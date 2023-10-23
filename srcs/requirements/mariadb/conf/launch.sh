#!/bin/bash
service mariadb start;

while ! mysqladmin ping --silent; do
	sleep 1
done

echo "Create database"
mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
echo "Create user"
mariadb -e "CREATE USER IF NOT EXISTS $MYSQL_USER@'localhost' IDENTIFIED BY $MYSQL_PASSWORD;"
echo "Grant rpivileges"
mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@'%' IDENTIFIED BY $MYSQL_PASSWORD;"
echo "Grant privileges"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY $MYSQL_ROOT_PASSWORD;"
echo "Flush"
mariadb -e "FLUSH PRIVILEGES;"
echo "Shutdown"
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
echo "Start-up again"
exec mysqld_safe
