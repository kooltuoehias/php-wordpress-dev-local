#!/bin/bash

service nginx start
service mariadb start
mariadb -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
echo CREATE DATABASE wordpress
mariadb -e "GRANT ALL ON wordpress.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password';"
echo GRANT
mariadb -e "FLUSH PRIVILEGES;"
echo FLUSH PRIVILEGES
mariadb wordpress < /usr/local/etc/wp.sql
echo LOAD .sql
service php8.2-fpm start 
tail -f /var/log/nginx/access.log