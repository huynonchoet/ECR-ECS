# syntax=docker/dockerfile:1
FROM public.ecr.aws/docker/library/php:8.2.10-fpm

RUN set -eux \
    && apt-get update && apt-get install -y \
    bash \
    gettext \
    libzip-dev \
    supervisor \
    wget \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    cron \
    libfcgi-bin

RUN set -eux \
    && apt-get update && apt-get install -y \
    gconf-service \
    libasound2 \
    libatk1.0-0 \
    libc6 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgcc1 \
    libgconf-2-4 \
    libgdk-pixbuf2.0-0 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libstdc++6 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    ca-certificates \
    fonts-liberation \
    libappindicator1 \
    libnss3 \
    lsb-release \
    xdg-utils

RUN set -eux \
    && docker-php-ext-install  \
    bcmath  \
    iconv  \
    opcache \
    zip \
    pdo_mysql \
    && rm -rf /tmp/*

COPY ./docker/ecs/php/php-prd.ini /usr/local/etc/php/php.ini
COPY ./docker/ecs/php/www.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./docker/ecs/php/opcache.ini /usr/local/etc/php/conf.d/opcache.ini

RUN set -eux \
    && php --ini \
    && php -i

# Set working directory
WORKDIR /var/www

# Copy existing application directory contents
COPY . /var/www

# Create laravel.log & install composer
RUN set -eux \
    && touch /var/www/storage/logs/laravel.log \
    && chown -R www-data:www-data /var/www \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer install --optimize-autoloader --no-dev \
    && php artisan view:cache \
    && php artisan route:cache

COPY ./docker/ecs/php/entrypoint.sh /
RUN set -eux \
    && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
