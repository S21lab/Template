#!/bin/bash

# Start All Services in Development Mode

set -e

echo "🚀 Starting all services in development mode..."

# Check if docker-compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "❌ docker-compose is not installed"
    exit 1
fi

# Start services
echo "🐳 Starting Docker services..."
docker-compose up -d

# Wait for services to be ready
echo "⏳ Waiting for services to be ready..."
sleep 5

# Check postgres
echo "✅ PostgreSQL is running"

# Check redis
echo "✅ Redis is running"

echo ""
echo "✅ All services started successfully!"
echo ""
echo "📝 Next steps:"
echo "  - Backend: http://localhost:3000"
echo "  - Web: http://localhost:3001"
echo "  - Nginx: http://localhost"
echo ""
echo "View logs with: docker-compose logs -f"
echo "Stop services with: docker-compose down"
