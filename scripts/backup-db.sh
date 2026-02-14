#!/bin/bash

# Backup Database

timestamp=$(date +%Y%m%d_%H%M%S)
backup_file="database/backups/backup_${timestamp}.sql"

echo "💾 Backing up database..."

docker-compose exec -T postgres pg_dump -U postgres enterprise_db > "$backup_file"

echo "✅ Backup created: $backup_file"
echo "📊 Size: $(du -h "$backup_file" | cut -f1)"
