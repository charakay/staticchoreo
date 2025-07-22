FROM nginx:alpine

# Create a non-root user and group (e.g., user id 1001)
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copy files to nginx html folder
COPY . /usr/share/nginx/html

# Change ownership of the nginx html folder to the new user
RUN chown -R appuser:appgroup /usr/share/nginx/html

# Run nginx as non-root user
USER appuser

# Expose port 80 (default nginx port)
EXPOSE 80

# Start nginx (already default CMD in nginx image, so optional)
CMD ["nginx", "-g", "daemon off;"]
