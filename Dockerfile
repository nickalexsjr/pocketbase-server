# Use a minimal base image
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /app

# Install SQLite dependency
RUN apk add --no-cache sqlite

# Copy the PocketBase binary
COPY pocketbase /app/pocketbase
RUN chmod +x /app/pocketbase

# Ensure a proper data directory
RUN mkdir -p /app/pb_data

# Expose correct ports
EXPOSE 8090

# Start PocketBase and make sure it serves API correctly
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/app/pb_data", "--publicDir=/app/pb_public"]
