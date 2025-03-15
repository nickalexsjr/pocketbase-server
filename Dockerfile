# Use a minimal base image
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /app

# Install SQLite dependency (needed for PocketBase)
RUN apk add --no-cache sqlite

# Copy the PocketBase binary and make it executable
COPY pocketbase /app/pocketbase
RUN chmod +x /app/pocketbase

# Ensure a persistent data directory
RUN mkdir -p /app/pb_data

# Set correct environment variables
ENV POCKETBASE_DATA_DIR="/app/pb_data"
ENV PORT=8090
ENV POCKETBASE_PUBLIC_URL="https://pocketbase-server-j9pc.onrender.com"

# Expose the correct PocketBase port
EXPOSE 8090

# 🚀 **Force PocketBase to expose API routes properly**
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/app/pb_data", "--publicDir=/app/pb_public"]
