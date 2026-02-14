# Database Configuration

Enterprise database setup with PostgreSQL, migrations, and seed data.

## 🗄️ Database Structure

```
database/
├── migrations/          # Versioned schema changes
├── seeds/              # Initial data scripts
├── schemas/            # SQL schema definitions
├── backups/            # Database backups
└── scripts/            # Utility scripts
```

## 📋 Databases

### Production

- **Type**: PostgreSQL 15
- **Name**: enterprise_db
- **User**: postgres
- **Port**: 5432

### Development

- **Type**: PostgreSQL 15 (Docker)
- **Name**: enterprise_db
- **User**: postgres
- **Port**: 5432

## 🔄 Migrations

Migrations are version-controlled schema changes.

### Create Migration

```bash
# Using TypeORM
npm run migrate:create -- -n AddNewTable

# Or manually
touch database/migrations/001_initial_schema.sql
```

### Run Migrations

```bash
# Development
npm run migrate

# Production
npm run migrate -- --env production
```

## 📊 Schema

### Core Tables

1. **users** - User accounts
2. **roles** - User roles
3. **permissions** - Role permissions
4. **sessions** - Active sessions
5. **audit_logs** - Audit trail

## 🌱 Seeds

### Running Seeds

```bash
npm run seed
```

### Seed Data Includes

- Admin user
- Test users
- Default roles
- System settings

## 🔒 Security

- Row-level security (RLS) ready
- Password hashing (bcrypt)
- Audit logging
- Encrypted sensitive data
- Connection pooling

## 📦 Backup & Restore

### Backup

```bash
./scripts/backup-db.sh
```

### Restore

```bash
./scripts/restore-db.sh <backup_file>
```

## 🧯 Maintenance

### Vacuum & Analyze

```bash
./scripts/maintain-db.sh
```

### Check Constraints

```bash
./scripts/check-constraints.sh
```

## 📈 Performance Indexes

Key indexes are automatically created:

- Users: `email`, `uuid`
- Sessions: `user_id`, `token`
- Audit logs: `user_id`, `created_at`

## 🐳 Docker

Database container is defined in `docker-compose.yml`:

```bash
docker-compose up postgres
```

## 🔗 Connection

### Local Development

```
postgresql://postgres:postgres_password@localhost:5432/enterprise_db
```

### Docker

```
postgresql://postgres:postgres_password@postgres:5432/enterprise_db
```

## 📚 Resources

- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [TypeORM Documentation](https://typeorm.io)
- [SQL Best Practices](https://www.postgresql.org/docs/current/sql.html)
