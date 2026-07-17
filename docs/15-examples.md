
# Engineering Review Examples

> *Rules become valuable when they are applied to real engineering decisions.*

---

# Purpose

This document demonstrates how the Principal .NET Architect Skill applies the engineering standards defined in this repository.

Each example follows the same review methodology:

1. Understand the context
2. Gather evidence
3. Identify applicable rules
4. Assess severity
5. Explain business impact
6. Recommend the smallest safe improvement

---

# Example 1 — Business Logic Inside a Controller

## Scenario

The controller validates customer eligibility, queries the database and decides whether a loan should be approved.

## Findings

- Business logic in transport layer
- Persistence accessed directly
- Controller orchestrates workflow

## Related Rules

- ARCH-001
- ARCH-003
- API-002

## Severity

High

## Recommendation

Move orchestration to the Application layer and business rules to the Domain.

---

# Example 2 — Repository Returns IQueryable

## Findings

Repository exposes IQueryable to the Application layer.

## Related Rules

- DB-006
- DB-007

## Severity

High

## Recommendation

Expose business-oriented methods returning materialized results.

---

# Example 3 — Task.Run Around I/O

## Findings

Asynchronous HTTP call wrapped inside Task.Run.

## Related Rules

- PERF-003
- PERF-004
- ANTI-005

## Severity

High

## Recommendation

Await the asynchronous operation directly.

---

# Example 4 — New HttpClient Per Request

## Findings

HttpClient instantiated inside every request.

## Related Rules

- HTTP-001
- PERF-010

## Severity

Critical

## Recommendation

Reuse HttpClient through IHttpClientFactory or a properly configured shared instance.

---

# Example 5 — Missing CancellationToken

## Findings

CancellationToken is ignored across async boundaries.

## Related Rules

- PERF-005
- HTTP-005

## Severity

Medium

## Recommendation

Propagate CancellationToken through repositories, HTTP clients and messaging.

---

# Example 6 — N+1 Database Queries

## Findings

Database queried repeatedly inside a loop.

## Related Rules

- DB-010
- PERF-013
- ANTI-008

## Severity

High

## Recommendation

Replace repeated queries with projections or batch retrieval.

---

# Example 7 — Business Logic Inside Middleware

## Findings

Middleware performs credit approval decisions.

## Related Rules

- ARCH-001
- API-008
- ANTI-006

## Severity

Critical

## Recommendation

Keep middleware limited to cross-cutting concerns.

---

# Example 8 — Generic Repository Abuse

## Findings

Repository exposes GetAll(), Find() and Query().

## Related Rules

- DB-006
- DB-007
- ANTI-003

## Severity

Medium

## Recommendation

Replace generic methods with business-oriented repository operations.

---

# Example 9 — Logging Sensitive Information

## Findings

Access tokens and OTP values are written to application logs.

## Related Rules

- OBS-004
- SEC-004
- HTTP-009
- ANTI-011

## Severity

Critical

## Recommendation

Mask or omit sensitive values before logging.

---

# Example 10 — Shared Database Between Services

## Findings

Multiple services update the same tables directly.

## Related Rules

- ARCH-008
- DB-001
- ANTI-010

## Severity

Critical

## Recommendation

Assign data ownership to each bounded context and integrate through contracts.

---

# Example 11 — EF Core vs Dapper Decision

## Scenario

A high-throughput reporting API reads millions of rows but performs very few writes.

## Engineering Assessment

EF Core remains suitable for writes.

Dapper is appropriate for specialized read models.

## Related Rules

- DB-003
- DB-004
- DB-005

## Recommendation

Adopt a hybrid persistence strategy rather than migrating the entire application.

---

# Example 12 — Minimal APIs vs Controllers

## Scenario

A team asks which style should become the company standard.

## Engineering Assessment

There is no universal answer.

The decision depends on:

- Team size
- API complexity
- Versioning
- Maintainability
- Operational requirements

## Related Rules

- API-001

## Recommendation

Choose the API style using the documented decision matrix instead of personal preference.

---

# Example Review Output

Finding

Business logic detected inside a controller.

Severity

High

Evidence

The endpoint validates eligibility and updates persistence before invoking the Application layer.

Related Rules

- ARCH-001
- ARCH-003
- API-002

Impact

Business rules become coupled to HTTP, reducing maintainability and testability.

Recommendation

Move orchestration into the Application layer and preserve the controller as a transport adapter.

Trade-offs

One additional application service is introduced, but architectural boundaries become significantly clearer.

---

# Final Guidance

The goal of an engineering review is not to criticize code.

The goal is to help teams make better engineering decisions through objective analysis, measurable evidence and incremental improvements.

Every recommendation should:

- Explain why
- Reference applicable rules
- Discuss trade-offs
- Prefer the smallest safe improvement
- Respect business context

A review that teaches is more valuable than a review that merely finds defects.
