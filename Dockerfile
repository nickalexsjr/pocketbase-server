# Use a lightweight image
FROM alpine:latest

# Set working directory inside the container
WORKDIR /app

# Copy PocketBase binary
COPY pocketbase /app/pocketbase

# Ensure the binary is executable
RUN chmod +x /app/pocketbase

# Expose the default PocketBase port
EXPOSE 8090

# Set environment variable for the data directory (persistent storage)
ENV POCKETBASE_DATA_DIR=/pb_data
ENV POCKETBASE_TRUST_PROXY=1
ENV PORT=8090  # Force the port to 8090 for consistency

# Create the data directory
RUN mkdir -p $POCKETBASE_DATA_DIR

# Start PocketBase, binding it to the correct URL
CMD ["/bin/sh", "-c", "/app/pocketbase serve --http 0.0.0.0:$PORT --public-url https://pocketbase-server-j9pc.onrender.com"]

