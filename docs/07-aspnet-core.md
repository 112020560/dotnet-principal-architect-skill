
# ASP.NET Core Rules

> *ASP.NET Core is a hosting and delivery framework. Business decisions belong elsewhere.*

---

# Purpose

This document defines engineering rules for building ASP.NET Core applications.

The goal is to promote maintainable, observable, secure and scalable APIs while avoiding framework-driven architecture.

Rule IDs and descriptions in this document must always match `docs/00-rule-catalog.md` exactly — if a number here does not match the catalog, the catalog wins and this file has drifted.

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

Do not recommend Controllers or Minimal APIs as a universal standard. Choose according to the service.

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

Both approaches execute on the same ASP.NET Core pipeline — performance differences are usually negligible. Choose based on maintainability, complexity, and team experience.

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

Related Rules: ARCH-003.

---

# Rule API-003 — Validation Occurs at the Application Boundary

Validate incoming requests before invoking business logic.

Typical options:

- FluentValidation
- Endpoint Filters
- Model validation

Validation is not business logic.

---

# Rule API-004 — Centralize Exception Handling

Use a centralized exception handling strategy.

Prefer:

- `IExceptionHandler` (.NET 8+)
- ProblemDetails
- Consistent error contracts

Avoid try/catch blocks in every endpoint.

---

# Rule API-005 — Implement RFC 9457 Problem Details

Return RFC 9457 ProblemDetails (or equivalent standardized error contracts).

Clients should receive consistent error responses.

Related Rules: HTTP-007.

---

# Rule API-006 — Configure Dependency Injection Correctly

Choose service lifetimes intentionally.

- Singleton
- Scoped
- Transient

Review lifetime mismatches carefully — a singleton capturing a scoped dependency is a common and subtle defect.

---

# Rule API-007 — Use the Options Pattern for Configuration

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

Avoid business rules inside middleware — a middleware that approves, validates, or decides a business workflow ties that decision to the ASP.NET Core pipeline instead of the Domain.

Related Rules: ANTI-006, ARCH-002.

---

# Rule API-009 — Background Services Should Be Autonomous

`BackgroundService` implementations should:

- Respect `CancellationToken`
- Handle transient failures
- Log meaningful events
- Avoid blocking threads

They should orchestrate; the Domain decides. A hosted service that decides business outcomes directly hides workflows and duplicates rules that belong elsewhere.

Related Rules: ANTI-007, ARCH-006.

---

# Additional Engineering Guidance

The following guidance is established practice but is not a numbered rule in `docs/00-rule-catalog.md` — do not cite it with a rule ID.

## Health Checks Are Operational Contracts

Expose health endpoints for readiness, liveness, and dependencies. Health checks should reflect actual operational state, not just "the process is running." See CLOUD-004.

## API Versioning Must Be Intentional

Version APIs only when required. Choose a strategy (URL, header, media type) and apply it consistently. See HTTP-012.

## Endpoint Filters Are Cross-Cutting Tools

Endpoint Filters suit validation, logging, metrics, and authorization helpers — avoid embedding business rules in them, for the same reason middleware shouldn't carry them (API-008).

## Authentication and Authorization Are Separate Concerns

Authentication identifies; authorization decides. Keep both concerns independent. See SEC-001.

## Respect HTTP Semantics and Prefer Streaming for Large Payloads

These are owned by the HTTP domain — see HTTP-006 and HTTP-010/PERF-009. An ASP.NET Core endpoint is still subject to both.

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
