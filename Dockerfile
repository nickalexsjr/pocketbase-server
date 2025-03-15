# Use Alpine as base image
FROM alpine:latest

# Set working directory
WORKDIR /app

# Copy PocketBase binary
COPY pocketbase /app/pocketbase

# Make PocketBase executable
RUN chmod +x /app/pocketbase

# Set up persistent database storage
VOLUME /pb_data
ENV POCKETBASE_DATA_DIR=/pb_data

# Expose the correct port
EXPOSE 8090

# Start PocketBase server
CMD ["/app/pocketbase", "serve", "--http", "0.0.0.0:8090"]
