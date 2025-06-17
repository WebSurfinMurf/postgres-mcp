FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Install Python 3.13 and tools
RUN apt-get update && apt-get install -y \
    python3.13 \
    python3.13-venv \
    python3.13-distutils \
    curl \
    net-tools \
    iputils-ping \
    dnsutils \
    vim \
    git \
    ca-certificates \
    && apt-get clean

# Make Python 3.13 default
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.13 1 && \
    update-alternatives --install /usr/bin/pip3 pip3 /usr/bin/pip3 1

# Upgrade pip and install mcp-client
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3 && \
    pip3 install --no-cache-dir mcp-client

ENTRYPOINT ["mcp-client"]
