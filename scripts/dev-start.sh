#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

echo "==> Starting development environment with Podman..."

# Ensure .env exists for podman-compose
if [ ! -f "$ROOT_DIR/containers/.env" ]; then
    echo "Warning: containers/.env not found. Copying from .env.example..."
    cp "$ROOT_DIR/containers/.env.example" "$ROOT_DIR/containers/.env"
    echo "Please edit containers/.env and add your secrets, then re-run this script."
    exit 1
fi

cd "$ROOT_DIR/containers"
podman-compose up -d

echo ""
echo "==> Development environment started."
echo ""
echo "  Backend API:  http://localhost:8080/api/v1"
echo "  Health check: http://localhost:8080/api/v1/health"
echo "  Frontend:     http://localhost:3000"
echo "  PostgreSQL:   localhost:5432"
echo "  Redis:        localhost:6379"
echo ""
echo "To stop:  cd containers && podman-compose down"
echo "To logs:  cd containers && podman-compose logs -f"
