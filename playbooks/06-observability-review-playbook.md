# Observability Review Playbook

> Step-by-step guidance for executing an Observability Compliance Review.

---

## Purpose

This playbook provides repeatable execution guidance for conducting an Observability Compliance Review using the Engineering Assessment Framework.

It answers: How should this review be executed?

---

## Audience

- Software Architects
- Principal Engineers
- SRE and Platform Engineers

---

## Prerequisites

- Access to the source repository.
- Access to logging, metrics, and tracing configuration if available.
- Familiarity with `reviews/06-observability-review.md`.
- Familiarity with OBS rules in `docs/00-rule-catalog.md`.

---

## When to Execute

- Before production deployment.
- When incidents are difficult to diagnose due to insufficient visibility.
- As part of a production readiness process.
- When onboarding a new system for assessment.

---

## Estimated Duration

| System Size | Estimated Duration |
|-------------|-------------------|
| Small | 1–2 hours |
| Medium | 2–4 hours |
| Large | 4–6 hours |

---

## Preparation

1. Read `docs/08-observability.md`.
2. Read `docs/00-rule-catalog.md` — OBS section.
3. Open `reviews/06-observability-review.md` as the working document.
4. Locate: logging configuration, metrics registration, tracing setup, alert definitions.
5. Identify the observability stack: Serilog/NLog, OpenTelemetry, Prometheus, Grafana, or equivalent.

---

## Execution Steps

### Step 1 — Evaluate Structured Logging

- Verify that a structured logging framework is configured (Serilog, NLog, Microsoft.Extensions.Logging with structured output).
- Check that log statements use structured properties, not string interpolation: `Log.Information("Order {OrderId} created", orderId)` not `$"Order {orderId} created"`.
- Verify that log levels are used appropriately (Debug, Information, Warning, Error, Critical).
- Check that sensitive data (passwords, tokens, PII) is never logged.

Rule references: OBS-001, OBS-004.

### Step 2 — Evaluate Correlation Identifiers

- Verify that a correlation or trace identifier is included in all log entries.
- Check that the identifier propagates across service boundaries (HTTP headers, message headers).
- Verify that the identifier is included in error responses returned to callers.

Rule references: OBS-002.

### Step 3 — Evaluate Metrics

- Verify that meaningful business and technical metrics are captured.
- Check for request count, error rate, latency percentiles (p50, p95, p99).
- Verify that custom domain metrics are defined where relevant (orders processed, payments failed).

Rule references: OBS-003.

### Step 4 — Evaluate Distributed Tracing

- Verify that OpenTelemetry is configured for distributed tracing.
- Check that traces span across service boundaries and include database, HTTP, and messaging operations.
- Verify that spans include meaningful attributes (operation name, identifiers, status).

Rule references: OBS-005, OBS-006.

### Step 5 — Evaluate OpenTelemetry Adoption

- Verify that OpenTelemetry SDK is used as the standard for logs, metrics, and traces.
- Check that an OTLP exporter is configured pointing to the observability backend.

Rule references: OBS-006.

### Step 6 — Check for Sensitive Data in Logs

- Search for logging of request bodies, response bodies, authorization headers, or connection strings.
- Identify any `LogInformation` or `LogDebug` calls that include user data, credentials, or PII.

Rule references: OBS-004.

### Step 7 — Document Findings

- Record each finding with evidence, applicable rule, and severity.
- Note the observability gap and its operational impact.

---

## Evidence Collection Guide

| Evidence Type | Where to Find |
|---------------|--------------|
| Logging configuration | `Program.cs`, `appsettings.json`, `Serilog.WriteTo` |
| Structured log usage | Log call sites across the codebase |
| Correlation identifier | Middleware, `ILogger` scope, HTTP headers |
| Metrics | `Meter`, `Counter`, `Histogram` registrations |
| Tracing | `AddOpenTelemetry`, `ActivitySource` |
| Sensitive data in logs | Search for log statements near authentication or payment code |

---

## Common Findings

- String interpolation in log statements instead of structured properties.
- No correlation identifier propagated across service calls.
- Logging only at Error level — insufficient for diagnosing issues in production.
- No metrics beyond what the framework provides by default.
- No distributed tracing configured for cross-service calls.
- Request bodies or tokens logged in debug statements.

---

## Red Flags

- `logger.LogInformation($"Password: {password}")` or equivalent.
- No logging configuration beyond the default console logger.
- No correlation identifier in any log entry.
- Authorization tokens or API keys present in any log output.

---

## Output

Upon completion, the reviewer produces:

1. A completed `reviews/06-observability-review.md`.
2. An Executive Summary describing observability coverage.
3. Prioritized recommendations identifying the most significant visibility gaps.

---

## Quality Checklist

- ☐ Structured logging is explicitly verified — not just presence but correct usage.
- ☐ Sensitive data logging is explicitly searched and documented.
- ☐ Correlation identifiers are traced through the call chain.
- ☐ Every finding references an OBS rule.
- ☐ Positive findings are documented.
- ☐ Executive Summary is complete.

---

## Related Documents

- reviews/06-observability-review.md
- scorecards/06-observability-scorecard.md
- docs/08-observability.md
- docs/00-rule-catalog.md

---

## Future Enhancements

Future versions of this playbook may include:

- OpenTelemetry setup and configuration walkthrough.
- Alert quality assessment guidance.
- Dashboard review criteria.
- Log volume and noise analysis guidance.
