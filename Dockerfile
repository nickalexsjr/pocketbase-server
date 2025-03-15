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

# Expose the correct PocketBase port
EXPOSE 8090

# Force PocketBase to bind to the correct Render URL
ENV POCKETBASE_PUBLIC_URL="https://pocketbase-server-j9pc.onrender.com"
ENV PORT=8090

# Start PocketBase with correct binding
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/app/pb_data", "--publicDir=/app/pb_public", "--public-url=https://pocketbase-server-j9pc.onrender.com"]
