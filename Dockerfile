# Use a minimal base image
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /app

# Install SQLite dependency
RUN apk add --no-cache sqlite

# Copy the PocketBase binary
COPY pocketbase /app/pocketbase
RUN chmod +x /app/pocketbase

# Ensure a persistent data directory
RUN mkdir -p /app/pb_data

# Set the correct environment variables
ENV POCKETBASE_DATA_DIR="/app/pb_data"
ENV PORT=8090

# Expose the correct PocketBase port
EXPOSE 8090

# Start PocketBase and force it to bind correctly
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/app/pb_data", "--publicDir=/app/pb_public"]
