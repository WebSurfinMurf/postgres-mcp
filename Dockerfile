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
    git \
    && pip3 install --no-cache-dir mcp-client \
    && ln -s /usr/local/bin/mcp-client /usr/bin/mcp-client

ENTRYPOINT ["mcp-client"]
