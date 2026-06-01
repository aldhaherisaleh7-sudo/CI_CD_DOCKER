FROM php:8.5-fpm

WORKDIR /app
COPY . .

RUN apt-get update && apt-get install -y \
    git unzip zip libzip-dev \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pdo_mysql bcmath zip

RUN pecl install xdebug && docker-php-ext-enable xdebug
ENV XDEBUG_MODE=coverage

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY composer.json composer.lock ./

RUN composer install --no-interaction --optimize-autoloader

RUN chmod +x ./entry_point.sh
CMD ["./entry_point.sh"]
