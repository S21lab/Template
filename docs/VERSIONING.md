# 🚀 [PROJECT_NAME] - Versioning & Release Strategy

### Standard Operating Procedure (SOP) | S21lab

This document defines the mandatory version control, branching strategy, and release management protocols for all **S21lab** engineering teams.

---

## 🔢 Semantic Versioning (SemVer)

We follow [Semantic Versioning 2.0.0](https://semver.org/).

**Format:** `MAJOR.MINOR.PATCH`

| Level     | Increment | Trigger                                                               |
| --------- | --------- | --------------------------------------------------------------------- |
| **MAJOR** | `1.0.0`   | Breaking changes, incompatible API updates, or complete UI overhauls. |
| **MINOR** | `0.1.0`   | New features or significant enhancements (backward compatible).       |
| **PATCH** | `0.0.1`   | Bug fixes, security patches, or documentation updates.                |

---

## 🌳 Branching Strategy (S21lab Git Flow)

Our workflow is based on Git Flow to ensure production stability.

### 1. Persistent Branches

- **`main`**: The "Source of Truth." Contains production-ready code only. **Protected.**
- **`develop`**: The integration branch. All features are merged here for testing. **Protected.**

### 2. Supporting Branches

- **`feature/[description]`**: Branched from `develop`. For new functionality.
- **`bugfix/[description]`**: Branched from `develop`. For non-critical fixes found during dev.
- **`release/v[version]`**: Branched from `develop` when preparing for a production push.
- **`hotfix/v[version]`**: Branched from `main`. For critical production bugs requiring immediate deployment.

---

## 📝 Commit Convention

S21lab uses **Conventional Commits**. This allows for automated changelog generation.

**Format:** `<type>(<scope>): <subject>`

| Type       | Description                                                         |
| ---------- | ------------------------------------------------------------------- |
| `feat`     | A new feature for the user.                                         |
| `fix`      | A bug fix.                                                          |
| `docs`     | Documentation only changes.                                         |
| `style`    | Formatting, missing semi-colons, etc; no code change.               |
| `refactor` | Refactoring production code (e.g. renaming a variable).             |
| `chore`    | Updating grunt tasks, dependencies, etc; no production code change. |

**Example:** `feat(api): add jwt token rotation`

---

## 🚀 Release Process (Step-by-Step)

### Phase 1: Preparation

1. Ensure `develop` is stable and all tests pass.
2. Create release branch: `git checkout -b release/v1.x.x develop`.
3. **Bump Versions:** Update `package.json` or equivalent manifest files.
4. **Update `CHANGELOG.md`:** Move items from `[Unreleased]` to the new version block.

### Phase 2: Deployment

1. **Merge to `main**`:

```bash
git checkout main
git merge --no-ff release/v1.x.x
git tag -a v1.x.x -m "S21lab Release v1.x.x"
git push origin main --tags

```

2. **Sync `develop**`:

```bash
git checkout develop
git merge --no-ff release/v1.x.x
git push origin develop

```

### Phase 3: Cleanup

1. Delete the `release/v1.x.x` branch.
2. Verify the CI/CD pipeline triggered the build for the new tag.

---

## 🐳 Docker Versioning

All images built for S21lab must be tagged accordingly:

- **Production**: `s21lab/[project-name]:1.2.3` (Matches SemVer tag)
- **Latest Stable**: `s21lab/[project-name]:latest` (Points to latest `main` commit)
- **Development**: `s21lab/[project-name]:develop` (Points to latest `develop` commit)

---

## 🛠️ Automation & Linting

To maintain these standards, projects must include:

- **Husky**: For pre-commit hooks.
- **Commitlint**: To enforce the commit convention.
- **Standard-Version**: For automatic SemVer bumping and changelog updates.

---

**Last Updated:** February 2026
**Owner:** S21lab Team
