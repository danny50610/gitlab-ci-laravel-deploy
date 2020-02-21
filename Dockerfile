FROM php:7.4-cli

RUN apt-get update && \
    apt-get install -qqy --no-install-recommends git curl libzip-dev openssh-client unzip && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-install zip && \
    curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer global require "laravel/envoy=~1.0" --no-ansi --no-suggest --optimize-autoloader && \
    composer clear-cache && \
    mkdir -p ~/.ssh && \
    ~/.composer/vendor/bin/envoy --version
