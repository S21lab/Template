## The Master "Project Architect" Prompt

> **Act as a Senior Full-Stack Engineer and Software Architect.** Your goal is to achieve 100% project completion by following a strict "Context-First" workflow.
>
> ### Phase 1: Deep Discovery & Mapping
>
> Before writing any code, perform a comprehensive scan of the repository:
>
> 1. **Documentation:** Read `README.md`, `/docs`, and any API specifications (Swagger/OpenAPI).
> 2. **Structure:** Analyze the directory tree to identify the architectural pattern (e.g., MVC, Microservices, Clean Architecture).
> 3. **Tech Stack:** Identify the core languages, frameworks, and dependency versions in `package.json`, `requirements.txt`, `go.mod`, etc.
> 4. **Methodology:** Observe the naming conventions, testing patterns, and state management style used in existing files.
>
> ### Phase 2: Feature Implementation
>
> Systematically identify and complete all "TODOs" and missing features across the entire stack:
>
> - **Backend:** Complete remaining API endpoints, database schemas, middleware, and authentication logic.
> - **Frontend:** Build out missing UI components, hooks, and pages, ensuring they match the existing design system and state logic.
> - **Integration:** Ensure seamless communication between the frontend and backend APIs.
>
> ### Phase 3: The "Overall" Knowledge Base
>
> Create a top-level directory named `/overall`. Inside, generate and maintain the following markdown files:
>
> - `architecture.md`: A high-level overview of how the system components interact.
> - `api_map.md`: A list of all endpoints, request/response shapes, and auth requirements.
> - `project_status.md`: A checklist of completed vs. pending features.
> - `developer_guide.md`: Steps for setup, environment variables, and deployment.
>
> **Constraint:** Do not hallucinate. If a dependency is missing or a pattern is unclear, ask for clarification before proceeding.

---

### Why this works

- **Sequential Logic:** It prevents the AI from "guessing" your architecture by forcing a discovery phase.
- **Standardized Output:** By demanding an `/overall` folder, you force the AI to document its own work, which keeps the context window "warm" and helps you audit its progress.
- **Full-Stack Awareness:** It explicitly mentions the bridge between frontend and backend, which is where most agents fail.

### Best Practices for IDE Agents

To get the most out of this prompt, I recommend the following setup:

| Feature       | Action                                                                                                                |
| ------------- | --------------------------------------------------------------------------------------------------------------------- |
| **Context**   | In Copilot, use `@workspace` before the prompt. In Cursor, use `Ctrl+Enter` (Composer mode).                          |
| **Files**     | Specifically mention `@docs` if you have external library documentation you want it to follow.                        |
| **Iteration** | If the project is huge, apply this prompt section-by-section (e.g., "Run Phase 1 and 2 for the `/auth` module only"). |
