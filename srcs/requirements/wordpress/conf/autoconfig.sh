#!/bin/bash
sleep 1
cd /var/www/wordpress
if [ ! -f "wp-config.php" ]; then
	echo "Create config"
	wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'
	echo "Create wp admin"
	wp core install --url=localhost --title="This is my Wordpress" --admin_name=$WP_ADMIN --admin_password=$WP_ADMIN_PW --admin_email=lsordo@student.42heilbronn.de --allow-root
	echo "Create wp user"
	wp user create $WP_USER other@student.42heilbronn.de --user_pass=$WP_USER_PW --allow-root
fi
php-fpm7.3 -F
