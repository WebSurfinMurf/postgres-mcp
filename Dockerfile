FROM python:3.13-rc-slim

RUN pip install --no-cache-dir mcp-client

ENTRYPOINT ["mcp_client"]
