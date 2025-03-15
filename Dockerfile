# Use a lightweight image
FROM alpine:latest

# Set working directory inside the container
WORKDIR /app

# Copy PocketBase binary
COPY pocketbase /app/pocketbase

# Ensure the binary is executable
RUN chmod +x /app/pocketbase

# Expose the correct port
EXPOSE 8090

# Set environment variable for the data directory (persistent storage)
ENV POCKETBASE_DATA_DIR=/pb_data

# Create the data directory and ensure proper permissions
RUN mkdir -p $POCKETBASE_DATA_DIR && chmod 777 $POCKETBASE_DATA_DIR

# Start PocketBase, wait, then ensure admin user exists
CMD ["/bin/sh", "-c", "/app/pocketbase serve --http 0.0.0.0:8090 & sleep 5 && /app/pocketbase admin list || /app/pocketbase admin create --email admin@example.com --password AdminPass123"]
