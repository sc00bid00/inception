#!/bin/bash
sleep 3
service mariadb start;
while ! mysqladmin ping --silent; do
	sleep 1
done
# echo prompts assist in the building phase ig docker is building in -it mode
# mariadb has to go up first, differently inception will not work despite the restarting directives in the compose file
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
echo "Start in safe mode"
exec mysqld_safe

# useful commands login mariadb and show that the DB is not empty:
# docker exec -it mariadb bash // logs into the container running bash, assuming mariadb is the container name
# mariadb -uroot -p // logs into mariadb, prompts for the password (stored in the apposite section of the .env file), logging in without pw
# should be reason to fail...
# SHOW TABLES FROM mariadb; // will list the tables present in teh database assuming mariadb is the database name
