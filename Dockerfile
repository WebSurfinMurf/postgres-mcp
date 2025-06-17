# Use full Debian image
FROM debian:bookworm

# Install common utilities and Python
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    curl \
    net-tools \
    iputils-ping \
    dnsutils \
    vim \
    git

# Install mcp-client with system override
RUN pip3 install --break-system-packages --no-cache-dir mcp-client

# Symlink for easier calling
RUN ln -s /usr/local/bin/mcp-client /usr/bin/mcp-client || true

ENTRYPOINT ["mcp-client"]
