FROM php:7.1.11-fpm-jessie

RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
    libmcrypt-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng12-dev \
    mysql-client libmagickwand-dev --no-install-recommends \
    libzip-dev \
    && pecl install imagick \
    && pecl install zip \
    && docker-php-ext-enable imagick \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install mcrypt pdo_mysql

ADD Docker/uploads.ini /usr/local/etc/php/conf.d/uploads.ini

RUN echo "extension=zip.so" >> /usr/local/etc/php/conf.d/docker-php-ext-zip.ini