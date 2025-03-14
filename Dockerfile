# Use an Alpine Linux base image
FROM alpine:latest

# Set working directory in the container
WORKDIR /app

# Copy the PocketBase binary into the container
COPY pocketbase.exe /app/pocketbase.exe

# Expose the default PocketBase port
EXPOSE 8090

# Grant execution permissions
RUN chmod +x /app/pocketbase.exe

# Run PocketBase on container start
CMD ["/app/pocketbase.exe", "serve"]