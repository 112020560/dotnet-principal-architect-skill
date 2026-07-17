
# Anti-Patterns

> *Most software failures are not caused by missing patterns. They are caused by repeating well-known anti-patterns.*

---

# Purpose

This document defines common architectural and implementation anti-patterns encountered in modern .NET systems.

The objective is to help reviewers recognize symptoms, understand consequences, and recommend evidence-based improvements.

---

# Anti-Pattern Principles

- Every anti-pattern has a context.
- Avoid dogmatic judgments.
- Diagnose before prescribing.
- Prioritize business impact.
- Prefer incremental remediation.

---

# ANTI-001 — Fat Controller

## Symptoms

- Hundreds of lines of code
- Business rules in endpoints
- Database access
- HTTP calls
- Transaction management

## Consequences

- Low testability
- High coupling
- Difficult maintenance

## Recommended Fix

Move orchestration to the Application layer and business decisions to the Domain.

Related Rules: ARCH-001, ARCH-003, API-002

---

# ANTI-002 — God Service

## Symptoms

- Large service class
- Many responsibilities
- Numerous dependencies

## Consequences

- Poor cohesion
- Difficult testing
- Frequent merge conflicts

## Recommended Fix

Split by business capability.

Related Rules: ARCH-004, ARCH-008

---

# ANTI-003 — Generic Repository Abuse

## Symptoms

- GetAll()
- Query()
- Find()
- IQueryable exposed

## Consequences

- Business language disappears
- Persistence leaks upward

## Recommended Fix

Repositories should express business intent.

Related Rules: DB-006, DB-007

---

# ANTI-004 — Sync over Async

## Symptoms

- .Result
- .Wait()
- GetAwaiter().GetResult()

## Consequences

- Thread starvation
- Deadlocks
- Reduced scalability

## Recommended Fix

Propagate async end-to-end.

Related Rules: PERF-003

---

# ANTI-005 — Task.Run Around I/O

## Symptoms

Wrapping naturally asynchronous I/O inside Task.Run.

## Consequences

- Wasted ThreadPool threads
- No scalability improvement

## Recommended Fix

Use true asynchronous APIs.

Related Rules: PERF-004

---

# ANTI-006 — Business Logic in Middleware

## Symptoms

Middleware performing approvals, validations or workflow decisions.

## Consequences

Business rules become tied to ASP.NET Core.

## Recommended Fix

Restrict middleware to cross-cutting concerns.

Related Rules: API-008, ARCH-001

---

# ANTI-007 — Business Logic in Background Services

## Symptoms

Hosted services deciding business outcomes.

## Consequences

Hidden workflows and duplicated rules.

## Recommended Fix

Background services orchestrate; Domain decides.

Related Rules: API-009, ARCH-004

---

# ANTI-008 — N+1 Queries

## Symptoms

Repeated queries inside loops.

## Consequences

Excessive latency and database load.

## Recommended Fix

Projection, batching and query redesign.

Related Rules: DB-010

---

# ANTI-009 — Chatty APIs

## Symptoms

Many small HTTP calls to complete one business operation.

## Consequences

Network overhead and increased latency.

## Recommended Fix

Design APIs around business capabilities.

Related Rules: HTTP-013

---

# ANTI-010 — Shared Database Between Services

## Symptoms

Multiple services writing the same tables.

## Consequences

Strong coupling and deployment constraints.

## Recommended Fix

Own data by bounded context.

Related Rules: ARCH-008, DB-001

---

# ANTI-011 — Logging Sensitive Data

## Symptoms

Passwords, tokens, OTPs or secrets in logs.

## Consequences

Security and compliance risk.

## Recommended Fix

Mask or omit sensitive values.

Related Rules: OBS-004, SEC-004

---

# ANTI-012 — Premature Optimization

## Symptoms

Micro-optimizations without evidence.

## Consequences

Reduced readability with negligible gains.

## Recommended Fix

Measure first.

Related Rules: PERF-001

---

# ANTI-013 — Overengineering

## Symptoms

CQRS, Event Sourcing, Microservices or Sagas without business justification.

## Consequences

Unnecessary complexity.

## Recommended Fix

Adopt complexity only when justified.

Related Rules: ARCH-009

---

# ANTI-014 — DTO Explosion

## Symptoms

Large numbers of nearly identical DTOs.

## Consequences

Maintenance overhead and duplication.

## Recommended Fix

Model transport contracts intentionally.

Related Rules: HTTP-011

---

# ANTI-015 — Service Locator

## Symptoms

Resolving services manually from IServiceProvider throughout the codebase.

## Consequences

Hidden dependencies and poor testability.

## Recommended Fix

Use constructor injection.

Related Rules: API-006

---

# Common Review Strategy

When an anti-pattern is detected:

1. Confirm the symptom with evidence.
2. Assess business impact.
3. Identify affected rules.
4. Recommend the smallest safe improvement.
5. Avoid unnecessary rewrites.

---

# Anti-Pattern Review Checklist

- Is the issue measurable?
- Does it affect correctness?
- Does it reduce maintainability?
- Does it hurt scalability?
- Is there a lower-risk remediation?
- Are related engineering rules referenced?

---

# References

- Martin Fowler — Refactoring
- Martin Fowler — Patterns of Enterprise Application Architecture
- Eric Evans — Domain-Driven Design
- Microsoft Architecture Guides
- Clean Architecture (Robert C. Martin)
