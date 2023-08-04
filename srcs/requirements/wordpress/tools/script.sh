#!/bin/bash

mkdir -p /run/php

sleep 20

echo "Wordpress is downloaded"
wp core download --path=${WP_PATH} --allow-root

chmod -R 777 /var/www/html/wp-content

echo "Wordpress Create wp-config.php"
wp config create --dbname=${DATABASE_NAME} --dbuser=${DATABASE_USER} --dbpass=${DATABASE_USER_PASS} --dbhost=${DB_HOST} --path=${WP_PATH} --allow-root --skip-check

echo "Wordpress installing page"
wp core install --url=${WP_URL} --title=${WP_TITLE} --admin_user=${ADMIN_NAME} --admin_password=${ADMIN_PASS} --admin_email=${ADMIN_EMAIL} --allow-root --path=${WP_PATH}

echo "Wordpress Create User"
wp user create ${USER_NAME} ${USER_EMAIL} --user_pass=${USER_PASS} --allow-root --path=${WP_PATH}

echo "Wordpress is Success"

exec /usr/sbin/php-fpm7.4 -F
