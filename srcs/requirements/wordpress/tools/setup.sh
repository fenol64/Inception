if [ ! -f "/var/www/html/wp/wp-config.php" ]; then
	echo "switch to /wp"

    mkdir -p /var/www/html/wp
	cd /var/www/html/wp

	echo $DOMAIN_NAME

	echo "Installing and starting WordPress"
	wget --no-check-certificate -q -O - https://wordpress.org/latest.tar.gz | tar -xz -C /var/www/html/wp --strip-components=1
	chmod -R +rwx /var/www/html/wp


	echo "Setup Config"
	wp config create --path=/var/www/html/wp --allow-root  --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost="mariadb":"3306" --dbprefix='wp_'
	echo "Install Core"
	wp core install --path=/var/www/html/wp --allow-root --url="$DOMAIN_NAME" --title="$WORDPRESS_SITE_NAME" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL"
	echo "Create editor"
	wp user create --path=/var/www/html/wp --allow-root "$WP_EDITOR_USER" "$WP_EDITOR_EMAIL" --role='editor' --user_pass="$WP_EDITOR_PASSWORD"
	echo "Create user"
	wp user create --path=/var/www/html/wp --allow-root  "$WP_USER" "$WP_USER_EMAIL" --role='subscriber' --user_pass="$WP_USER_PASSWORD"
fi

chmod -R 777 /var/www/html/wp
mkdir -p /run/php/
chown www-data:www-data /run/php/

exec php-fpm8.2 -F
