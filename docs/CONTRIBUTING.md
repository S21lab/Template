# Contributing Guidelines

How to contribute to the Enterprise Template project.

## 🤝 Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/your-username/enterprise-template.git`
3. Add upstream: `git remote add upstream https://github.com/original/enterprise-template.git`
4. Create feature branch: `git checkout -b feature/your-feature`

## 📝 Code Style

### TypeScript

- Use strict mode
- Define types explicitly
- Use absolute imports (`@/` prefix)
- Follow naming conventions

### Naming Conventions

- Files: `kebab-case.ts`
- Classes: `PascalCase`
- Functions: `camelCase`
- Constants: `UPPER_SNAKE_CASE`
- Variables: `camelCase`

### Example

```typescript
// utils/auth-service.ts
export class AuthService {
  private readonly JWT_EXPIRATION = "7d";

  async authenticateUser(credentials: LoginCredentials): Promise<Token> {
    // Implementation
  }
}
```

## ✅ Before Submitting PR

```bash
# Format code
npm run format

# Run linter
npm run lint

# Run tests
npm run test

# Build
npm run build

# Type check
npm run type-check
```

## 📋 Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
feat: Add user authentication
fix: Resolve database connection timeout
docs: Update API documentation
style: Format code with prettier
refactor: Reorganize auth module
test: Add unit tests for auth service
chore: Update dependencies
```

Examples:

```bash
git commit -m "feat: Add two-factor authentication"
git commit -m "fix: Resolve JWT token validation bug"
git commit -m "docs: Add API endpoint documentation"
```

## 🔀 Pull Request Process

1. Create descriptive PR title
2. Fill out PR template
3. Reference related issues
4. Ensure tests pass
5. Request reviews
6. Address feedback
7. Squash commits before merge

### PR Template

```markdown
## Description

Brief description of changes

## Type of Change

- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation

## Related Issues

Fixes #123

## Testing

- [ ] Unit tests added
- [ ] Integration tests added
- [ ] Manual testing completed

## Screenshots

(if applicable)
```

## 🧪 Testing Requirements

- [ ] Unit tests for new functions
- [ ] Integration tests for APIs
- [ ] At least 80% code coverage
- [ ] All tests passing
- [ ] No console errors

### Example Test

```typescript
describe("AuthService", () => {
  it("should authenticate valid credentials", async () => {
    const credentials = { email: "test@example.com", password: "password123" };
    const result = await authService.authenticate(credentials);
    expect(result.token).toBeDefined();
  });
});
```

## 📚 Documentation

Update documentation for:

- New features
- API endpoint changes
- Configuration changes
- Setup procedures
- Breaking changes

## 🔐 Security

- Never commit secrets
- Run security checks locally
- Report vulnerabilities privately
- Follow security best practices

## 🐛 Reporting Bugs

### Include:

- OS and version
- Node.js version
- Steps to reproduce
- Expected behavior
- Actual behavior
- Screenshots/logs

### Format:

```markdown
**Describe the bug:**
Clear description

**To reproduce:**

1. Step 1
2. Step 2

**Expected behavior:**
What should happen

**Actual behavior:**
What actually happens

**Logs:**
Error logs/stack trace
```

## 💡 Feature Requests

### Include:

- Clear use case
- Example implementation
- Potential impact
- Any breaking changes

### Format:

```markdown
**Use case:**
Why this feature is needed

**Implementation:**
How it might work

**Examples:**
Usage examples

**Impact:**
Potential breaking changes
```

## 🎯 Development Workflow

### Local Development

```bash
# Install dependencies
./scripts/install-all.sh

# Start services
./scripts/dev-all.sh

# Make changes

# Test changes
npm run test

# Format code
npm run format

# Commit
git commit -m "feat: Your feature"

# Push
git push origin feature/your-feature

# Create PR on GitHub
```

### Branch Naming

- Features: `feature/description`
- Bug fixes: `fix/description`
- Documentation: `docs/description`
- Hotfixes: `hotfix/description`

Example:

```bash
git checkout -b feature/add-oauth-integration
git checkout -b fix/database-migration-issue
git checkout -b docs/update-deployment-guide
```

## 🚀 Release Process

Releases follow [Semantic Versioning](https://semver.org/):

- Major: Breaking changes (v1.0.0)
- Minor: New features (v1.1.0)
- Patch: Bug fixes (v1.1.1)

```bash
# Version bump
git tag -a v1.1.0 -m "Release v1.1.0"
git push origin v1.1.0
```

## 💬 Communication

- Discuss major changes first in issues
- Ask for help in discussions
- Be respectful and constructive
- Welcome diverse perspectives

## 📚 Resources

- [Git workflow tutorial](https://guides.github.com/introduction/flow/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)
- [Code of Conduct](CODE_OF_CONDUCT.md)

## 🙏 Thank You!

Your contributions help make this template better for everyone!
