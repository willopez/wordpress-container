# WordPress Docker Container

WordPress container with Nginx 1.12 & PHP-FPM 7.1 based on Alpine Linux.

WordPress Version: **4.8.3**

## Usage
See [docker-compose.yml](https://github.com/willopez/wordpress-container/blob/master/docker-compose.yml) how to use it in your own environment. 

NOTE: An external docker network named: backend will be required, create one by running this command: ```docker network create backend```

    docker-compose up

Or

    docker run -d -p 80:80 -v /local/wp-content:/var/www/wp-content \
    -e "DB_HOST=db" \
    -e "DB_NAME=wordpress" \
    -e "DB_USER=wp" \
    -e "DB_PASSWORD=secret" \
    -e "FS_METHOD=direct" \
    willopez/wordpress

# WP-CLI
WP-CLI is included in the image, execute commands this way: 
```
docker exec <container_name || image_id > wp plugin list
```

### Inspired by

* https://hub.docker.com/_/wordpress/
* https://codeable.io/wordpress-developers-intro-to-docker-part-two/
* https://github.com/TrafeX/docker-php-nginx/
