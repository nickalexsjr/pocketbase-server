# Start with a basic image
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the PocketBase binary into the container
COPY pocketbase /app/pocketbase

# Expose the default PocketBase port
EXPOSE 8090

# Start PocketBase when the container is run
CMD ["/app/pocketbase", "serve"]
