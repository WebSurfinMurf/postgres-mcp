#!/bin/bash
set -e

echo "Loading environment variables..."
set -a
source /home/websurfinmurf/projects/secrets/postgres.env
source /home/websurfinmurf/projects/secrets/postgres-mcp.env
set +a

echo "Cleaning up existing container if it exists..."
docker rm -f $POSTGRES_CONTAINER_NAME 2>/dev/null || true

echo "Creating volume if not already created..."
docker volume create $POSTGRES_VOLUME >/dev/null

echo "Starting PostgreSQL container..."
    
docker run -d \
  --name ${MCP_SERVER_NAME} \
  --env DATABASE_URI="${DATABASE_URI}" \
  --env MCP_DB_HOST=${MCP_DB_HOST} \
  --env MCP_DB_NAME=${POSTGRES_DB} \
  --env MCP_DB_USER=${POSTGRES_USER} \
  --env MCP_DB_PASS=${POSTGRES_PASSWORD} \
  -p  ${EPORT}:${IPORT} \
  ${MCP_IMAGE} \
  --access-mode=unrestricted
    
echo "✅ PostgreSQL container '$POSTGRES_CONTAINER_NAME' is running on port $POSTGRES_PORT
