FROM 2fauth/2fauth:latest

# Use Render's PORT variable or default to 8000
EXPOSE ${PORT:-8000}

# Start server - using Render's dynamic port
CMD ["sh", "-c", "php artisan serve --host=0.0.0.0 --port=${PORT:-8000} --no-reload"]
