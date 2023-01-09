# Base image to build the container of off.
FROM php:8-fpm-alpine

# Defining varibales for user and group to be resued later
ENV PHPGROUP=laravel
ENV PHPUSER=laravel

# Add root user and giving it access to bin/bash shell
RUN adduser -g ${PHPGROUP} -s /bin/sh -D ${PHPUSER}

# Sub user info files under config files
RUN sed -i "s/user = www-data/user = ${PHPUSER}/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i "s/group = www-data/group = ${PHPGROUP}/g" /usr/local/etc/php-fpm.d/www.conf

# Make public dir to be picked up by nginx server
RUN mkdir -p /var/www/html/public

RUN docker-php-ext-install pdo pdo_mysql

CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]

