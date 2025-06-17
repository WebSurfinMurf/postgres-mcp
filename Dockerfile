FROM mcp/postgres:latest

# Install minimal tools using Alpine's package manager
RUN apk add --no-cache bash curl coreutils procps net-tools iputils

WORKDIR /app

# Keep container alive for debugging
CMD ["sleep", "3600"]
