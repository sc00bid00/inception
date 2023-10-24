#!/bin/bash
service mariadb start;
while ! mysqladmin ping --silent; do
	sleep 1
done

echo "Create database"
mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
echo "Create user"
mariadb -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"
echo "Grant privileges"
mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
sleep 1
echo "Alter flush"
mariadb -u root -p"$MYSQL_ROOT_PASSWORD" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;"
echo "Shutdown"
mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown
sleep 1
echo "Start-up again"
exec mysqld_safe
