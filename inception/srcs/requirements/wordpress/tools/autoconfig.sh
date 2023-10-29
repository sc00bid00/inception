#!/bin/bash
# always remember the --allow-root flag for every wp cli command. unless you create ad execute as a non privileged user
# change specific data according to you situation
# remmber to integrate /etc/hosts accordingly
# installation of new theme and removal of unnecessary themes and plugins is smart but not required and can be omitted
# basing on experience if wordpress is executed before mariadb then you are screwed

sleep 10
cd /var/www/wordpress
if [ ! -f "wp-config.php" ]; then
	echo "Create config"
	wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'
	echo "Create wp admin"
	wp core install --url=lsordo.42.fr --title="Inception" --admin_name=$WP_ADMIN --admin_password=$WP_ADMIN_PW --admin_email=lsordo@student.42heilbronn.de --allow-root
	echo "Create wp user"
	wp user create $WP_USER normal@student.42heilbronn.de --user_pass=$WP_USER_PW --allow-root
	echo "Change url address"
	wp option update home --allow-root "https://lsordo.42.fr"
	wp option update siteurl --allow-root "https://lsordo.42.fr"
	echo "Install and activate new theme"
	wp theme install inspiro --allow-root --activate
	echo "Delete inactive plugins and themes"
	wp plugin delete --allow-root $(wp plugin list --allow-root --status=inactive --field=name)
	wp theme delete --allow-root $(wp theme list --allow-root --status=inactive --field=name)
fi
chown -R www-data:www-data /var/www/wordpress
php-fpm7.4 -F
