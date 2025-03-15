# ✅ Use a minimal Alpine base image
FROM alpine:latest

# ✅ Set working directory
WORKDIR /app

# ✅ Install required dependencies (SQLite & curl)
RUN apk add --no-cache sqlite curl

# ✅ Copy PocketBase binary into the container
COPY pocketbase /app/pocketbase
RUN chmod +x /app/pocketbase

# ✅ Ensure persistent storage (avoids login resets)
RUN mkdir -p /app/pb_data /app/pb_public

# ✅ Force PocketBase to use the correct Render URL
ENV POCKETBASE_DATA_DIR="/app/pb_data"
ENV POCKETBASE_PUBLIC_URL="https://pocketbase-server-j9pc.onrender.com"

# ✅ Expose correct PocketBase port
EXPOSE 8090

# ✅ **Final Force Fix: Explicitly Override Localhost**
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8090", "--publicDir=/app/pb_public", "--dir=/app/pb_data", "--publicUrl=https://pocketbase-server-j9pc.onrender.com"]
