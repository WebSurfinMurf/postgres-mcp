docker build -t local/mcp-client .

docker run --rm -it \
  --network host \
  local/mcp-client \
  sse http://localhost:8900 --input "SELECT NOW();"
