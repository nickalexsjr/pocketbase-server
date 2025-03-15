# Use a lightweight image
FROM alpine:latest

# Set working directory inside the container
WORKDIR /app

# Copy PocketBase binary
COPY pocketbase /app/pocketbase

# Ensure the binary is executable
RUN chmod +x /app/pocketbase

# Expose PocketBase default HTTP port
EXPOSE 8090

# Set the data directory for PocketBase
ENV POCKETBASE_DATA_DIR=/pb_data

# Create the persistent data directory
RUN mkdir -p $POCKETBASE_DATA_DIR

# Start PocketBase and ensure API routes are accessible
CMD ["/bin/sh", "-c", "/app/pocketbase serve --http 0.0.0.0:8090 & sleep 5 && tail -f /dev/null"]
