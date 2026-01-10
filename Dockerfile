FROM 2fauth/2fauth:latest

# Use simple PHP server (bypass nginx/FPM issues)
EXPOSE ${PORT:-8000}

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=${PORT:-8000}", "--no-reload"]
