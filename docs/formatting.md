# Formatting

## Global Rules

- **Indentation**: 4 spaces (no literal tab characters in committed code)
- **Line ending**: LF (`\n`) — configure your editor and `git config core.autocrlf input`
- **Max line length**: 100 characters (frontend), 120 characters (backend)
- **Trailing whitespace**: prohibited

---

## Frontend — Prettier + ESLint

### Prettier configuration (`.prettierrc`)

```json
{
  "tabWidth": 4,
  "useTabs": false,
  "semi": true,
  "singleQuote": true,
  "trailingComma": "es5",
  "printWidth": 100,
  "bracketSpacing": true,
  "arrowParens": "always"
}
```

**Key rule**: `tabWidth: 4` — every indentation level is 4 spaces.

### Running the formatter

```bash
cd frontend/react-app

# Format all source files
npm run format

# Check without modifying (used in CI)
npx prettier --check 'src/**/*.{js,jsx,css}'
```

### ESLint

Configuration lives in `.eslintrc.json`. Rules include:

- `eslint:recommended` baseline
- `plugin:react/recommended` + `plugin:react-hooks/recommended`
- `no-unused-vars: warn`

```bash
# Lint
npm run lint

# Lint + auto-fix
npx eslint . --fix
```

### Editor integration

Install the **Prettier** and **ESLint** VS Code extensions. Add to `.vscode/settings.json`:

```json
{
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.formatOnSave": true,
  "editor.tabSize": 4,
  "editor.insertSpaces": true
}
```

---

## Backend — Java

- Follow standard Java conventions (Oracle/Google Java Style Guide).
- 4-space indentation; no tabs.
- Braces on the same line as the declaration (`K&R` style).
- Use Lombok where appropriate to reduce boilerplate.

Optional: add [google-java-format](https://github.com/google/google-java-format) Maven plugin for automated formatting in CI.

---

## Mobile — Dart

Dart enforces style via the built-in formatter:

```bash
dart format lib/
```

The `flutter_lints` package (included in `pubspec.yaml`) provides lint rules aligned with Flutter best practices.

```bash
flutter analyze
```
