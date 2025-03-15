# Use a lightweight Alpine Linux base
FROM alpine:latest

# Set working directory inside the container
WORKDIR /app

# Copy PocketBase binary to the container
COPY pocketbase /app/pocketbase

# Ensure the PocketBase binary is executable
RUN chmod +x /app/pocketbase

# Expose PocketBase default HTTP port
EXPOSE 8090

# Set the data directory for PocketBase
ENV POCKETBASE_DATA_DIR=/pb_data

# Create the persistent data directory
RUN mkdir -p $POCKETBASE_DATA_DIR

# Start PocketBase and ensure it stays running
CMD ["/bin/sh", "-c", "/app/pocketbase serve --http 0.0.0.0:8090 --public & sleep 5 && curl -X POST \"http://localhost:8090/api/admins\" -H \"Content-Type: application/json\" -d '{\"email\": \"admin@example.com\", \"password\": \"AdminPass123\"}' || true && tail -f /dev/null"]
