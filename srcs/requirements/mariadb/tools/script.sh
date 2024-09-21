#!/bin/bash
sed -i -e "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
service mariadb start

mariadb -e "CREATE DATABASE IF NOT EXISTS $DB;"
mariadb -e "CREATE USER IF NOT EXISTS '$DB_U'@'%' IDENTIFIED BY '$DB_P';"
mariadb -e "GRANT ALL PRIVILEGES ON $DB.* TO '$DB_U'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop

mysqld