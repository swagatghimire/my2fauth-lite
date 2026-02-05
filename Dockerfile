FROM 2fauth/2fauth:latest

COPY .env /2fauth/.env

RUN chown -R www-data:www-data /2fauth/storage /2fauth/bootstrap/cache

# Skip any custom entrypoint by overriding it
ENTRYPOINT []

# Run only safe migrate + server
CMD ["sh", "-c", "php artisan migrate --force --no-interaction && php artisan key:generate --force --no-interaction && php artisan passport:install --force && php artisan optimize && exec php artisan serve --host=0.0.0.0 --port=${PORT:-8000} --no-reload"]
