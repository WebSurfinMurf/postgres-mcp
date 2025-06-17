FROM python:3.13-rc-slim

RUN pip install --no-cache-dir mcp-client && \
    ln -s /root/.local/bin/mcp-client /usr/local/bin/mcp-client || true && \
    which mcp-client

ENTRYPOINT ["mcp-client"]
