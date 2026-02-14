#!/bin/bash

# Run Database Migrations

set -e

echo "🗄️ Running database migrations..."

cd backend
npm run migrate

echo "✅ Database migrations completed!"
