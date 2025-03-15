# Use a lightweight image
FROM alpine:latest

# Set working directory inside the container
WORKDIR /app

# Copy PocketBase binary
COPY pocketbase /app/pocketbase

# Ensure the binary is executable
RUN chmod +x /app/pocketbase

# Expose the correct port (Render assigns this dynamically)
EXPOSE 8090

# Set environment variables for persistent storage and proxy handling
ENV POCKETBASE_DATA_DIR=/pb_data
ENV POCKETBASE_TRUST_PROXY=true

# Create the data directory
RUN mkdir -p $POCKETBASE_DATA_DIR

# Start PocketBase with the correct public URL and port binding
CMD ["/bin/sh", "-c", "/app/pocketbase serve --http 0.0.0.0:$PORT --public-url https://pocketbase-server-j9pc.onrender.com"]
