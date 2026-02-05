FROM 2fauth/2fauth:latest

COPY .env /2fauth/.env

# Override the startup to avoid destructive migrate
CMD ["sh", "-c", "php artisan migrate --force --no-interaction && php artisan serve --host=0.0.0.0 --port=${PORT:-8000} --no-reload"]
