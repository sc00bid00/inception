#!/bin/bash
service mariadb start;

mariadb -uroot & MYSQL=$!
while ! mysqladmin ping --silent; do
	sleep 1
done

echo "Create database"
mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
echo "Create user"
mariadb -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"
echo "Grant privileges"
mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
echo "Alter flush"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;"
echo "Shutdown"
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
wait $MYSQL
echo "Start-up again"
exec mysqld_safe
