# Security Best Practices

Enterprise security guidelines and implementation.

## 🔐 Authentication

### JWT Implementation

- Use HS256 or RS256 algorithm
- Short expiration times (15-30 minutes)
- Refresh tokens for extended sessions
- Secure token storage (httpOnly cookies)

### Password Policy

- Minimum 12 characters
- Complexity requirements
- Hash with bcrypt (rounds: 10+)
- Never log passwords
- Reset expiration: 24 hours

### Example Implementation

```typescript
// Backend - Password hashing
import bcrypt from "bcryptjs";

const hashedPassword = await bcrypt.hash(password, 10);
const isValid = await bcrypt.compare(password, hashedPassword);
```

## 🛡️ Authorization

### Role-Based Access Control (RBAC)

```typescript
// Middleware example
app.use(authMiddleware);
app.use(roleMiddleware(["admin", "manager"]));

app.get("/admin/users", (req, res) => {
  // Only authenticated admins/managers
});
```

### Permission Levels

- Admin: Full system access
- Manager: Team management access
- User: Personal and shared resources
- Guest: Limited public access

## 📡 Transport Security

### HTTPS/TLS

- Use TLS 1.2 or higher
- Valid SSL certificates (not self-signed)
- HSTS headers enabled
- Certificate renewal automation

### Nginx Configuration

```nginx
add_header Strict-Transport-Security "max-age=31536000" always;
ssl_protocols TLSv1.2 TLSv1.3;
ssl_ciphers HIGH:!aNULL:!MD5;
```

## 🔒 Data Protection

### Encryption at Rest

- Database column encryption for sensitive data
- Encrypted backups
- Secure key management

### Encryption in Transit

- All API calls over HTTPS
- WebSocket over WSS
- Certificate pinning on mobile apps

## 🛑 Input Validation

### Client-Side

```typescript
// Form validation
const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
if (!emailRegex.test(email)) {
  throw new Error("Invalid email");
}
```

### Server-Side

```typescript
// Always validate on backend
import { validate } from "class-validator";

const user = new User();
user.email = req.body.email;
const errors = await validate(user);
```

### Common Validations

- Email format and uniqueness
- Password requirements
- UUID format
- Length limits
- Type checking

## 🗑️ Output Encoding

### XSS Prevention

```typescript
// React automatically escapes by default
<div>{userInput}</div>  // Safe

// But be careful with:
<div dangerouslySetInnerHTML={{__html: userInput}} />  // Dangerous
```

### HTML Escaping

```typescript
import sanitizeHtml from "sanitize-html";

const safe = sanitizeHtml(userInput, {
  allowedTags: ["b", "i", "em", "strong"],
  allowedAttributes: {},
});
```

## 💉 SQL Injection Prevention

### ✅ Correct (Parameterized Queries)

```typescript
// Using TypeORM (safe)
const user = await User.findBy({ email });

// Using raw SQL (parameterized)
const result = db.query("SELECT * FROM users WHERE email = $1", [email]);
```

### ❌ Incorrect (String interpolation)

```typescript
// NEVER do this!
const result = db.query(`SELECT * FROM users WHERE email = '${email}'`);
```

## 🚨 Error Handling

### Safe Error Messages

```typescript
// ✅ Safe
return res.status(404).json({ error: "Resource not found" });

// ❌ Unsafe - leaks information
return res.status(500).json({
  error: "Connection to database failed at 192.168.1.1:5432",
});
```

### Logging

- Never log sensitive data (passwords, tokens, SSNs)
- Log security events
- Include timestamp and user context
- Centralize logs

## 🔄 CORS Configuration

```typescript
import cors from "cors";

app.use(
  cors({
    origin: process.env.ALLOWED_ORIGINS?.split(","),
    credentials: true,
    methods: ["GET", "POST", "PUT", "DELETE"],
    allowedHeaders: ["Content-Type", "Authorization"],
  }),
);
```

## ⏱️ Rate Limiting

```typescript
import rateLimit from "express-rate-limit";

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100, // Limit each IP to 100 requests per windowMs
  message: "Too many requests",
});

app.use("/api/", limiter);
```

## 🔐 Secrets Management

### Never Hardcode Secrets

```typescript
// ❌ Bad
const API_KEY = "sk_live_abc123";

// ✅ Good
const API_KEY = process.env.STRIPE_API_KEY;
```

### Storing Secrets

- Use environment variables
- Docker secrets
- AWS Secrets Manager
- HashiCorp Vault
- Never commit to Git

## 📋 Security Headers

```typescript
import helmet from "helmet";

app.use(helmet());

// Manually configured
app.use((req, res, next) => {
  res.setHeader("X-Content-Type-Options", "nosniff");
  res.setHeader("X-Frame-Options", "DENY");
  res.setHeader("X-XSS-Protection", "1; mode=block");
  res.setHeader("Referrer-Policy", "strict-origin-when-cross-origin");
  next();
});
```

## 🧪 Security Testing

### Regular Tasks

- [ ] Code review for security issues
- [ ] Dependency vulnerability scan (npm audit)
- [ ] Penetration testing quarterly
- [ ] Security awareness training
- [ ] Incident response drills

### Tools

- npm audit
- OWASP ZAP
- Burp Suite
- SonarQube
- Snyk

## 📊 Security Monitoring

- Monitor failed login attempts
- Track privilege escalation
- Alert on unusual API usage
- Monitor database access
- Track file changes

## 🚨 Incident Response

1. **Detect**: Alert triggered
2. **Assess**: Determine severity
3. **Contain**: Limit damage
4. **Eradicate**: Remove threat
5. **Recover**: Restore systems
6. **Review**: Post-incident analysis

## 🔄 Regular Updates

- Update dependencies monthly
- Update Node.js
- Update system packages
- Update Docker images
- Review and rotate credentials

## 📚 Security Resources

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [Node.js Security](https://nodejs.org/en/docs/guides/security/)
- [Express.js Best Practices](https://expressjs.com/en/advanced/best-practice-security.html)
- [MDN Web Security](https://developer.mozilla.org/en-US/docs/Web/Security)
