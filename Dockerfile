FROM 2fauth/2fauth:latest

# Create data directory with correct permissions
RUN mkdir -p /srv/database && \
    chown -R www-data:www-data /srv/database && \
    chmod 755 /srv/database

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=30s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8000/health || exit 1

EXPOSE 8000

# Start command that works on Render
CMD ["sh", "-c", "php artisan migrate --force && supervisord -c /etc/supervisor/supervisord.conf"]
