FROM php:8.4-fpm

# 1. 更新軟體源並安裝 intl 所需的系統依賴
RUN apt-get update && apt-get install -y \
    libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl pdo_mysql \
    && apt-get clean && rm -rf /var/www/lib/apt/lists/*

WORKDIR /var/www/html
