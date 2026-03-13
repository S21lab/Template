# Testing

## Backend — Java / Spring Boot

### Running tests

```bash
cd backend/java-spring-api
mvn test
```

### Test configuration

Tests run against an **in-memory H2 database** (PostgreSQL-compatibility mode) with Redis auto-configuration disabled. Settings are in `src/test/resources/application-test.yml`.

The `@ActiveProfiles("test")` annotation on test classes activates this profile automatically.

### Adding new tests

Place unit tests under `src/test/java/com/template/api/`. Use:

| Annotation        | Purpose                               |
| ----------------- | ------------------------------------- |
| `@SpringBootTest` | Full context load (integration tests) |
| `@WebMvcTest`     | Controller-only slice (fast)          |
| `@DataJpaTest`    | JPA/repository slice                  |
| `@MockBean`       | Replace a bean with a Mockito mock    |

Example unit test for `JwtService`:

```java
@SpringBootTest
@ActiveProfiles("test")
class JwtServiceTest {

    @Autowired
    private JwtService jwtService;

    @Test
    void tokenRoundTrip() {
        String token = jwtService.generateToken("alice");
        assertTrue(jwtService.isTokenValid(token));
        assertEquals("alice", jwtService.extractUsername(token));
    }
}
```

### CI integration

The **unit-tests** job in `.github/workflows/ci.yml` runs `mvn test` on every push. Test reports are uploaded as workflow artifacts.

---

## Frontend — React / Vite

### Recommended test stack

Add [Vitest](https://vitest.dev/) and [React Testing Library](https://testing-library.com/docs/react-testing-library/intro/):

```bash
npm install -D vitest @testing-library/react @testing-library/jest-dom jsdom
```

Update `vite.config.js`:

```js
export default defineConfig({
  // ...
  test: {
    environment: "jsdom",
    globals: true,
    setupFiles: "./src/test/setup.js",
  },
});
```

Run tests:

```bash
npm test
```

### Example component test

```jsx
import { render, screen } from "@testing-library/react";
import Dashboard from "../pages/Dashboard";

test("renders Dashboard heading", () => {
  render(<Dashboard />);
  expect(screen.getByText("Dashboard")).toBeInTheDocument();
});
```

---

## Mobile — Flutter

### Running tests

```bash
cd mobile/flutter-app
flutter test
```

### Test location

Place tests in `test/`. Flutter separates:

| Type                | Location            | Command                          |
| ------------------- | ------------------- | -------------------------------- |
| Unit / widget tests | `test/`             | `flutter test`                   |
| Integration tests   | `integration_test/` | `flutter test integration_test/` |

### Example widget test

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
    testWidgets('LoginScreen renders username field', (tester) async {
        await tester.pumpWidget(
            const MaterialApp(home: LoginScreen()),
        );
        expect(find.widgetWithText(TextFormField, 'Username'), findsOneWidget);
    });
}
```
