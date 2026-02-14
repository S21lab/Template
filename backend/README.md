# Backend API Service

Enterprise-grade backend API built with Express.js, TypeScript, and TypeORM.

## 🔧 Tech Stack

- **Runtime**: Node.js
- **Framework**: Express.js
- **Language**: TypeScript
- **ORM**: TypeORM
- **Database**: PostgreSQL
- **Cache**: Redis
- **Authentication**: JWT
- **Validation**: Class-validator
- **Testing**: Jest
- **Logging**: Winston

## 📋 Project Structure

```
backend/
├── src/
│   ├── controllers/      # Route controllers
│   ├── services/         # Business logic
│   ├── models/           # Entity models (TypeORM)
│   ├── middlewares/      # Express middlewares
│   ├── utils/            # Utility functions
│   ├── types/            # TypeScript types
│   ├── config/           # Configuration
│   ├── database/
│   │   ├── migrations/   # DB migrations
│   │   ├── seeds/        # Seed data
│   │   └── data-source.ts # ORM config
│   ├── routes/           # API routes
│   ├── main.ts           # Entry point
│   └── app.ts            # Express app setup
├── dist/                 # Compiled output
├── Dockerfile            # Docker config
├── tsconfig.json         # TypeScript config
└── package.json          # Dependencies
```

## 🚀 Getting Started

### Prerequisites

- Node.js 18+
- PostgreSQL
- Redis (optional, for caching)

### Installation

```bash
cd backend
npm install
```

### Environment Setup

Create `.env`:

```env
NODE_ENV=development
PORT=3000
DB_HOST=localhost
DB_PORT=5432
DB_NAME=enterprise_db
DB_USER=postgres
DB_PASSWORD=postgres_password
JWT_SECRET=your_jwt_secret
REDIS_HOST=localhost
REDIS_PORT=6379
```

### Development

```bash
npm run dev
```

### Build

```bash
npm run build
npm start
```

## 📦 Available Scripts

```bash
# Development
npm run dev              # Start with hot reload
npm run build            # Compile TypeScript
npm start                # Run compiled app

# Quality
npm run lint             # Run ESLint
npm run format           # Format with Prettier
npm run test             # Run tests
npm run test:watch       # Watch mode
npm run test:coverage    # Coverage report

# Database
npm run migrate          # Run migrations
npm run migrate:create   # Create new migration
npm run seed             # Run seeds
```

## 🔐 API Security

- JWT authentication
- CORS configured
- Helmet for security headers
- Rate limiting
- Input validation with class-validator
- SQL injection prevention (TypeORM parameterized queries)
- Environment variable protection

## 📚 API Documentation

API documentation is available at:

- `GET /api/docs` - Swagger/OpenAPI documentation
- `GET /api/health` - Health check endpoint

## 🧪 Testing

```bash
npm run test              # Run all tests
npm run test:watch       # Watch mode
npm run test:coverage    # Generate coverage
```

## 🗄️ Database

### Migrations

Create a new migration:

```bash
npm run migrate:create -- -n CreateUsersTable
```

Run migrations:

```bash
npm run migrate
```

### Seeds

```bash
npm run seed
```

## 📊 Logging

Logs are written to:

- Console (development)
- `logs/` directory (production)

Winston is configured for structured logging.

## 🐳 Docker

Build and run:

```bash
docker build -t enterprise-backend .
docker run -p 3000:3000 --env-file .env enterprise-backend
```

## 🤝 Contributing

- Follow ESLint rules
- Maintain TypeScript strict mode
- Write tests for new features
- Run `npm run format` before committing

## 📝 Code Style

- Use absolute imports with `@/` prefix
- Follow SOLID principles
- Consistent error handling
- Centralized logging

## 🆘 Troubleshooting

**Database connection failed:**

- Check `DB_HOST`, `DB_PORT`, `DB_NAME`
- Ensure PostgreSQL is running

**JWT errors:**

- Verify `JWT_SECRET` is set
- Check token expiration

See [docs/TROUBLESHOOTING.md](../docs/TROUBLESHOOTING.md) for more.

## 📚 Resources

- [Express.js](https://expressjs.com)
- [TypeORM](https://typeorm.io)
- [TypeScript](https://www.typescriptlang.org)
- [JWT](https://jwt.io)
