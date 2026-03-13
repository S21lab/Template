# Contributing

## Branch Strategy

| Branch pattern      | Purpose                                                    |
| ------------------- | ---------------------------------------------------------- |
| `main`              | Production-ready; protected; requires PR + review          |
| `develop`           | Ongoing integration; base branch for features              |
| `feature/<name>`    | New features — branch from `develop`                       |
| `fix/<name>`        | Bug fixes — branch from `develop` (or `main` for hotfixes) |
| `release/<version>` | Release prep — branch from `develop`                       |
| `hotfix/<name>`     | Urgent production fixes — branch from `main`               |

Branch names use `kebab-case`. Example: `feature/jwt-refresh-token`.

---

## Commit Message Style

Follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```
<type>(<scope>): <short description>

[optional body]

[optional footer(s)]
```

### Types

| Type       | When to use                                             |
| ---------- | ------------------------------------------------------- |
| `feat`     | A new feature                                           |
| `fix`      | A bug fix                                               |
| `docs`     | Documentation changes only                              |
| `style`    | Formatting, missing semicolons, etc. (no logic)         |
| `refactor` | Code change that neither fixes a bug nor adds a feature |
| `test`     | Adding or correcting tests                              |
| `chore`    | Maintenance tasks (deps, CI config, etc.)               |
| `perf`     | Performance improvement                                 |

### Examples

```
feat(backend): add refresh-token endpoint
fix(frontend): prevent double-submit on login form
docs(deployment): add Redis Cluster scaling notes
chore(deps): bump Spring Boot to 3.2.4
```

Keep the short description under 72 characters. Write in the **imperative mood** ("add", "fix", "update" — not "added" or "adds").

---

## Pull Request Guidelines

1. **One concern per PR** — don't mix unrelated changes.
2. **Branch from `develop`** unless it's a hotfix targeting `main`.
3. **Keep PRs small** — aim for < 400 lines changed; split larger work into stacked PRs.
4. **Write a clear description** covering:
   - What changed and why
   - How to test it manually
   - Screenshots / recordings for UI changes
5. **All CI checks must pass** before requesting review.
6. **Resolve all review comments** before merging; avoid force-pushing during review.
7. **Squash on merge** to keep `main`/`develop` history clean.

### PR title format

```
<type>(<scope>): <description>
```

Example: `feat(mobile): add biometric login support`

---

## Development Setup

See the root [README](../README.md) for setup instructions.

Run tests before opening a PR:

```bash
# Backend
cd backend/java-spring-api && mvn test

# Frontend lint
./scripts/lint-all.sh
```
