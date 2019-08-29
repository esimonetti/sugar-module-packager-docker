FROM php:7.1-cli
MAINTAINER enrico.simonetti@gmail.com

RUN apt-get update \
    && apt-get install -y \
    libzip-dev \
    unzip \
    git \
    --no-install-recommends \
    && apt-get clean \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN pecl install zip \
    && docker-php-ext-enable zip

RUN curl -sS http://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

COPY bin/* /usr/local/bin/
