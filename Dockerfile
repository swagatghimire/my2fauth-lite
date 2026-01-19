FROM 2fauth/2fauth:latest

# Copy .env (all your variables except PORT)
COPY .env /2fauth/.env

# Expose default (only for documentation; Deployra injects PORT)
EXPOSE 8000

# Run Laravel using Deployra-assigned PORT
CMD sh -c "php artisan serve --host=0.0.0.0 --port=${PORT:-8000} --no-reload"
