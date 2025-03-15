FROM alpine

# Set the working directory
WORKDIR /app

# Copy PocketBase files to the container
COPY . /app

# Expose the default PocketBase port
EXPOSE 8090

# Grant execute permissions and run PocketBase
RUN chmod +x pocketbase
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
