# Use Alpine as a base image
FROM alpine:latest

# Set working directory
WORKDIR /app

# Copy PocketBase binary
COPY pocketbase /app/pocketbase

# Ensure PocketBase binary is executable
RUN chmod +x /app/pocketbase

# Expose the correct port
EXPOSE 8090

# Set environment variable for persistent storage
ENV POCKETBASE_DATA_DIR=/pb_data

# Create a persistent storage directory
RUN mkdir -p /pb_data

# Start PocketBase properly and ensure it keeps running
CMD ["/bin/sh", "-c", "/app/pocketbase serve --http 0.0.0.0:8090 & sleep 5 && curl -X POST \"http://localhost:8090/api/admins\" -H \"Content-Type: application/json\" -d '{\"email\": \"admin@example.com\", \"password\": \"AdminPass123\"}' || true && tail -f /dev/null"]
