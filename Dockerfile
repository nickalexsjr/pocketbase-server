# Use a lightweight Linux base image
FROM alpine:latest

# Set working directory
WORKDIR /app

# Copy PocketBase binary
COPY pocketbase /app/pocketbase

# Ensure binary is executable
RUN chmod +x /app/pocketbase

# Expose the correct port
EXPOSE 8090

# Set environment variable for persistent storage
ENV POCKETBASE_DATA_DIR=/pb_data

# Create data directory
RUN mkdir -p $POCKETBASE_DATA_DIR

# Start PocketBase and ensure admin is created
CMD ["/bin/sh", "-c", "/app/pocketbase serve --http 0.0.0.0:8090 & sleep 5 && /app/pocketbase admin create --email admin@example.com --password AdminPass123 || true"]
