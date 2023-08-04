#!/bin/bash

echo "Mariadb Start"
service mariadb start

sleep 1

echo "Mariadb Edit Password root"
mysql -e "ALTER USER '${DATABASE_ROOT}'@'localhost' IDENTIFIED BY '${DATABASE_ROOT_PASS}';FLUSH PRIVILEGES ;"

echo "Mariadb Create DATABASE"
mysql -u ${DATABASE_ROOT} -p${DATABASE_ROOT_PASS} -e "CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME} ;"

echo "Mariadb Create USER"
mysql -u ${DATABASE_ROOT} -p${DATABASE_ROOT_PASS} -e "CREATE USER IF NOT EXISTS '${DATABASE_USER}'@'wordpress.srcs_my_network' IDENTIFIED BY '${DATABASE_USER_PASS}' ;"

echo "Mariadb Privillege"
mysql -u ${DATABASE_ROOT} -p${DATABASE_ROOT_PASS} -e "GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO ${DATABASE_USER}@'wordpress.srcs_my_network' IDENTIFIED BY '${DATABASE_USER_PASS}' ; FLUSH PRIVILEGES ;"

echo "Mariadb Shutdown"
mysqladmin -u ${DATABASE_ROOT} -p${DATABASE_ROOT_PASS} shutdown

echo "Mariadb is Success"

mysqld_safe --bind-address=0.0.0.0