#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

echo "==> Building all services..."
echo ""

# ── Backend ────────────────────────────────────────────────────────────────────
echo "[1/3] Building backend (Maven)..."
cd "$ROOT_DIR/backend/java-spring-api"
mvn package -DskipTests -q
echo "      Backend build complete."
echo ""

# ── Frontend ───────────────────────────────────────────────────────────────────
echo "[2/3] Building frontend (Vite)..."
cd "$ROOT_DIR/frontend/react-app"
npm ci --silent
npm run build
echo "      Frontend build complete."
echo ""

# ── Containers ─────────────────────────────────────────────────────────────────
echo "[3/3] Building container images (Podman)..."
cd "$ROOT_DIR/containers"
podman-compose build
echo "      Container images built."
echo ""

echo "==> All services built successfully."
