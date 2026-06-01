#!/bin/bash

# Run database migrations
php artisan migrate --force

# Optimize the application for production
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Keep the container running in the foreground (PHP-FPM as PID 1)
exec php-fpm
