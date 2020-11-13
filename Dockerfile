
FROM composer:2 AS composer

FROM php:7.4-fpm

COPY --from=composer /usr/bin/composer /usr/bin/composer

ADD . /app

RUN sed -i 's|http://deb.debian.org|http://mirrors.aliyun.com|g' /etc/apt/sources.list \
    && sed -i 's|http://security.debian.org|http://mirrors.aliyun.com|g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y git zip unzip zlib1g-dev libpng-dev libjpeg62-turbo-dev libfreetype6-dev mariadb-client\
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo pdo_mysql \
    && rm -rf /var/lib/apt/lists/* \
    && cd /app \
    && composer install

CMD ["/app/docker-entrypoint.sh"]
