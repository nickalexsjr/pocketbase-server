# Use an official Alpine image as a base
FROM alpine:latest

# Set working directory
WORKDIR /app

# Copy PocketBase binary
COPY pocketbase /app/pocketbase

# Make sure the PocketBase binary is executable
RUN chmod +x /app/pocketbase

# Expose the correct port
EXPOSE 8090

# Create the data directory for persistence
RUN mkdir -p /pb_data

# Set environment variable for persistent storage
ENV POCKETBASE_DATA_DIR=/pb_data

# Start PocketBase (WITHOUT admin command)
CMD ["/bin/sh", "-c", "/app/pocketbase serve --http 0.0.0.0:8090"]
