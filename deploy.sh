#!/bin/bash
set -e

echo "Loading environment variables..."
set -a
source /home/websurfinmurf/projects/secrets/postgres.env
source /home/websurfinmurf/projects/secrets/postgres-mcp.env
set +a

echo "Cleaning up existing containers..."
docker rm -f "${POSTGRES_CONTAINER_NAME}" "${MCP_SERVER_NAME}" 2>/dev/null || true

echo "Creating volume if not already created..."
docker volume create "${POSTGRES_VOLUME}" >/dev/null || true

echo "Starting PostgreSQL container..."
docker run -d \
  --name "${POSTGRES_CONTAINER_NAME}" \
  -e POSTGRES_USER="${POSTGRES_USER}" \
  -e POSTGRES_PASSWORD="${POSTGRES_PASSWORD}" \
  -e POSTGRES_DB="${POSTGRES_DB}" \
  -p "${MCP_POSTGRES_PORT}:5432" \
  -v "${POSTGRES_VOLUME}:/var/lib/postgresql/data" \
  postgres:15

echo "Starting MCP server container..."
docker run -d \
  --name "${MCP_SERVER_NAME}" \
  --env DATABASE_URI="${DATABASE_URI}" \
  --env MCP_DB_HOST="${MCP_DB_HOST}" \
  --env MCP_DB_NAME="${MCP_DB_NAME}" \
  --env MCP_DB_USER="${MCP_DB_USER}" \
  --env MCP_DB_PASS="${MCP_DB_PASS}" \
  -p "${MCP_PORT}:3000" \
  "${MCP_IMAGE}" \
  --access-mode=unrestricted

echo "✅ PostgreSQL '$POSTGRES_CONTAINER_NAME' running on port ${MCP_POSTGRES_PORT}"
echo "✅ MCP server '$MCP_SERVER_NAME' running on port ${MCP_PORT}"
