# Security

## Secrets Management

### Rules

- **Never commit secrets** to version control. All sensitive values live in `.env` files which are listed in `.gitignore`.
- Use `.env.example` files (committed) as templates with placeholder values only.
- Rotate all secrets before going to production.
- Store production secrets in a secrets manager (e.g., HashiCorp Vault, AWS Secrets Manager) and inject them at runtime via environment variables.

### Required secrets

| Variable              | Description                            | Where used        |
| --------------------- | -------------------------------------- | ----------------- |
| `POSTGRES_PASSWORD`   | PostgreSQL superuser password          | `containers/.env` |
| `REDIS_PASSWORD`      | Redis AUTH password (optional)         | `containers/.env` |
| `JWT_SECRET`          | HMAC-SHA256 signing secret (≥ 256 bit) | `containers/.env` |
| `DISCORD_WEBHOOK_URL` | CI/CD Discord notifications            | GitHub Secrets    |

Generate a strong JWT secret:

```bash
openssl rand -base64 64
```

---

## Authentication Model

- **Mechanism**: Stateless JWT (HS256) via the `Authorization: Bearer <token>` header.
- Tokens are short-lived (`JWT_EXPIRATION_MS`, default 24 h). Reduce for sensitive environments.
- Passwords are hashed with **BCrypt** (cost factor 10) before storage — plain-text passwords are never persisted.
- The `admin` seed account password **must be changed** immediately after first deployment.

### Recommended hardening

- Add a refresh-token endpoint with server-side revocation for long-lived sessions.
- Enforce HTTPS in production so tokens are never transmitted in plain text.
- Add rate-limiting to `/api/v1/auth/login` to prevent brute-force attacks.

---

## Container Isolation

- Each service runs in its own container with a dedicated process user (`appuser` in the backend image).
- Containers are connected only through `app-network` (bridge). No host-network access.
- In production, expose only the frontend and backend through a TLS-terminating reverse proxy; keep PostgreSQL and Redis on an internal-only network segment.
- Use read-only volume mounts for configuration files where possible.

---

## Dependency Scanning

### Backend (Java/Maven)

```bash
# OWASP Dependency-Check
mvn org.owasp:dependency-check-maven:check

# Or via Trivy container scan
trivy image app-backend:latest
```

### Frontend (Node)

```bash
npm audit --audit-level=moderate
```

### Containers

```bash
trivy image app-backend:latest
trivy image app-frontend:latest
trivy image app-redis:latest
```

Integrate one of these scans into the CI workflow for automatic detection of known CVEs.
