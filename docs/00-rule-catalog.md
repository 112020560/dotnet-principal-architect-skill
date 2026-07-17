# Engineering Rule Catalog

> *A rule defined once can be referenced everywhere.*

---

# Purpose

This document is the authoritative catalog of every engineering rule defined by the Principal .NET Architect Engineering Standard.

Its objectives are:

- Provide a unique identifier for every engineering rule.
- Eliminate duplicate definitions.
- Enable traceability across documentation.
- Support automated reviews and tooling.
- Establish a stable taxonomy for the Engineering Standard.

If a rule is not listed in this catalog, it is **not part of the Engineering Standard**.

---

# Rule Identifier Convention

Every engineering rule follows the format:

```
<CATEGORY>-<NUMBER>
```

Examples:

```
ARCH-001
DB-003
PERF-007
HTTP-002
API-004
OBS-005
MSG-001
SEC-003
CLOUD-004
TEST-008
ANTI-012
```

Rule identifiers are permanent.

Once assigned, they must never be reused for another rule.

---

# Architecture (ARCH)

| Rule | Description | Reference |
|------|-------------|-----------|
| ARCH-001 | Domain is independent from Infrastructure. | docs/03-architecture.md |
| ARCH-002 | Business rules belong to the Domain. | docs/03-architecture.md |
| ARCH-003 | Business logic is isolated from transport and persistence. | docs/03-architecture.md |
| ARCH-004 | Domain models represent business concepts. | docs/03-architecture.md |
| ARCH-005 | Domain Services are cohesive and business-oriented. | docs/03-architecture.md |
| ARCH-006 | Application layer orchestrates business use cases. | docs/03-architecture.md |
| ARCH-007 | Commands and Queries have a single responsibility. | docs/03-architecture.md |
| ARCH-008 | Dependencies point inward. | docs/03-architecture.md |
| ARCH-009 | Depend on abstractions, not implementations. | docs/03-architecture.md |
| ARCH-010 | Infrastructure implements abstractions only. | docs/03-architecture.md |
| ARCH-011 | Persistence is isolated behind Ports or Repositories. | docs/03-architecture.md |
| ARCH-012 | Infrastructure contains no business rules. | docs/03-architecture.md |

---

# Database (DB)

| Rule | Description | Reference |
|------|-------------|-----------|
| DB-001 | Every bounded context owns its data. | docs/04-database.md |
| DB-002 | Model aggregates before tables. | docs/04-database.md |
| DB-003 | EF Core is the default ORM. | docs/04-database.md |
| DB-004 | Use Dapper only when justified. | docs/04-database.md |
| DB-005 | Choose the right persistence strategy per workload. | docs/04-database.md |
| DB-006 | Repositories express business intent. | docs/04-database.md |
| DB-007 | Avoid Generic Repository abuse. | docs/04-database.md |
| DB-008 | Optimize queries before scaling hardware. | docs/04-database.md |
| DB-009 | Design indexes intentionally. | docs/04-database.md |
| DB-010 | Prevent N+1 queries. | docs/04-database.md |

---

# Performance (PERF)

| Rule | Description | Reference |
|------|-------------|-----------|
| PERF-001 | Measure before optimizing. | docs/05-performance.md |
| PERF-002 | Prefer asynchronous I/O. | docs/05-performance.md |
| PERF-003 | Never wrap asynchronous I/O with Task.Run. | docs/05-performance.md |
| PERF-004 | Avoid Sync-over-Async. | docs/05-performance.md |
| PERF-005 | Propagate CancellationToken. | docs/05-performance.md |
| PERF-006 | Minimize allocations. | docs/05-performance.md |
| PERF-007 | Avoid unnecessary object creation. | docs/05-performance.md |
| PERF-008 | Batch operations when appropriate. | docs/05-performance.md |
| PERF-009 | Prefer streaming for large payloads. | docs/05-performance.md |
| PERF-010 | Measure with BenchmarkDotNet when required. | docs/05-performance.md |

---

# HTTP (HTTP)

| Rule | Description | Reference |
|------|-------------|-----------|
| HTTP-001 | Use IHttpClientFactory or an equivalent strategy. | docs/06-http.md |
| HTTP-002 | Configure resilient HTTP clients. | docs/06-http.md |
| HTTP-003 | Define explicit timeouts. | docs/06-http.md |
| HTTP-004 | Use typed clients. | docs/06-http.md |
| HTTP-005 | Propagate CancellationToken. | docs/06-http.md |
| HTTP-006 | Respect REST semantics. | docs/06-http.md |
| HTTP-007 | Return Problem Details for errors. | docs/06-http.md |
| HTTP-008 | Validate requests at the boundary. | docs/06-http.md |
| HTTP-009 | Never log sensitive information. | docs/06-http.md |
| HTTP-010 | Prefer ResponseHeadersRead when appropriate. | docs/06-http.md |
| HTTP-011 | Design DTOs intentionally. | docs/06-http.md |
| HTTP-012 | Version APIs deliberately. | docs/06-http.md |
| HTTP-013 | External integrations belong behind Ports and Adapters. | docs/06-http.md |

---

# ASP.NET Core (API)

| Rule | Description | Reference |
|------|-------------|-----------|
| API-001 | Choose Controllers or Minimal APIs intentionally. | docs/07-aspnet-core.md |
| API-002 | Controllers remain thin. | docs/07-aspnet-core.md |
| API-003 | Validation occurs at the application boundary. | docs/07-aspnet-core.md |
| API-004 | Centralize exception handling. | docs/07-aspnet-core.md |
| API-005 | Implement RFC 9457 Problem Details. | docs/07-aspnet-core.md |
| API-006 | Configure Dependency Injection correctly. | docs/07-aspnet-core.md |
| API-007 | Use the Options Pattern for configuration. | docs/07-aspnet-core.md |

---

# Observability (OBS)

| Rule | Description | Reference |
|------|-------------|-----------|
| OBS-001 | Use structured logging. | docs/08-observability.md |
| OBS-002 | Include correlation identifiers. | docs/08-observability.md |
| OBS-003 | Capture meaningful metrics. | docs/08-observability.md |
| OBS-004 | Never log secrets or sensitive data. | docs/08-observability.md |
| OBS-005 | Emit traces across distributed systems. | docs/08-observability.md |
| OBS-006 | Adopt OpenTelemetry as the standard. | docs/08-observability.md |

---

# Messaging (MSG)

| Rule | Description | Reference |
|------|-------------|-----------|
| MSG-001 | Prefer asynchronous communication when appropriate. | docs/09-messaging.md |
| MSG-002 | Messages are immutable. | docs/09-messaging.md |
| MSG-003 | Consumers are idempotent. | docs/09-messaging.md |
| MSG-004 | Design for retries. | docs/09-messaging.md |
| MSG-005 | Use the Outbox Pattern when consistency is required. | docs/09-messaging.md |
| MSG-006 | Avoid business logic inside consumers. | docs/09-messaging.md |

---

# Security (SEC)

| Rule | Description | Reference |
|------|-------------|-----------|
| SEC-001 | Validate every external input. | docs/10-security.md |
| SEC-002 | Apply least privilege. | docs/10-security.md |
| SEC-003 | Authenticate before authorizing. | docs/10-security.md |
| SEC-004 | Never expose secrets. | docs/10-security.md |
| SEC-005 | Protect sensitive data in transit and at rest. | docs/10-security.md |
| SEC-006 | Fail securely. | docs/10-security.md |
| SEC-007 | Authorization must be explicit. | docs/10-security.md |

---

# Cloud (CLOUD)

| Rule | Description | Reference |
|------|-------------|-----------|
| CLOUD-001 | Applications are stateless. | docs/11-cloud.md |
| CLOUD-002 | Configuration comes from the environment. | docs/11-cloud.md |
| CLOUD-003 | Design for horizontal scalability. | docs/11-cloud.md |
| CLOUD-004 | Health checks are mandatory. | docs/11-cloud.md |
| CLOUD-005 | Design for resiliency. | docs/11-cloud.md |

---

# Testing (TEST)

| Rule | Description | Reference |
|------|-------------|-----------|
| TEST-001 | Balance the testing strategy. | docs/12-testing.md |
| TEST-002 | Test behavior rather than implementation. | docs/12-testing.md |
| TEST-003 | Prefer integration tests for business flows. | docs/12-testing.md |
| TEST-004 | Mock only true external dependencies. | docs/12-testing.md |
| TEST-005 | Prefer Testcontainers for infrastructure tests. | docs/12-testing.md |
| TEST-006 | Tests must be deterministic. | docs/12-testing.md |
| TEST-007 | Tests must be independent. | docs/12-testing.md |
| TEST-008 | Follow Arrange-Act-Assert. | docs/12-testing.md |
| TEST-009 | Coverage is a metric, not a goal. | docs/12-testing.md |
| TEST-010 | Validate failure scenarios. | docs/12-testing.md |

---

# Anti-Patterns (ANTI)

| Rule | Description | Reference |
|------|-------------|-----------|
| ANTI-001 | Fat Controller. | docs/13-anti-patterns.md |
| ANTI-002 | God Service. | docs/13-anti-patterns.md |
| ANTI-003 | Generic Repository Abuse. | docs/13-anti-patterns.md |
| ANTI-004 | Sync over Async. | docs/13-anti-patterns.md |
| ANTI-005 | Task.Run Around I/O. | docs/13-anti-patterns.md |
| ANTI-006 | Business Logic in Middleware. | docs/13-anti-patterns.md |
| ANTI-007 | Business Logic in Background Services. | docs/13-anti-patterns.md |
| ANTI-008 | N+1 Queries. | docs/13-anti-patterns.md |
| ANTI-009 | Chatty APIs. | docs/13-anti-patterns.md |
| ANTI-010 | Shared Database Between Services. | docs/13-anti-patterns.md |
| ANTI-011 | Logging Sensitive Information. | docs/13-anti-patterns.md |
| ANTI-012 | Premature Optimization. | docs/13-anti-patterns.md |
| ANTI-013 | Overengineering. | docs/13-anti-patterns.md |
| ANTI-014 | DTO Explosion. | docs/13-anti-patterns.md |
| ANTI-015 | Service Locator. | docs/13-anti-patterns.md |

---

# Rule Lifecycle

Engineering rules are versioned with the Engineering Standard.

Rules may be:

- Added.
- Deprecated.
- Replaced.

Rule identifiers must never be reassigned.

---

# References

- docs/01-philosophy.md
- docs/02-review-process.md
- docs/03-15 (Engineering Standards)