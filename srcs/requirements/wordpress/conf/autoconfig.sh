#!/bin/bash
sleep 1
wordpress_dir=/var/www/wordpress
if [ ! -f "$wordpress_dir/wp-config.php" ]; then
	wp config create	--allow-root \
						--dbname=$MYSQL_DATABASE \
						--dbuser=$MYSQL_USER \
						--dbpass=$MYSQL_PASSWORD \
						--dbhost=mariadb:3306 \
						--path='/var/www/wordpress'
fi
/usr/sbin/php-fpm7.3 -F
