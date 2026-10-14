
# HTTP Rules

> *HTTP is not just a transport protocol. It is a critical architectural boundary between systems.*

---

# Purpose

This document defines engineering rules for designing, implementing, and reviewing HTTP communication in modern .NET applications.

The focus is correctness, resiliency, observability, maintainability, and performance.

Rule IDs and descriptions in this document must always match `docs/00-rule-catalog.md` exactly — if a number here does not match the catalog, the catalog wins and this file has drifted.

---

# HTTP Principles

- Reuse connections.
- Design for failure.
- Make communication observable.
- Prefer standards over custom protocols.
- Propagate context across service boundaries.
- Timeouts are mandatory.
- Retries require idempotency.

---

# Rule HTTP-001 — Use IHttpClientFactory or an Equivalent Strategy

**Severity:** Critical

Prefer:

- IHttpClientFactory
- Long-lived HttpClient
- SocketsHttpHandler

Avoid creating a new HttpClient per request — it exhausts sockets under load even though each individual instance disposes cleanly.

A static HttpClient backed by a properly configured SocketsHttpHandler is an acceptable equivalent when DI is unavailable. Choose based on architecture, not dogma.

---

# Rule HTTP-002 — Configure Resilient HTTP Clients

Retry only operations that are safe to repeat. Typical candidates: GET, HEAD. POST operations require explicit idempotency support before retries.

Implement retries, backoff, and circuit breakers with a resilience library (Polly, or `Microsoft.Extensions.Http.Resilience`, which is built on Polly) — never a hand-rolled `while(true)` or `for` loop with manual delays. See ANTI-016.

Related Rules: MSG-007.

---

# Rule HTTP-003 — Define Explicit Timeouts

Never rely on infinite or implicit defaults.

Review:

- Client timeout
- Connection timeout
- Request timeout
- CancellationToken

Timeouts should match business expectations.

---

# Rule HTTP-004 — Use Typed Clients

Prefer a typed client (a class wrapping `HttpClient`, registered via `AddHttpClient<T>()`) over passing around a raw, unconfigured `HttpClient`.

Cross-cutting concerns — authentication, correlation IDs, logging, metrics, custom headers — belong in `DelegatingHandler`s attached to the typed client, not duplicated inside every call site.

---

# Rule HTTP-005 — Propagate CancellationToken

CancellationToken should flow through every outbound request whenever practical.

Avoid wasting resources after upstream cancellation.

---

# Rule HTTP-006 — Respect REST Semantics

Use HTTP status codes and verbs correctly.

Examples:

- 200 OK
- 201 Created
- 202 Accepted
- 204 No Content
- 400 Bad Request
- 401 Unauthorized
- 403 Forbidden
- 404 Not Found
- 409 Conflict
- 422 Unprocessable Content
- 500 Internal Server Error

Business validation failures are not transport failures — do not collapse every outcome into 200 OK with an error field in the body, and do not use HTTP status codes to carry business meaning they don't have.

---

# Rule HTTP-007 — Return Problem Details for Errors

Map HTTP failures into meaningful application results using RFC 9457 Problem Details (or an equivalent standardized error contract).

Differentiate transport failures, timeouts, authentication, authorization, business validation, and unexpected server failures. Do not expose raw infrastructure exceptions to the caller.

---

# Rule HTTP-008 — Validate Requests at the Boundary

Validate outbound request payloads before sending them, and validate that a response matches the expected contract before trusting it downstream. Do not let an external system's malformed or unexpected response propagate unchecked into business logic.

---

# Rule HTTP-009 — Never Log Sensitive Information

Never log:

- Passwords
- Secrets
- Tokens
- Full card numbers
- OTP values
- Personal identifiers unless justified

Mask sensitive values whenever possible.

Related Rules: SEC-004, OBS-004.

---

# Rule HTTP-010 — Prefer ResponseHeadersRead When Appropriate

Prefer `HttpCompletionOption.ResponseHeadersRead` when:

- Streaming files
- Handling large payloads
- Forwarding content

Avoid buffering entire responses unnecessarily.

---

# Rule HTTP-011 — Design DTOs Intentionally

Prefer DTOs designed for transport instead of exposing domain models directly. Avoid oversized payloads — serialize only what the consumer needs.

Related Rules: ANTI-014 (DTO Explosion).

---

# Rule HTTP-012 — Version APIs Deliberately

Version APIs only when a breaking change is unavoidable. Choose one strategy (URL, header, or media type) and apply it consistently across the service.

---

# Rule HTTP-013 — External Integrations Belong Behind Ports and Adapters

Clients should represent business services, not generic transport helpers.

Examples:

- `PaymentClient`
- `CustomerClient`
- `NotificationClient`

Avoid generic REST helper classes used throughout the application — they leak the specific external integration's shape into every caller instead of isolating it behind an abstraction owned by the business.

Related Rules: ARCH-009, ARCH-011.

---

# Additional Engineering Guidance

The following guidance is established practice but is not a numbered rule in `docs/00-rule-catalog.md` — do not cite it with a rule ID.

## Propagate Correlation IDs

Every outbound request should propagate a correlation identifier (`traceparent`, `tracestate`, `X-Trace-Id`). Distributed tracing depends on propagation. See OBS-001, MSG-008.

## Observe HTTP Communication

Log method, URI, status code, duration, and correlation ID for outbound calls — without logging sensitive information (HTTP-009). Capture duration, success/failure rate, status codes, and retry count, and integrate with OpenTelemetry where possible.

## Use Compression Intentionally

Enable compression for large payloads when supported, weighing CPU cost against bandwidth savings.

## Prefer HTTP/2 or HTTP/3 When Supported

Newer protocol versions offer multiplexing, reduced latency, and better connection utilization when the infrastructure supports them.

## Configure Proxies Explicitly

Proxy usage should be intentional and documented (corporate proxies, authentication, bypass rules). Unexpected proxy configuration is a common production issue.

---

# Common HTTP Smells

- New HttpClient per request
- Missing timeout
- Missing CancellationToken
- Logging secrets
- Blind retries
- Hand-rolled retry loop (`while(true)`, manual `Thread.Sleep`/`Task.Delay`) instead of Polly or another resilience library (ANTI-016)
- Duplicate authentication logic
- Ignoring HTTP status codes
- Returning infrastructure exceptions directly
- Missing trace propagation

---

# HTTP Review Checklist

- Are connections reused?
- Are timeouts configured?
- Is CancellationToken propagated?
- Are retries safe?
- Are retries and circuit breakers implemented via a resilience library instead of a hand-rolled loop?
- Are handlers used appropriately?
- Is correlation propagated?
- Are sensitive values protected?
- Are errors mapped correctly?
- Is telemetry available?
- Are payloads minimized?

---

# References

- Microsoft HttpClient Guidelines
- Microsoft IHttpClientFactory Documentation
- ASP.NET Core HTTP Client Factory
- RFC 9110 – HTTP Semantics
- OpenTelemetry Specification
- Polly Documentation
