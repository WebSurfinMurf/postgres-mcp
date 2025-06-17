docker build -t mcp/postgres-debug .
docker run -it --rm \
  --name mcp_debug \
  -p 8900:3000 \
  mcp/postgres-debug
