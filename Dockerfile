FROM python:3.11-slim  # more stable than 3.13-rc

RUN pip install --no-cache-dir mcp-client && \
    ln -s $(python3 -m site --user-base)/bin/mcp-client /usr/local/bin/mcp-client || true && \
    which mcp-client

ENTRYPOINT ["mcp-client"]
