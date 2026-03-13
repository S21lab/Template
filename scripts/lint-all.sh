#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

echo "==> Running all linters..."
echo ""

# ── Frontend ESLint + Prettier ─────────────────────────────────────────────────
echo "[1/1] Frontend — ESLint + Prettier..."
cd "$ROOT_DIR/frontend/react-app"

if [ ! -d node_modules ]; then
    echo "      Installing dependencies..."
    npm ci --silent
fi

npm run lint
npx prettier --check 'src/**/*.{js,jsx,css}'
echo "      Frontend lint passed."
echo ""

echo "==> All lint checks passed."
