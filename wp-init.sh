#!/bin/bash

# Perform WordPress installation
docker exec wordpress wp --path=/usr/src/wordpress db reset --yes
docker exec wordpress wp --path=/usr/src/wordpress core install --url=http://localhost --title="Example Admin" --admin_user=admin --admin_password=admin --admin_email=example@example.com

# Install plugins and themes
docker exec wordpress wp --path=/usr/src/wordpress plugin install gutenberg --activate
docker exec wordpress wp --path=/usr/src/wordpress plugin install redis-cache --activate
docker exec wordpress wp --path=/usr/src/wordpress plugin install wp-super-cache --activate
docker exec wordpress wp --path=/usr/src/wordpress theme install twentyseventeen --activate

# Delete unnecessary plugins and themes
docker exec wordpress wp --path=/usr/src/wordpress plugin delete hello
docker exec wordpress wp --path=/usr/src/wordpress plugin delete akismet
docker exec wordpress wp --path=/usr/src/wordpress theme delete twentyfifteen
docker exec wordpress wp --path=/usr/src/wordpress theme delete twentysixteen

# Set url structure
docker exec wordpress wp --path=/usr/src/wordpress rewrite structure '/%postname%/' --hard

# Fix permissions
docker exec wordpress chown -R nobody.nobody /var/www/wp-content