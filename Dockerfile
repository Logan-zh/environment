FROM php:8.4-fpm

RUN apt-get update && apt-get install -y \
    libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl pdo_mysql \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    git \
    unzip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html/backend

COPY ./src/backend /var/www/html/backend

EXPOSE 9000

CMD ["php-fpm"]