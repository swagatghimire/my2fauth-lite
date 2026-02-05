FROM 2fauth/2fauth:latest

# Copy your custom .env (with DATABASE_URL, etc.)
COPY .env /2fauth/.env

# Override startup to prevent destructive DB reset (no drop/fresh)
# Run only safe, incremental migrations
# Add optimize for production readiness
CMD ["sh", "-c", "php artisan migrate --force --no-interaction && php artisan optimize && exec php artisan serve --host=0.0.0.0 --port=${PORT:-8000} --no-reload"]
