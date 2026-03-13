# Versioning

## Semantic Versioning

This project follows [Semantic Versioning 2.0.0](https://semver.org/): `MAJOR.MINOR.PATCH`.

| Segment | When to increment                                 |
| ------- | ------------------------------------------------- |
| MAJOR   | Breaking changes to public APIs or data contracts |
| MINOR   | New backward-compatible features                  |
| PATCH   | Backward-compatible bug fixes                     |

Current version is tracked in:

| Component | File                                            |
| --------- | ----------------------------------------------- |
| Backend   | `backend/java-spring-api/pom.xml` → `<version>` |
| Frontend  | `frontend/react-app/package.json` → `"version"` |
| Mobile    | `mobile/flutter-app/pubspec.yaml` → `version`   |

All three must be kept in sync for a release.

---

## Branch Strategy

| Branch           | Purpose                                   |
| ---------------- | ----------------------------------------- |
| `main`           | Production-ready; protected; triggers CD  |
| `develop`        | Integration branch for completed features |
| `feature/<name>` | Individual feature development            |
| `fix/<name>`     | Bug fixes                                 |
| `release/<ver>`  | Release preparation; bump versions here   |

---

## Release Process

1. **Create a release branch** from `develop`:

   ```bash
   git checkout -b release/1.2.0 develop
   ```

2. **Bump versions** in `pom.xml`, `package.json`, and `pubspec.yaml`.

3. **Run the full test suite**:

   ```bash
   ./scripts/build-all.sh
   ```

4. **Merge into `main`** via Pull Request (requires review approval).

5. **Tag the release** on `main`:

   ```bash
   git tag -a v1.2.0 -m "Release 1.2.0"
   git push origin v1.2.0
   ```

6. **Merge `main` back into `develop`** to carry forward the version bump.

---

## Pre-release Identifiers

Use `-alpha`, `-beta`, or `-rc.N` suffixes for pre-releases:

```
1.2.0-alpha.1
1.2.0-beta.2
1.2.0-rc.1
```
