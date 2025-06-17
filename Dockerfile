# Dockerfile
FROM python:3.13-rc-slim

# Install mcp-client from PyPI
RUN pip install --no-cache-dir mcp-client

ENTRYPOINT ["mcp-client"]
