# Deployment

## Prerequisites

- Podman >= 4.0
- podman-compose >= 1.0 (`pip install podman-compose`)
- A Linux host (RHEL, Fedora, Ubuntu, etc.) or macOS with Podman Desktop

---

## Environment Variables

Copy and fill in the environment file before starting:

```bash
cp containers/.env.example containers/.env
```

| Variable            | Default                        | Description                       |
| ------------------- | ------------------------------ | --------------------------------- |
| `POSTGRES_DB`       | `appdb`                        | PostgreSQL database name          |
| `POSTGRES_USER`     | `postgres`                     | PostgreSQL username               |
| `POSTGRES_PASSWORD` | _(required)_                   | PostgreSQL password               |
| `POSTGRES_PORT`     | `5432`                         | Host port for PostgreSQL          |
| `REDIS_PORT`        | `6379`                         | Host port for Redis               |
| `REDIS_PASSWORD`    | _(empty)_                      | Redis AUTH password (optional)    |
| `JWT_SECRET`        | _(required)_                   | HMAC signing secret (≥ 256-bit)   |
| `JWT_EXPIRATION_MS` | `86400000`                     | Token lifetime in ms (24 h)       |
| `BACKEND_PORT`      | `8080`                         | Host port for the backend API     |
| `FRONTEND_PORT`     | `3000`                         | Host port for the frontend        |
| `VITE_API_BASE_URL` | `http://localhost:8080/api/v1` | API URL baked into frontend build |

---

## Starting the Stack

```bash
cd containers
podman-compose up -d
```

Check service status:

```bash
podman-compose ps
```

View logs:

```bash
podman-compose logs -f backend
```

Stop the stack:

```bash
podman-compose down
```

Stop and remove volumes (⚠ deletes data):

```bash
podman-compose down -v
```

---

## Building Individual Images

```bash
# Backend
podman build -t app-backend:latest backend/java-spring-api

# Frontend
podman build \
  --build-arg VITE_API_BASE_URL=https://api.example.com/api/v1 \
  -t app-frontend:latest \
  frontend/react-app

# Redis
podman build -t app-redis:latest database/redis
```

---

## Production Recommendations

1. **TLS termination** — Place a reverse proxy (e.g., nginx, Caddy, Traefik) in front that handles HTTPS. Never expose the backend or database directly on 80/443.
2. **Separate network segments** — Keep PostgreSQL and Redis on an internal-only network; expose only `frontend` and `backend`.
3. **Non-root processes** — All images already run as non-root (`appuser`/`redis`/`nginx`).
4. **Health checks** — PostgreSQL and Redis include health checks. Add liveness and readiness probes if deploying to Kubernetes.
5. **Persistent data** — Named volumes (`postgres-data`, `redis-data`) persist data across restarts. Back them up regularly.

---

## Scaling Notes

- **Backend**: Stateless by design (JWT). Scale horizontally by running multiple backend container replicas behind a load balancer. Ensure all replicas share the same `JWT_SECRET` and connect to the same PostgreSQL and Redis instances.
- **Frontend**: Stateless (static assets). Scale with any CDN or multiple nginx replicas.
- **PostgreSQL**: Use read replicas for read-heavy workloads. Consider PgBouncer as a connection pooler when the replica count grows.
- **Redis**: For high-availability caching, switch to Redis Sentinel or Redis Cluster. Update `spring.data.redis.*` configuration accordingly.
