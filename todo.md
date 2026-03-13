Create a production-ready **monorepo template** for a full stack project with the following architecture.

## Tech Stack

Backend: Java (Spring Boot)
Frontend: JavaScript (React + Vite)
Mobile: Flutter (Dart)
Databases: PostgreSQL and Redis
Containerization: Podman (not Docker)

Each component must be **isolated in its own folder and container** to support independent development and deployment.

## Repository Structure

The repository must follow this structure:

/backend
 /java-spring-api

/frontend
 /react-app

/mobile
 /flutter-app

/database
 /postgres
 redis

/containers
 podman-compose.yaml
 container build files for each service

/docs
 architecture.md
 versioning.md
 security.md
 deployment.md
 testing.md
 formatting.md
 contributing.md

/.github
 /workflows
  ci.yml
  cd.yml

/scripts
 dev-start.sh
 build-all.sh
 lint-all.sh

## Backend Requirements

Java Spring Boot REST API.

Features:

- API versioning (/api/v1)
- environment configuration
- Redis caching
- PostgreSQL persistence
- health endpoint
- basic JWT authentication structure
- modular service/controller/repository architecture

Include:

- Maven build
- unit test setup
- environment config template (.env.example)

## Frontend Requirements

React + Vite application.

Features:

- API service layer for backend communication
- environment variable support
- ESLint + Prettier formatting
- component folder structure
- authentication token storage
- basic dashboard page

Formatting rule:
Prettier configured so **1 tab equals 4 spaces**.

## Mobile Requirements

Flutter application.

Features:

- API client service for backend
- login screen
- basic home screen
- environment configuration
- clean architecture separation (data / domain / presentation)

## Database Layer

Provide containerized services:

PostgreSQL container:

- initialization script
- schema folder

Redis container:

- default configuration
- persistence enabled

Databases should be designed so additional project-specific database containers can be added later.

## Containerization

Use **Podman** instead of Docker.

Each service must include its own containerfile.

Provide:

- podman-compose.yaml
- network configuration
- environment variable injection
- internal service discovery between containers

Services must communicate through:

- REST API
- Redis cache
- PostgreSQL connection

## CI/CD

Implement GitHub Actions workflows:

CI workflow:

- build backend
- lint frontend
- run unit tests
- build containers
- validate podman-compose configuration

CD workflow:

- triggered on main branch
- build containers
- prepare artifacts

Both workflows must send **success or failure notifications to a private Discord server channel** using a Discord webhook.

## Documentation

Inside the /docs folder include markdown documents covering:

architecture.md

- high level system design
- container communication
- data flow diagram

versioning.md

- semantic versioning strategy
- release process

security.md

- secrets management
- authentication model
- container isolation
- dependency scanning

deployment.md

- Podman deployment guide
- environment variables
- scaling notes

testing.md

- backend unit tests
- frontend testing
- mobile testing

formatting.md

- Prettier rules
- indentation: 1 tab = 4 spaces
- linting

contributing.md

- branch strategy
- pull request guidelines
- commit message style

## Additional Requirements

- clean monorepo architecture
- modular design
- ready for enterprise scaling
- minimal but functional starter code for each component
- clear README explaining how to start the development environment with Podman
