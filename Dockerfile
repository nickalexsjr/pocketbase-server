# Use a lightweight image
FROM alpine:latest

# Set working directory inside the container
WORKDIR /app

# Copy PocketBase binary
COPY pocketbase /app/pocketbase

# Ensure the binary is executable
RUN chmod +x /app/pocketbase

# Expose the default PocketBase port
EXPOSE 8090

# Set environment variable for the data directory (persistent storage)
ENV POCKETBASE_DATA_DIR=/pb_data

# Create the data directory
RUN mkdir -p $POCKETBASE_DATA_DIR

# Start PocketBase and create a superuser on first boot
CMD ["/bin/sh", "-c", "/app/pocketbase serve --http 0.0.0.0:8090 & sleep 5 && /app/pocketbase admin create --email admin@example.com --password AdminPass123"]
