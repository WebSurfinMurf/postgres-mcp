# Dockerfile
FROM python:3.11-slim

# Install the MCP client
RUN pip install --no-cache-dir mcp-client

# Default entrypoint lets us pass args (like 'sse http://...')
ENTRYPOINT ["mcp-client"]
