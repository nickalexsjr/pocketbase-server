# Start with a basic image
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /app

# Ensure the PocketBase binary is executable and copy it
COPY pocketbase /app/pocketbase

# Make the binary executable
RUN chmod +x /app/pocketbase

# Expose the default PocketBase port
EXPOSE 8090

# Start PocketBase when the container is run, and bind it to 0.0.0.0:8090
CMD ["/app/pocketbase", "serve", "--http", "0.0.0.0:8090"]
