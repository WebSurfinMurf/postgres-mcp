FROM mcp/postgres:latest

# For Alpine-based image
RUN apk add --no-cache bash curl coreutils procps net-tools iputils

WORKDIR /app

# Override ENTRYPOINT from base image to allow debugging
ENTRYPOINT ["/bin/sh"]

# Default to sleeping if no command provided
CMD ["-c", "sleep 3600"]
