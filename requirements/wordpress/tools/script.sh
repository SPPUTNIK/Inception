#!/bin/bash

mkdir -p /run/php

sleep 30

wp core download --path=${WP_PATH} --allow-root

# rm wp-config-sample.php

wp config create --dbname=${DATABASE_NAME} --dbuser=${DATABASE_USER} --dbpass=${DATABASE_USER_PASS} --dbhost=${DB_HOST} --path=${WP_PATH} --allow-root --skip-check

wp core install --url=${WP_URL} --title=${WP_TITLE} --admin_user=${ADMIN_NAME} --admin_password=${ADMIN_PASS} --admin_email=${ADMIN_EMAIL} --allow-root --path=${WP_PATH}

wp user create ${USER_NAME} ${USER_EMAIL} --user_pass=${USER_PASS} --allow-root --path=${WP_PATH}

wp theme install ChromeNews --allow-root

wp theme activate ChromeNews --allow-root

# wp server --allow-root

echo "Wordpress is Success"

exec /usr/sbin/php-fpm7.4 -F


