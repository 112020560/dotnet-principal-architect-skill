# Platform Review Playbook

> Step-by-step guidance for executing an ASP.NET Core Compliance Review.

---

## Purpose

This playbook provides repeatable execution guidance for conducting an ASP.NET Core Platform Compliance Review using the Engineering Assessment Framework.

It answers: How should this review be executed?

---

## Audience

- Software Architects
- Principal Engineers
- Technical Leads

---

## Prerequisites

- Access to the source repository.
- Familiarity with `reviews/05-aspnet-review.md`.
- Familiarity with API rules in `docs/00-rule-catalog.md`.

---

## When to Execute

- When onboarding a new ASP.NET Core application.
- Before major releases.
- After upgrading the ASP.NET Core version.
- As part of a production readiness process.

---

## Estimated Duration

| System Size | Estimated Duration |
|-------------|-------------------|
| Small | 1–2 hours |
| Medium | 2–4 hours |
| Large | 4–6 hours |

---

## Preparation

1. Read `docs/07-aspnet-core.md`.
2. Read `docs/00-rule-catalog.md` — API section.
3. Open `reviews/05-aspnet-review.md` as the working document.
4. Locate: `Program.cs`, middleware pipeline, controller or minimal API definitions, DI registrations.

---

## Execution Steps

### Step 1 — Evaluate the Middleware Pipeline

- Review `Program.cs` or the application startup sequence.
- Verify that middleware is registered in the correct order (exception handling before routing, authentication before authorization).
- Identify any business logic implemented in middleware.
- Check for excessive middleware complexity in `Program.cs`.

Rule references: API-004, ANTI-006.

### Step 2 — Evaluate Controller or Minimal API Design

- For Controllers: verify they are thin — no business logic, only coordination.
- For Minimal API: verify endpoint handlers delegate to Application layer commands or queries.
- Identify fat controllers containing direct database or business logic.

Rule references: API-001, API-002, ANTI-001.

### Step 3 — Evaluate Request Validation

- Verify that all incoming requests are validated using FluentValidation, DataAnnotations, or equivalent.
- Check that validation failures return 400 responses with Problem Details.
- Verify validation occurs at the application boundary, not deep in the domain.

Rule references: API-003.

### Step 4 — Evaluate Exception Handling

- Verify that a centralized exception handler is configured (`IExceptionHandler`, `UseExceptionHandler`).
- Check that exceptions are mapped to appropriate HTTP status codes.
- Verify that unhandled exceptions do not expose stack traces in production.

Rule references: API-004, API-005.

### Step 5 — Evaluate Problem Details

- Verify that error responses follow RFC 9457 Problem Details (`ProblemDetails`, `ValidationProblemDetails`).
- Check that all error responses include `type`, `title`, `status`, and correlation identifiers.

Rule references: API-005.

### Step 6 — Evaluate Dependency Injection

- Verify that service lifetimes are correct (Singleton, Scoped, Transient).
- Check for Captive Dependency issues (Singleton depending on Scoped service).
- Verify that the Service Locator pattern is not used.

Rule references: API-006, ANTI-015.

### Step 7 — Evaluate Configuration

- Verify that configuration is managed via the Options Pattern (`IOptions<T>`, `IOptionsSnapshot<T>`).
- Check that secrets are not hardcoded in `appsettings.json`.
- Verify that configuration is validated at startup where applicable.

Rule references: API-007.

### Step 8 — Evaluate Health Checks

- Verify that health check endpoints are configured (`/health`, `/health/ready`, `/health/live`).
- Check that health checks cover critical dependencies (database, message broker, external APIs).

Rule references: CLOUD-004.

### Step 9 — Document Findings

- Record each finding with evidence, applicable rule, and severity.

---

## Evidence Collection Guide

| Evidence Type | Where to Find |
|---------------|--------------|
| Middleware pipeline | `Program.cs`, `Startup.cs` |
| Controller actions | `Controllers/` folder |
| Minimal API endpoints | `Program.cs`, endpoint extension methods |
| DI registrations | `AddScoped`, `AddSingleton`, `AddTransient` |
| Options pattern usage | `IOptions<T>`, `Configure<T>` |
| Exception handler | `UseExceptionHandler`, `IExceptionHandler` |
| Health checks | `AddHealthChecks`, `/health` endpoints |
| Validation | `FluentValidation`, `[Required]`, model validators |

---

## Common Findings

- Business logic in Controllers or Minimal API handlers.
- Missing centralized exception handler.
- Error responses not following Problem Details format.
- Configuration values read directly from `IConfiguration` instead of Options Pattern.
- Incorrect service lifetimes causing runtime errors.
- Missing health check endpoints.
- Service Locator pattern using `IServiceProvider` in business code.

---

## Red Flags

- Controller actions with more than 20 lines of business logic.
- `try/catch` blocks in every controller action instead of centralized handling.
- `appsettings.json` containing connection strings or API keys.
- `IServiceProvider.GetService<T>()` called inside business services.

---

## Output

Upon completion, the reviewer produces:

1. A completed `reviews/05-aspnet-review.md`.
2. An Executive Summary describing platform health.
3. Prioritized recommendations.

---

## Quality Checklist

- ☐ Middleware pipeline order is explicitly verified.
- ☐ Service lifetimes are verified for potential captive dependency issues.
- ☐ Problem Details is confirmed as the error response standard.
- ☐ Health checks are verified.
- ☐ Every finding references an API or ANTI rule.
- ☐ Executive Summary is complete.

---

## Related Documents

- reviews/05-aspnet-review.md
- scorecards/05-aspnet-core-scorecard.md
- docs/07-aspnet-core.md
- docs/00-rule-catalog.md

---

## Future Enhancements

Future versions of this playbook may include:

- Minimal API vs Controllers decision guidance.
- ASP.NET Core version upgrade readiness checklist.
- Native AOT compatibility review guidance.
