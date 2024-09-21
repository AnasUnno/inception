#!/bin/bash

sed -i "s/^listen\s*=.*$/listen = 9000/" /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /var/www/html
cd /var/www/html
rm -rf *
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp-cli
wp-cli core download --allow-root
wp-cli config create --dbname=$DB --dbuser=$DB_U --dbpass=$DB_P --dbhost=$DB_HOST --dbprefix='wp_' --allow-root
wp-cli core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
wp-cli user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

php-fpm7.4 -F
