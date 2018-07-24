FROM php:7.1

RUN apt-get update && \
    apt-get install -qqy --no-install-recommends git curl libmcrypt-dev libjpeg-dev libpng-dev libfreetype6-dev libbz2-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-install mcrypt zip && \
    curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer global require "laravel/envoy=~1.0"
