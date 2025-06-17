FROM mcp/postgres:latest

# Add a minimal package manager and shell (assumes it's based on debian or alpine)
# If Alpine:
# RUN apk add --no-cache bash curl coreutils

# If Debian-based (more likely for Node images):
RUN apt-get update && \
    apt-get install -y curl procps net-tools iputils-ping && \
    apt-get clean

# Set working directory
WORKDIR /app

# Default to running a no-op sleep so you can exec in
CMD ["sleep", "3600"]
