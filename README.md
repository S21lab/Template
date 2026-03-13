# Full Stack Monorepo Template

A production-ready monorepo template for a full-stack project using Spring Boot, React/Vite, Flutter, PostgreSQL, Redis, and Podman.

## Tech Stack

| Layer      | Technology              |
| ---------- | ----------------------- |
| Backend    | Java 21 + Spring Boot 3 |
| Frontend   | React 18 + Vite 5       |
| Mobile     | Flutter 3 (Dart)        |
| Database   | PostgreSQL 16           |
| Cache      | Redis 7                 |
| Containers | Podman                  |

## Repository Structure

```
├── backend/
│   └── java-spring-api/        # Spring Boot REST API
├── frontend/
│   └── react-app/              # React + Vite application
├── mobile/
│   └── flutter-app/            # Flutter mobile app
├── database/
│   ├── postgres/               # PostgreSQL init scripts & schema
│   └── redis/                  # Redis configuration + Containerfile
├── containers/
│   ├── podman-compose.yaml     # Service orchestration
│   └── .env.example            # Environment variable template
├── docs/                       # Architecture & process documentation
├── .github/workflows/          # CI/CD pipelines
└── scripts/                    # Developer utility scripts
```

## Prerequisites

- [Podman](https://podman.io/) >= 4.0
- [podman-compose](https://github.com/containers/podman-compose) >= 1.0
- JDK 21 (for local backend development)
- Node.js >= 20 (for local frontend development)
- Flutter >= 3.0 (for mobile development)
- Maven 3.9+ (for backend builds)

## Quick Start

### 1. Clone and configure

```bash
git clone <repository-url>
cd <repository>
```

Copy and edit the environment file:

```bash
cp containers/.env.example containers/.env
# Open containers/.env and fill in your secrets
```

### 2. Start all services with Podman

```bash
./scripts/dev-start.sh
```

Or manually:

```bash
cd containers
podman-compose up -d
```

### 3. Access services

| Service    | URL                                 |
| ---------- | ----------------------------------- |
| Backend    | http://localhost:8080/api/v1        |
| Health     | http://localhost:8080/api/v1/health |
| Frontend   | http://localhost:3000               |
| PostgreSQL | localhost:5432                      |
| Redis      | localhost:6379                      |

## Local Development (without containers)

### Backend

```bash
cd backend/java-spring-api
cp .env.example .env
# Start PostgreSQL and Redis locally or point to running containers
mvn spring-boot:run
```

### Frontend

```bash
cd frontend/react-app
cp .env.example .env.local
npm install
npm run dev
```

### Mobile

```bash
cd mobile/flutter-app
cp .env.example .env
flutter pub get
flutter run
```

## Scripts

| Script                 | Description                                 |
| ---------------------- | ------------------------------------------- |
| `scripts/dev-start.sh` | Start the full stack with podman-compose    |
| `scripts/build-all.sh` | Build backend, frontend, and all containers |
| `scripts/lint-all.sh`  | Run all linters                             |

Make scripts executable if needed:

```bash
chmod +x scripts/*.sh
```

## CI/CD

GitHub Actions workflows in [.github/workflows/](.github/workflows/):

- **CI** — Runs on every push and pull request: builds, lints, tests, validates containers
- **CD** — Runs on `main` branch: builds and archives release container images

### Required GitHub Secrets

| Secret                | Description                                        |
| --------------------- | -------------------------------------------------- |
| `DISCORD_WEBHOOK_URL` | Discord channel webhook for pipeline notifications |

## Documentation

| Document                               | Description                        |
| -------------------------------------- | ---------------------------------- |
| [Architecture](./docs/architecture.md) | System design & data flow          |
| [Versioning](./docs/versioning.md)     | Semantic versioning & release flow |
| [Security](./docs/security.md)         | Secrets, auth model, isolation     |
| [Deployment](./docs/deployment.md)     | Podman deployment guide            |
| [Testing](./docs/testing.md)           | Testing strategies per layer       |
| [Formatting](./docs/formatting.md)     | Code style & linting rules         |
| [Contributing](./docs/contributing.md) | Branch strategy & PR guidelines    |
