# HTTP Review Playbook

> Step-by-step guidance for executing an HTTP Compliance Review.

---

## Purpose

This playbook provides repeatable execution guidance for conducting an HTTP Compliance Review using the Engineering Assessment Framework.

It answers: How should this review be executed?

---

## Audience

- Software Architects
- Principal Engineers
- Technical Leads

---

## Prerequisites

- Access to the source repository.
- Familiarity with `reviews/04-http-review.md`.
- Familiarity with HTTP rules in `docs/00-rule-catalog.md`.

---

## When to Execute

- When external HTTP integrations are present.
- Before major releases.
- When HTTP-related failures or timeouts are reported.
- As part of a production readiness process.

---

## Estimated Duration

| System Size | Estimated Duration |
|-------------|-------------------|
| Small | 1–2 hours |
| Medium | 2–4 hours |
| Large | 4–8 hours |

---

## Preparation

1. Read `docs/06-http.md`.
2. Read `docs/00-rule-catalog.md` — HTTP section.
3. Open `reviews/04-http-review.md` as the working document.
4. Identify all external HTTP dependencies: APIs, services, webhooks.
5. Locate all HttpClient registrations and usages.

---

## Execution Steps

### Step 1 — Evaluate HttpClient Lifecycle Management

- Search for `new HttpClient()` instantiations outside of DI.
- Verify that `IHttpClientFactory` or typed clients are used.
- Check DI registration: `AddHttpClient`, `AddTypedClient`.

Rule references: HTTP-001, HTTP-004.

### Step 2 — Evaluate Resilience Configuration

- Verify that HTTP clients have retry policies configured (Polly or .NET 8+ `AddStandardResilienceHandler`).
- Check for circuit breaker configuration on critical external dependencies.
- Verify that explicit timeouts are configured and not relying on defaults.

Rule references: HTTP-002, HTTP-003.

### Step 3 — Evaluate CancellationToken Propagation

- Verify that `CancellationToken` is passed to all `HttpClient` calls.
- Check that request handlers forward the token through to HTTP calls.

Rule references: HTTP-005.

### Step 4 — Evaluate REST Semantics

- Check that HTTP methods are used correctly (GET for reads, POST for creates, PUT/PATCH for updates, DELETE for deletes).
- Verify that status codes are appropriate (201 for created, 204 for no content, 404 for not found).
- Check for POST being used for all operations regardless of semantics.

Rule references: HTTP-006.

### Step 5 — Evaluate Error Handling

- Verify that error responses follow RFC 9457 Problem Details format.
- Check that internal errors are not exposed to callers.
- Verify that error responses include correlation identifiers.

Rule references: HTTP-007.

### Step 6 — Evaluate Request Validation

- Verify that incoming request payloads are validated before processing.
- Check that validation failures return appropriate 400-series responses.

Rule references: HTTP-008.

### Step 7 — Evaluate Security

- Search for any logging of request or response bodies that may contain sensitive data.
- Verify that authorization headers and tokens are never logged.

Rule references: HTTP-009.

### Step 8 — Evaluate External Integration Isolation

- Verify that external HTTP dependencies are encapsulated behind interfaces (Ports/Adapters).
- Check that typed HTTP clients do not leak into the Domain or Application layers.

Rule references: HTTP-013.

### Step 9 — Evaluate DTOs

- Verify that request and response DTOs are purpose-designed and not reused across unrelated contexts.
- Check for domain models being returned directly from HTTP endpoints.

Rule references: HTTP-011.

### Step 10 — Document Findings

- Record each finding with evidence, applicable rule, and severity.

---

## Evidence Collection Guide

| Evidence Type | Where to Find |
|---------------|--------------|
| HttpClient instantiation | Search for `new HttpClient()` |
| DI registrations | `Program.cs`, `AddHttpClient` |
| Resilience policies | `AddResilienceHandler`, Polly configuration |
| Timeout configuration | `HttpClient.Timeout`, `TimeoutPolicy` |
| CancellationToken usage | Method signatures and `SendAsync` calls |
| Problem Details | `IExceptionHandler`, `ProblemDetails` response type |
| Sensitive data logging | Log statements in middleware or handlers |

---

## Common Findings

- `new HttpClient()` used directly, bypassing `IHttpClientFactory`.
- No timeout configured on HTTP clients.
- No retry or circuit breaker policy on critical external calls.
- CancellationToken accepted at the controller but not forwarded to HttpClient.
- Domain objects returned directly as HTTP responses without DTO mapping.
- Authorization tokens logged in debug or error statements.

---

## Red Flags

- `new HttpClient()` instantiated in service constructors or methods.
- No timeout configuration — relying on default infinite timeout.
- External APIs called directly from Domain or Application code without abstraction.
- Authentication tokens or API keys logged as part of request details.

---

## Output

Upon completion, the reviewer produces:

1. A completed `reviews/04-http-review.md`.
2. An Executive Summary describing HTTP client health.
3. Prioritized recommendations.

---

## Quality Checklist

- ☐ All HttpClient usages are identified and evaluated.
- ☐ Resilience configuration is verified for all external dependencies.
- ☐ Every finding references an HTTP rule.
- ☐ Sensitive data logging is explicitly checked.
- ☐ Positive findings are documented.
- ☐ Executive Summary is complete.

---

## Related Documents

- reviews/04-http-review.md
- scorecards/04-http-scorecard.md
- docs/06-http.md
- docs/00-rule-catalog.md

---

## Future Enhancements

Future versions of this playbook may include:

- Polly and `AddStandardResilienceHandler` configuration examples.
- HTTP client testing guidance using `MockHttpMessageHandler`.
- API versioning review checklist.
