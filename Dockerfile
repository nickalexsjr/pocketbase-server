# Use a minimal base image
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /app

# Install dependencies
RUN apk add --no-cache sqlite

# Copy the PocketBase binary and make it executable
COPY pocketbase /app/pocketbase
RUN chmod +x /app/pocketbase

# Create a folder for the database
RUN mkdir -p /app/pb_data

# Expose the correct PocketBase port
EXPOSE 8090

# Start PocketBase, ensuring it serves correctly
CMD ["/app/pocketbase", "serve", "--http", "0.0.0.0:8090", "--dir", "/app/pb_data"]
