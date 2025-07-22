FROM php:8.2-cli

WORKDIR /app

# Copy all app files
COPY . /app

# Create non-root user choreo with UID 10014
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

# Switch to non-root user choreo
USER choreo

# Expose port 8080
EXPOSE 8080

# Run PHP built-in web server
CMD ["php", "-S", "0.0.0.0:8080"]
