FROM php:7.0-fpm

RUN apt-get update && apt-get -y install git vim curl zlib1g-dev netcat mysql-client

RUN docker-php-ext-install pdo_mysql \
    && docker-php-ext-install zip \
    && docker-php-ext-install json

RUN curl -O "https://getcomposer.org/composer.phar" \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["start"]
