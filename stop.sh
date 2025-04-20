#!/bin/bash

set -e

echo "🛑 Stopping containers if they are running..."
docker-compose down || echo "⚠️  No containers to stop."

echo "🧽 Checking for images to delete..."
IMAGES=$(docker images -q --filter "reference=*jboss*" --filter "reference=*wildfly*" | sort -u)

if [ -z "$IMAGES" ]; then
  echo "✅ No matching images found to delete."
else
  echo "🗑️  Removing matching images..."
  docker rmi $IMAGES -f
  echo "✅ Images deleted."
fi

# Optional: Uncomment to also clean unused volumes
# echo "📦 Pruning unused Docker volumes..."
# docker volume prune -f
