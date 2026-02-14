#!/bin/bash

# Build All Applications

set -e

echo "🔨 Building all applications..."

echo ""
echo "🔨 Building Backend..."
cd backend
npm run build
cd ..

echo ""
echo "🔨 Building Web..."
cd web
npm run build
cd ..

echo ""
echo "✅ All applications built successfully!"
echo ""
echo "Outputs:"
echo "  - Backend: backend/dist"
echo "  - Web: web/dist"
