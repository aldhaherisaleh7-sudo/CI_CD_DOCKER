#!/bin/bash

# Run database migrations
php artisan migrate --force

# Optimize the application for production
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Instal dependancies
composer install

php artisan serve --host=0.0.0.0  --port=80
