FROM alpine:latest

# Set work directory
WORKDIR /app

# Copy the PocketBase binary
COPY pocketbase /app/pocketbase

# Expose the PocketBase port (change if needed)
EXPOSE 8090

# Run PocketBase on startup
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8090"]
