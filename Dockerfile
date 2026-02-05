FROM 2fauth/2fauth:latest

# Copy .env to the app's expected path
COPY .env /2fauth/.env

# Also copy to /srv/.env as fallback (image seems to use /srv as WORKDIR)
COPY .env /srv/.env

# Skip key:generate since APP_KEY is already set in .env
CMD ["sh", "-c", "php artisan migrate --force --no-interaction && php artisan passport:install --force && php artisan optimize && exec php artisan serve --host=0.0.0.0 --port=${PORT:-8000} --no-reload"]
