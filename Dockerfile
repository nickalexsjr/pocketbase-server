# Start with a basic image
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /app

# Ensure the PocketBase binary is executable
RUN chmod +x /app/pocketbase

# Copy the PocketBase binary into the container
COPY ./pocketbase /app/pocketbase

# Expose the default PocketBase port (use the appropriate port)
EXPOSE 8090

# Start PocketBase when the container is run
CMD ["/app/pocketbase", "serve"]
