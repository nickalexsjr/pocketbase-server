# Use Alpine as base image
FROM alpine:latest

# Set working directory
WORKDIR /app

# Install required dependencies (SQLite & curl)
RUN apk add --no-cache sqlite curl

# Copy PocketBase binary
COPY pocketbase /app/pocketbase
RUN chmod +x /app/pocketbase

# Ensure persistent data directories
RUN mkdir -p /app/pb_data /app/pb_public

# Set environment variables
ENV POCKETBASE_DATA_DIR="/app/pb_data"
ENV POCKETBASE_PUBLIC_URL="https://pocketbase-server-j9pc.onrender.com"
ENV PORT=8090

# Expose PocketBase port
EXPOSE 8090

# Start PocketBase with proper binding & persistent storage
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/app/pb_data", "--publicDir=/app/pb_public"]
