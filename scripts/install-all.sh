#!/bin/bash

# Install All Dependencies
# Installs dependencies for all services

set -e

echo "🚀 Installing dependencies for all services..."

echo ""
echo "📦 Installing Backend dependencies..."
cd backend
npm install
cd ..

echo ""
echo "📦 Installing Web dependencies..."
cd web
npm install
cd ..

echo ""
echo "📦 Installing Mobile dependencies..."
cd mobile
npm install
cd ..

echo ""
echo "✅ All dependencies installed successfully!"
