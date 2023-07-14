#!/bin/bash

# wp core download --allow-root
# rm wp-config-sample.ph
# mkdir /var/www
# mkdir /var/www/html
# mv /var/www/html/file.txt /var/www/html/wp-config.php

# sed -i -r "s/database_name_here/$db_name/1"   wp-config.php
# sed -i -r "s/username_here/$db_user/1"  wp-config.php
# sed -i -r "s/password_here/$db_pwd/1"    wp-config.php
# sed -i -r "s/localhost/mariadb/1"    wp-config.php
cd /var/www/html/

# Downloading and extracting Wordpress core files to the current directory
wp core download --allow-root --path="/var/www/html/"
mv /var/www/html/file.txt /var/www/html/wp-config.php
wp core install --path="/var/www/html/" --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root


wp config create	--allow-root \
                    --dbname=$db_name \
                    --dbuser=$db_user \
                    --dbpass=$db_pwd \
                    --dbhost=mariadb --path='/var/www/html'

/usr/sbin/php-fpm7.3 -F
                