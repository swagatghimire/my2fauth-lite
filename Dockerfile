FROM 2fauth/2fauth:latest

COPY .env /2fauth/.env
# Also copy to /srv if needed (some images expect it there)
COPY .env /srv/.env

# Disable the problematic entrypoint
ENTRYPOINT []

# Only safe commands
CMD sh -c "php artisan migrate --force --no-interaction && \
           php artisan optimize && \
           php artisan passport:install --force && \
           exec php artisan serve --host=0.0.0.0 --port=${PORT:-8000} --no-reload"
