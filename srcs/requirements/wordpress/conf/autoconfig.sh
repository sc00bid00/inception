#!/bin/bash
sleep 10
wordpress_dir=/
if [ ! -f "$wordpress_dir/wp-config.php" ]; then
	wp config create	--allow-root \
						--dbname=$SQL_DATABASE \
						--dbuser=$SQL_USER \
						--dbpass=$SQL_PASSWORD \
						--dbhost=mariadb:3306 \
						--path='/var/www/wordpress'
fi
/usr/sbin/php-fpm7.3 -F
