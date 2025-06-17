FROM python:3.13

# Add diagnostics and tools
RUN apt-get update && apt-get install -y \
    curl \
    net-tools \
    iputils-ping \
    dnsutils \
    vim \
    git \
    ca-certificates

# Install the MCP client
RUN pip install --no-cache-dir mcp-client

ENTRYPOINT ["mcp-client"]
