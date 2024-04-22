#!/bin/bash
set -e

usage() {
  echo "$0 <usage>"
  echo " "
  echo "options:"
  echo -e "--help                           Show options for this script."
  echo -e "--mode <api|push-notif-worker>   Mode of POS application want to run."
  echo -e "                                 Default is \"api\"."
  echo -e "--num-procs <NUM>                Number of processes started by Supervisor."
  echo -e "                                 Default is 5."
}

start_api() {
  touch /var/www/storage/logs/laravel.log;
  chown -R www-data:www-data /var/www;
  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer;
  composer install --optimize-autoloader --no-dev;
  php artisan view:cache;
  php artisan config:cache;
  php artisan route:cache;
  php artisan migrate && docker-php-entrypoint php-fpm;
}

start_api

exec "$@"
