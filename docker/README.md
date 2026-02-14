# Docker Configuration

Production and development Docker configurations.

## 📦 Docker Images

- `enterprise:backend` - Backend API
- `enterprise:web` - Frontend application
- `postgres:15-alpine` - Database
- `redis:7-alpine` - Cache
- `nginx:alpine` - Reverse proxy

## 🐳 Docker Files

- `docker-compose.yml` - Local development
- `docker-compose.prod.yml` - Production environment
- `nginx.conf` - Nginx configuration
- `.dockerignore` - Build exclusions

## 🚀 Build & Run

### Development

```bash
docker-compose up
```

### Production

```bash
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
```

### Build Specific Service

```bash
docker-compose build backend
docker-compose build web
```

## 📋 Services

### PostgreSQL

- Port: 5432
- Volume: `postgres_data`
- Health check: `pg_isready`

### Redis

- Port: 6379
- Volume: `redis_data`
- Health check: `redis-cli ping`

### Backend API

- Port: 3000
- Build: `backend/Dockerfile`
- Dependencies: postgres, redis

### Web Frontend

- Port: 3001
- Build: `web/Dockerfile`
- Dependencies: backend

### Nginx

- Port: 80, 443
- Config: `nginx.conf`
- SSL: Ready for certificates

## 🔒 Security

- Non-root containers
- Read-only filesystems where possible
- Resource limits set
- Environment variables for secrets
- Health checks configured

## 📊 Monitoring

- Container logs: `docker-compose logs <service>`
- Real-time logs: `docker-compose logs -f`
- Stats: `docker stats`

## 🧹 Cleanup

```bash
# Stop services
docker-compose down

# Remove volumes
docker-compose down -v

# Remove images
docker-compose down --rmi all
```

## 🔧 Troubleshooting

**Port already in use:**

```bash
lsof -i :3000  # Find process
docker-compose down  # Stop containers
```

**Database connection failed:**

```bash
docker-compose logs postgres
docker-compose exec postgres pg_isready
```

**Out of disk space:**

```bash
docker system prune
docker volume prune
```

## 👉 Next Steps

1. Configure environment variables in `.env`
2. Set up SSL certificates in `docker/ssl/`
3. Configure health check thresholds
4. Set resource limits as needed
5. Implement log aggregation
