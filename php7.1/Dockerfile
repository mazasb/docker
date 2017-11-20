FROM php:7.1-fpm-jessie

MAINTAINER Balazs Mazas <mazasb@gmail.com>
LABEL updated_at="2017-11-20"

RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
        unzip \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libicu-dev \
        libmcrypt-dev \
        libpng-dev \
        libxml2-dev \
    && docker-php-ext-install -j$(nproc) intl iconv mcrypt mbstring soap \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && pecl install \
        redis \
        xdebug \
    && echo "date.timezone=Europe/Budapest" > "$PHP_INI_DIR/conf.d/date_timezone.ini"

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_CACHE_DIR /cache
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer
