FROM php:8.2-cli

WORKDIR /app

# Copy all app files
COPY . /app

# Create a non-root user choreo with UID 10014
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid 10014 \
    choreo

# Change ownership of app files to choreo user
RUN chown -R choreo:choreo /app

# Switch to non-root user 'choreo'
USER choreo

# Expose port 8080 (php built-in server)
EXPOSE 8080

# Start PHP built-in server listening on all interfaces
CMD ["php", "-S", "0.0.0.0:8080"]
