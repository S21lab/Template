#!/bin/bash

# Run All Tests

set -e

echo "🧪 Running all tests..."

echo ""
echo "🧪 Running Backend tests..."
cd backend
npm run test
cd ..

echo ""
echo "🧪 Running Web tests..."
cd web
npm run test
cd ..

echo ""
echo "✅ All tests passed!"
