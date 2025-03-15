# ✅ Use the latest Alpine image
FROM alpine:latest

# ✅ Set working directory
WORKDIR /app

# ✅ Install required dependencies (SQLite & curl)
RUN apk add --no-cache sqlite curl

# ✅ Copy the PocketBase binary into the container
COPY pocketbase /app/pocketbase
RUN chmod +x /app/pocketbase

# ✅ Ensure persistent storage (avoids logouts & API 404 errors)
RUN mkdir -p /app/pb_data /app/pb_public

# ✅ Set environment variables
ENV POCKETBASE_DATA_DIR="/app/pb_data"
ENV POCKETBASE_PUBLIC_URL="https://pocketbase-server-j9pc.onrender.com"

# ✅ Expose the correct PocketBase port
EXPOSE 8090

# ✅ Start PocketBase with proper configuration
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/app/pb_data"]
