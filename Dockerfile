FROM 2fauth/2fauth:latest

COPY .env /2fauth/.env

EXPOSE 8000

# Run migrations before starting the server
CMD sh -c "php artisan migrate --force && php artisan serve --host=0.0.0.0 --port=${PORT:-8000} --no-reload"
