# ✅ Use minimal Alpine image
FROM alpine:latest

# ✅ Set working directory
WORKDIR /app

# ✅ Install necessary dependencies
RUN apk add --no-cache sqlite curl

# ✅ Copy PocketBase binary into the container
COPY pocketbase /app/pocketbase
RUN chmod +x /app/pocketbase

# ✅ Ensure persistent storage for database & files
RUN mkdir -p /app/pb_data /app/pb_public

# ✅ Set correct environment variables for Render
ENV POCKETBASE_DATA_DIR="/app/pb_data"
ENV POCKETBASE_PUBLIC_DIR="/app/pb_public"

# ✅ **Force Public URL via Reverse Proxy (Fixed)**
ENV POCKETBASE_PUBLIC_URL="https://pocketbase-server-j9pc.onrender.com"

# ✅ Expose only the necessary port
EXPOSE 8090

# ✅ **Launch PocketBase with the correct bindings**
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/app/pb_data"]
