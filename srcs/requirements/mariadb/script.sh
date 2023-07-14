#!/bin/bash

service mysql start


echo "CREATE DATABASE IF NOT EXISTS $db_name ;" | mysql

echo "CREATE USER IF NOT EXISTS '$db_user'@'localhost' IDENTIFIED BY '$db_pwd' ;"  | mysql

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$db_pwd' ;" | mysql

echo "FLUSH PRIVILEGES;" | mysql

# service mysql restart
# mysqladmin shutdown

mysqld_safe

# Restart the MySQL service with the IP address set to 0.0.0.0
mysqld --bind-address=0.0.0.0