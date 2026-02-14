# API Documentation

Complete API reference for the Enterprise Backend.

## 🔗 Base URL

```
Development: http://localhost:3000
Production: https://api.enterprise.com
```

## 🔐 Authentication

### JWT Bearer Token

All authenticated endpoints require:

```bash
Authorization: Bearer <access_token>
```

### Obtaining Token

**Request:**

```bash
POST /api/auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123"
}
```

**Response (200):**

```json
{
  "accessToken": "eyJhbGciOiJIUzI1NiIs...",
  "refreshToken": "eyJhbGciOiJIUzI1NiIs...",
  "expiresIn": 3600
}
```

## 👥 Users Endpoints

### List Users

```bash
GET /api/users
Authorization: Bearer <token>
```

**Response (200):**

```json
{
  "data": [
    {
      "id": "550e8400-e29b-41d4-a716-446655440000",
      "email": "user@example.com",
      "username": "john_doe",
      "firstName": "John",
      "lastName": "Doe",
      "isActive": true,
      "createdAt": "2026-02-15T10:30:00Z"
    }
  ],
  "total": 1,
  "page": 1,
  "pageSize": 20
}
```

### Get User

```bash
GET /api/users/:id
Authorization: Bearer <token>
```

### Create User

```bash
POST /api/users
Authorization: Bearer <token>
Content-Type: application/json

{
  "email": "neuser@example.com",
  "username": "new_user",
  "firstName": "New",
  "lastName": "User",
  "password": "SecurePassword123!"
}
```

### Update User

```bash
PUT /api/users/:id
Authorization: Bearer <token>
Content-Type: application/json

{
  "firstName": "Updated",
  "lastName": "Name"
}
```

### Delete User

```bash
DELETE /api/users/:id
Authorization: Bearer <token>
```

## 🔑 Auth Endpoints

### Register

```bash
POST /api/auth/register
Content-Type: application/json

{
  "email": "user@example.com",
  "username": "username",
  "password": "SecurePassword123!",
  "firstName": "John",
  "lastName": "Doe"
}
```

### Login

```bash
POST /api/auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "SecurePassword123!"
}
```

### Refresh Token

```bash
POST /api/auth/refresh
Content-Type: application/json

{
  "refreshToken": "eyJhbGciOiJIUzI1NiIs..."
}
```

### Logout

```bash
POST /api/auth/logout
Authorization: Bearer <token>
```

## 📊 Health Check

### System Health

```bash
GET /health
```

**Response (200):**

```json
{
  "status": "OK",
  "timestamp": "2026-02-15T10:30:00Z",
  "version": "1.0.0",
  "uptime": 3600
}
```

### API Health

```bash
GET /api/health
```

**Response (200):**

```json
{
  "database": "connected",
  "redis": "connected",
  "timestamp": "2026-02-15T10:30:00Z"
}
```

## 🔄 Status Codes

| Code | Meaning             |
| ---- | ------------------- |
| 200  | Success             |
| 201  | Created             |
| 204  | No Content          |
| 400  | Bad Request         |
| 401  | Unauthorized        |
| 403  | Forbidden           |
| 404  | Not Found           |
| 409  | Conflict            |
| 429  | Too Many Requests   |
| 500  | Server Error        |
| 503  | Service Unavailable |

## ❌ Error Responses

```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid request parameters",
    "details": [
      {
        "field": "email",
        "error": "Invalid email format"
      }
    ]
  }
}
```

## 📝 Rate Limiting

- **Limit:** 1000 requests/hour per IP
- **Header:** `X-RateLimit-Remaining`
- **Response (429):**

```json
{
  "error": "Too many requests. Retry after 60 seconds"
}
```

## 🔍 Pagination

### Query Parameters

- `page` (default: 1)
- `pageSize` (default: 20, max: 100)
- `sort` (field and order: `field:asc` or `field:desc`)

### Example

```bash
GET /api/users?page=2&pageSize=10&sort=createdAt:desc
```

### Response

```json
{
  "data": [...],
  "pagination": {
    "total": 150,
    "page": 2,
    "pageSize": 10,
    "totalPages": 15
  }
}
```

## 🔍 Filtering

### Query Parameters

```bash
GET /api/users?email=test@example.com&isActive=true
```

## 📚 Webhook Events

### Events Supported

- `user.created`
- `user.updated`
- `user.deleted`
- `session.created`
- `session.ended`

### Register Webhook

```bash
POST /api/webhooks
Authorization: Bearer <token>
Content-Type: application/json

{
  "event": "user.created",
  "url": "https://your-domain.com/webhooks/user-created"
}
```

## 🧪 Testing API

### Using cURL

```bash
curl -X GET http://localhost:3000/api/users \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json"
```

### Using Postman

1. Create new request
2. Set Authorization type to Bearer Token
3. Enter token value
4. Send request

### Using Swagger UI

```
http://localhost:3000/api/docs
```

## 📊 API Versioning

Current version: `v1`

Future versions will be at:

- `/api/v2/...`
- `/api/v3/...`

## 🔮 Upcoming Features

- WebSocket real-time updates
- GraphQL endpoint
- Advanced filtering
- Full-text search
- Export to CSV/Excel

## 📞 Support

- Documentation: [Docs](../docs/)
- Issues: [GitHub Issues](https://github.com/your-org/enterprise-template/issues)
- Email: support@enterprise.com

## 🔄 Changelog

See [CHANGELOG.md](../CHANGELOG.md) for API version history.
