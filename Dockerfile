# Use a lightweight image
FROM alpine:latest

# Set working directory inside the container
WORKDIR /app

# Copy PocketBase binary
COPY pocketbase /app/pocketbase

# Ensure the binary is executable
RUN chmod +x /app/pocketbase

# Set environment variable for the data directory (persistent storage)
ENV POCKETBASE_DATA_DIR=/pb_data

# Create the data directory
RUN mkdir -p $POCKETBASE_DATA_DIR

# Expose the correct PocketBase port
EXPOSE 8090

# Start PocketBase and create the superuser on first boot
CMD ["/bin/sh", "-c", "/app/pocketbase serve --http 0.0.0.0:8090 & sleep 5 && /app/pocketbase superuser upsert admin@example.com AdminPass123"]
