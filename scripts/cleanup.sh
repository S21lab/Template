#!/bin/bash

# Cleanup Docker Resources

echo "🧹 Cleaning up Docker resources..."

# Stop containers
echo "Stopping containers..."
docker-compose down

# Remove dangling images
echo "Removing dangling images..."
docker image prune -f

# Remove dangling volumes
echo "Removing dangling volumes..."
docker volume prune -f

echo "✅ Cleanup completed!"
