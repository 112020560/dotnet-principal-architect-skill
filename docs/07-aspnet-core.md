
# ASP.NET Core Rules

> *ASP.NET Core is a hosting and delivery framework. Business decisions belong elsewhere.*

---

# Purpose

This document defines engineering rules for building ASP.NET Core applications.

The goal is to promote maintainable, observable, secure and scalable APIs while avoiding framework-driven architecture.

---

# ASP.NET Core Principles

- Keep the framework at the edges.
- Respect HTTP semantics.
- Prefer explicit behavior over implicit magic.
- Choose features based on context.
- Favor maintainability over novelty.

---

# Rule API-001 — Choose the API Style Based on Service Characteristics

**Severity:** High

Do not recommend Controllers or Minimal APIs as a universal standard.

Choose according to the service.

## Decision Matrix

| Scenario | Minimal APIs | Controllers |
|----------|:------------:|:-----------:|
| Small internal service | ⭐⭐⭐⭐⭐ | ⭐⭐⭐☆☆ |
| Simple CRUD | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐☆ |
| Enterprise API | ⭐⭐☆☆☆ | ⭐⭐⭐⭐⭐ |
| Complex versioning | ⭐⭐☆☆☆ | ⭐⭐⭐⭐⭐ |
| Extensive filters | ⭐⭐☆☆☆ | ⭐⭐⭐⭐⭐ |
| Rapid prototyping | ⭐⭐⭐⭐⭐ | ⭐⭐⭐☆☆ |
| Large development team | ⭐⭐⭐☆☆ | ⭐⭐⭐⭐⭐ |

### Engineering Note

Both approaches execute on the same ASP.NET Core pipeline.

Performance differences are usually negligible.

Choose based on maintainability, complexity, and team experience.

---

# Rule API-002 — Controllers and Endpoints Must Stay Thin

Controllers and Minimal API endpoints should:

- Validate transport concerns
- Delegate work
- Return HTTP responses

Avoid:

- Business rules
- Database access
- Workflow orchestration

---

# Rule API-003 — Centralize Exception Handling

Use a centralized exception handling strategy.

Prefer:

- IExceptionHandler (.NET 8+)
- ProblemDetails
- Consistent error contracts

Avoid try/catch blocks in every endpoint.

---

# Rule API-004 — Use ProblemDetails

Return RFC 9457 ProblemDetails (or equivalent standardized error contracts).

Clients should receive consistent error responses.

---

# Rule API-005 — Validate Requests at the Boundary

Validate incoming requests before invoking business logic.

Typical options:

- FluentValidation
- Endpoint Filters
- Model validation

Validation is not business logic.

---

# Rule API-006 — Dependency Injection Must Reflect Lifetimes

Choose service lifetimes intentionally.

- Singleton
- Scoped
- Transient

Review lifetime mismatches carefully.

---

# Rule API-007 — Configuration Must Use the Options Pattern

Strongly typed configuration improves safety and discoverability.

Validate critical configuration during startup.

---

# Rule API-008 — Middleware Owns Cross-Cutting Concerns

Middleware is appropriate for:

- Correlation IDs
- Logging
- Authentication
- Compression
- Rate limiting
- Exception handling

Avoid business rules inside middleware.

---

# Rule API-009 — Background Services Should Be Autonomous

BackgroundService implementations should:

- Respect CancellationToken
- Handle transient failures
- Log meaningful events
- Avoid blocking threads

---

# Rule API-010 — Health Checks Are Operational Contracts

Expose health endpoints for:

- Readiness
- Liveness
- Dependencies

Health checks should reflect actual operational state.

---

# Rule API-011 — API Versioning Must Be Intentional

Version APIs only when required.

Choose a strategy and apply it consistently.

Examples:

- URL
- Header
- Media Type

---

# Rule API-012 — Authentication and Authorization Are Separate Concerns

Authentication identifies.

Authorization decides.

Keep both concerns independent.

---

# Rule API-013 — Respect HTTP Semantics

Use correct HTTP verbs and status codes.

Avoid using HTTP transport to represent business workflow incorrectly.

---

# Rule API-014 — Endpoint Filters Are Cross-Cutting Tools

Endpoint Filters are suitable for:

- Validation
- Logging
- Metrics
- Authorization helpers

Avoid embedding business rules.

---

# Rule API-015 — Prefer Streaming for Large Payloads

Avoid buffering large responses when streaming is appropriate.

Review file downloads, exports and proxies.

---

# Common ASP.NET Core Smells

- Fat Controllers
- Business logic in middleware
- Service locator
- Missing ProblemDetails
- Missing health checks
- Static service resolution
- Lifetime mismatches
- Configuration scattered across the application

---

# ASP.NET Core Review Checklist

- Is the chosen API style justified?
- Are endpoints thin?
- Is exception handling centralized?
- Is ProblemDetails used?
- Are requests validated?
- Are DI lifetimes correct?
- Is configuration strongly typed?
- Are middleware responsibilities appropriate?
- Are health checks implemented?
- Are HTTP semantics respected?

---

# References

- Microsoft ASP.NET Core Documentation
- Microsoft Minimal APIs Documentation
- RFC 9457 Problem Details
- ASP.NET Core Fundamentals
- Microsoft Dependency Injection Guidelines
