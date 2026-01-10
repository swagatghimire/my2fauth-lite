FROM 2fauth/2fauth:latest

# Create directory without permission changes (let 2FAuth handle it)
RUN mkdir -p /srv/database

EXPOSE 8000

# Simple PHP server - works every time
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000", "--no-reload"]
