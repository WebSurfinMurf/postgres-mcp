FROM python:3.13

# Install useful Linux tools
RUN apt-get update && apt-get install -y \
    curl \
    net-tools \
    iputils-ping \
    dnsutils \
    vim \
    git \
    ca-certificates

# Install mcp-client
RUN pip install --no-cache-dir mcp-client

# Use the Python CLI module explicitly
ENTRYPOINT ["python", "-m", "mcp_client.cli"]
