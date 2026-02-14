# Deployment Guide

Production deployment procedures and best practices.

## 📋 Pre-Deployment Checklist

- [ ] All tests passing
- [ ] Code reviewed and approved
- [ ] Environment variables configured
- [ ] Database migrations tested
- [ ] SSL certificates valid
- [ ] Backups created
- [ ] Monitoring configured
- [ ] Rollback plan documented

## 🚀 Deployment Steps

### 1. Staging Deployment

```bash
git checkout develop
git pull origin develop
./scripts/build-all.sh
docker-compose build
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
./scripts/migrate-db.sh
```

### 2. Health Checks

```bash
curl https://staging.enterprise.com/health
curl https://staging.enterprise.com/api/health
```

### 3. Production Deployment

```bash
# Tag release
git tag -a v1.0.0 -m "Release v1.0.0"
git push origin v1.0.0

# Automatic deployment via CI/CD
# Or manual deployment:
git checkout main
git pull origin main
./scripts/build-all.sh
docker-compose build
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
./scripts/migrate-db.sh
```

## 🔄 Blue-Green Deployment

### Setup

```bash
# Start blue environment
NAMESPACE=blue docker-compose up -d

# Start green environment
NAMESPACE=green docker-compose up -d

# Switch traffic with nginx
# Update upstream servers in nginx.conf
docker exec nginx_prod nginx -s reload
```

## 📦 Database Migrations

### Before Deployment

1. Test migrations on staging
2. Create backup before running
3. Plan rollback strategy

### Running Migrations

```bash
docker-compose exec backend npm run migrate
```

### Emergency Rollback

```bash
# Restore from backup
./scripts/restore-db.sh database/backups/backup_20260215.sql

# Restart services
docker-compose restart
```

## 🔐 Secrets Management

### Environment Variables

```bash
# Never commit .env to git
# Store in secrets manager:
# - AWS Secrets Manager
# - HashiCorp Vault
# - GitHub Secrets
```

### SSL Certificates

```bash
# Place certificates in docker/ssl/
cp /path/to/cert.pem docker/ssl/
cp /path/to/key.pem docker/ssl/
```

## 📊 Monitoring & Alerts

### Health Checks

```bash
# Application health
curl https://enterprise.com/health

# Database health
docker-compose exec postgres pg_isready

# Redis health
docker-compose exec redis redis-cli ping
```

### Logs

```bash
# View logs
docker-compose logs -f backend
docker-compose logs -f web
docker-compose logs -f nginx

# Send to centralized logging
# Configure with ELK stack or Cloud Logging
```

## ⚠️ Emergency Procedures

### Service Down

```bash
# Check status
docker-compose ps

# Restart service
docker-compose restart backend

# View logs
docker-compose logs backend
```

### Database Issues

```bash
# Check database
docker-compose exec postgres psql -U postgres -d enterprise_db -c "SELECT 1;"

# Check disk space
docker-compose exec postgres du -sh /var/lib/postgresql/data

# Restart database
docker-compose restart postgres
```

### Out of Memory

```bash
# Check usage
docker stats

# Clean up
docker system prune
docker container prune
```

## 📈 Post-Deployment

1. Verify all services running
2. Check application logs
3. Monitor error rates
4. Verify database entries
5. Test critical flows
6. Inform stakeholders
7. Document deployment

## 🔙 Rollback Procedure

### Full Rollback

```bash
# Stop current version
docker-compose down

# Restore backup
./scripts/restore-db.sh database/backups/backup_last_working.sql

# Checkout previous version
git checkout v1.0.0

# Redeploy
docker-compose build
docker-compose up -d
```

## 📝 Deployment Log Template

```
Date: 2026-02-15
Version: v1.0.0
Deployed By: DevOps Team
Environment: Production

Changes:
- Feature X
- Bug fix Y
- Dependency Z

Duration: 30 minutes
Status: Successful ✅

Verification:
- Health check: ✅
- Database migration: ✅
- Critical flow test: ✅
- Performance test: ✅

Notes:
- Everything looks good
- Monitoring shows normal levels
```

## 🆘 Support & Escalation

- **Level 1**: Automated health checks and alerts
- **Level 2**: On-call developer review
- **Level 3**: Emergency incident response team
- **Level 4**: CTO and infrastructure lead

## 📚 Related Documentation

- [Architecture](ARCHITECTURE.md)
- [Security](SECURITY.md)
- [Troubleshooting](TROUBLESHOOTING.md)
