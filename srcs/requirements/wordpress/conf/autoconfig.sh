#!/bin/bash

cd /var/www/wordpress

wp core config	--dbhost=mariadb \
				--dbname=wordpress \
				--dbuser=normal \
				--dbpass=normal \
				--allow-root

wp core install --title=Inception \
				--admin_user=wp \
				--admin_password=wp \
				--admin_email=fake_mail@mail.com \
				--url=lsordo.42.fr \
				--allow-root

wp user create author fake_mail@gmail.com --role=author --user_pass=pass --allow-root

cd -

php-fpm7.4 -F
