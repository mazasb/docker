FROM php:7.1-fpm-jessie

MAINTAINER Balazs Mazas <mazasb@gmail.com>
ENV UPDATED_AT 2017-11-12

RUN apt-get update && apt-get install -y \
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
    && docker-php-ext-install -j$(nproc) gd

RUN pecl install redis \
    && pecl install xdebug \
    && docker-php-ext-enable redis xdebug

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer
RUN curl -sSL https://get.docker.com/ | sh

RUN rm -rf /var/lib/apt/lists/*
