FROM 2fauth/2fauth:latest

# Copy .env file into container
COPY .env /2fauth/.env

# Expose port (fixed)
EXPOSE 8000

# Run the server
CMD sh -c "php artisan serve --host=0.0.0.0 --port=${PORT:-8000} --no-reload"
