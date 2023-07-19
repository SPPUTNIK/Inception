#!/bin/bash

service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME} ;"

mysql -e "CREATE USER IF NOT EXISTS '${DATABASE_USER}'@'wordpress.srcs_my_network' IDENTIFIED BY '${DATABASE_USER_PASS}' ;" 

mysql -e "GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO ${DATABASE_USER}@'wordpress.srcs_my_network' IDENTIFIED BY '${DATABASE_USER_PASS}' ; FLUSH PRIVILEGES ;" 

sleep 1

mysql -e "ALTER USER '${DATABASE_ROOT}'@'localhost' IDENTIFIED BY '${DATABASE_ROOT_PASS}';FLUSH PRIVILEGES ;"

mysqladmin -u ${DATABASE_ROOT} -p${DATABASE_ROOT_PASS} shutdown

echo "Mariadb is Success"

mysqld --bind-address=0.0.0.0