
# HTTP Rules

> *HTTP is not just a transport protocol. It is a critical architectural boundary between systems.*

---

# Purpose

This document defines engineering rules for designing, implementing, and reviewing HTTP communication in modern .NET applications.

The focus is correctness, resiliency, observability, maintainability, and performance.

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

# Rule HTTP-001 — Reuse HTTP Connections

**Severity:** Critical

Prefer:

- IHttpClientFactory
- Long-lived HttpClient
- SocketsHttpHandler

Avoid creating a new HttpClient per request.

---

# Rule HTTP-002 — IHttpClientFactory Is Not Mandatory

Use IHttpClientFactory when:

- Dependency Injection is available.
- Multiple clients require configuration.
- Delegating handlers are useful.
- Centralized resiliency policies are needed.

A static HttpClient backed by a properly configured SocketsHttpHandler is acceptable when DI is unavailable.

Choose based on architecture, not dogma.

---

# Rule HTTP-003 — Configure Timeouts Explicitly

Never rely on infinite or implicit defaults.

Review:

- Client timeout
- Connection timeout
- Request timeout
- CancellationToken

Timeouts should match business expectations.

---

# Rule HTTP-004 — Propagate Correlation IDs

Every outbound request should propagate a correlation identifier.

Common headers include:

- X-Trace-Id
- traceparent
- tracestate

Distributed tracing depends on propagation.

---

# Rule HTTP-005 — Propagate CancellationToken

CancellationToken should flow through every outbound request whenever practical.

Avoid wasting resources after upstream cancellation.

---

# Rule HTTP-006 — Retries Require Idempotency

Retry only operations that are safe to repeat.

Typical candidates:

- GET
- HEAD

POST operations require explicit idempotency support before retries.

---

# Rule HTTP-007 — Prefer Delegating Handlers

Cross-cutting concerns belong in DelegatingHandlers.

Examples:

- Authentication
- Correlation IDs
- Logging
- Metrics
- Telemetry
- Custom headers

Avoid duplicating this logic inside every client.

---

# Rule HTTP-008 — Observe Before Debugging

Log enough information to diagnose production problems.

Recommended:

- Method
- URI
- Status code
- Duration
- Correlation ID

Avoid logging sensitive information.

---

# Rule HTTP-009 — Sensitive Data Must Never Be Logged

Never log:

- Passwords
- Secrets
- Tokens
- Full card numbers
- OTP values
- Personal identifiers unless justified

Mask sensitive values whenever possible.

---

# Rule HTTP-010 — Use ResponseHeadersRead for Large Responses

Prefer HttpCompletionOption.ResponseHeadersRead when:

- Streaming files
- Large payloads
- Forwarding content

Avoid buffering entire responses unnecessarily.

---

# Rule HTTP-011 — Serialize Only What Is Needed

Avoid oversized payloads.

Prefer DTOs designed for transport instead of exposing domain models.

Minimize payload size.

---

# Rule HTTP-012 — Handle Errors Explicitly

Map HTTP failures into meaningful application results.

Differentiate:

- Transport failures
- Timeout
- Authentication
- Authorization
- Business validation
- Unexpected server failures

Do not expose raw infrastructure exceptions.

---

# Rule HTTP-013 — Design Clients Around Business Capabilities

Clients should represent business services.

Examples:

- PaymentClient
- CustomerClient
- NotificationClient

Avoid generic REST helper classes throughout the application.

---

# Rule HTTP-014 — Respect HTTP Semantics

Use HTTP status codes correctly.

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

Business validation failures are not transport failures.

---

# Rule HTTP-015 — Use Compression Intentionally

Enable compression for large payloads when supported.

Evaluate CPU cost versus bandwidth savings.

---

# Rule HTTP-016 — Prefer HTTP/2 or HTTP/3 When Supported

Use newer protocol versions when infrastructure supports them.

Benefits include:

- Multiplexing
- Reduced latency
- Better connection utilization

---

# Rule HTTP-017 — Configure Proxies Explicitly

Proxy usage should be intentional.

Document:

- Corporate proxies
- Authentication
- Proxy bypass rules

Unexpected proxy configuration is a common production issue.

---

# Rule HTTP-018 — Instrument HTTP Communication

Capture:

- Duration
- Success rate
- Failure rate
- Status codes
- Retry count

Integrate with OpenTelemetry whenever possible.

---

# Common HTTP Smells

- New HttpClient per request
- Missing timeout
- Missing CancellationToken
- Logging secrets
- Blind retries
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
