#!/bin/bash

main() {
    set_permissions
    prepare_storage
    wait_for_db
    run_migrations
    optimize_app
    execute_php
}

set_permissions() {
    chown -R www-data:www-data storage bootstrap/cache
    chmod -R 755 storage bootstrap/cache
}

prepare_storage() {
    php artisan storage:link
}

wait_for_db() {
    echo "Waiting for DB to be ready"
    until ./artisan migrate:status 2>&1 | grep -q -E "(Migration table not found|Migration name)"; do
        sleep 1
    done
}

run_migrations() {
    php artisan migrate --force
}

optimize_app() {
    php artisan optimize:clear
    php artisan optimize
}

execute_php() {
    exec php-fpm
}

main
