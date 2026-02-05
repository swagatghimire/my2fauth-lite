FROM 2fauth/2fauth:latest

COPY .env /2fauth/.env

# Fully override entrypoint (bypasses any custom init that drops DB)
ENTRYPOINT []

CMD ["sh", "-c", "php artisan migrate --force --no-interaction && php artisan key:generate --force --no-interaction && php artisan passport:install --force && php artisan optimize && exec php artisan serve --host=0.0.0.0 --port=${PORT:-8000} --no-reload"]
