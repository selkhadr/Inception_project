#!/bin/bash

if [ ! -f "/var/www/html/wordpress/wp-config.php" ]; then
    echo "WordPress is not installed yet. Installing WordPress..."
    wp core download --path='/var/www/html/wordpress' --allow-root
    wp config create --allow-root \
        --dbname=${DB_NAME} \
        --dbuser=${DB_USER} \
        --dbpass=${DB_PASSWORD} \
        --dbhost=mariadb:3306 --path='/var/www/html/wordpress'

    wp core install --allow-root \
        --url=${WP_URL} \
        --title="My WordPress Site" \
        --admin_user=${ADMIN_USER} \
        --admin_password=${ADMIN_PASSWORD} \
        --admin_email=${ADMIN_EMAIL}

    wp user create --allow-root \
        ${EDITOR_USER} \
        ${EDITOR_EMAIL} \
        --role=editor \
        --user_pass=${EDITOR_PASSWORD}
fi

chmod -R 777 /var/www/html/wordpress/wp-content
chown -R www-data:www-data /var/www/html/wordpress
exec "$@"