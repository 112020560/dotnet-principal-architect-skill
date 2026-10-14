
# Observability Rules

> *If a production issue cannot be explained, the system is not observable.*

---

# Purpose

This document defines engineering rules for implementing observability in modern .NET applications.

Observability is a first-class architectural concern and enables teams to understand system behavior without modifying code.

Rule IDs and descriptions in this document must always match `docs/00-rule-catalog.md` exactly — if a number here does not match the catalog, the catalog wins and this file has drifted.

---

# Observability Principles

- Design for production diagnostics.
- Correlate everything.
- Prefer structured data over plain text.
- Metrics complement logs.
- Traces explain distributed behavior.
- Telemetry should answer operational questions.

---

# Rule OBS-001 — Use Structured Logging

**Severity:** Critical

Avoid string concatenation. Prefer named properties.

Good:

```
logger.LogInformation("Customer {CustomerId} approved.", id);
```

Bad:

```
logger.LogInformation($"Customer {id} approved.");
```

---

# Rule OBS-002 — Include Correlation Identifiers

Every inbound request should have a correlation identifier.

Prefer standards such as:

- traceparent
- tracestate

Support application identifiers such as:

- X-Trace-Id
- X-Correlation-Id

Related Rules: HTTP (correlation propagation), MSG-008.

---

# Rule OBS-003 — Capture Meaningful Metrics

Capture metrics for:

- Request duration
- Throughput
- Error rate
- Queue depth
- Active workers
- Cache hit ratio

Metrics should support dashboards and alerting.

---

# Rule OBS-004 — Never Log Secrets or Sensitive Data

Never log:

- Passwords
- Secrets
- JWT tokens
- OTP values
- CVV
- Full PAN
- Private keys

Mask or omit sensitive values.

Related Rules: SEC-004, HTTP-009.

---

# Rule OBS-005 — Emit Traces Across Distributed Systems

Trace requests across:

- APIs
- Message brokers
- Databases
- Background workers

Distributed tracing is mandatory once a request crosses more than one process.

---

# Rule OBS-006 — Adopt OpenTelemetry as the Standard

Logs answer "what happened," metrics answer "how often," and traces answer "where it happened" — use all three together instead of relying on logs alone.

Prefer OpenTelemetry as the vendor-neutral standard for producing and exporting all three, so the chosen backend (Prometheus, Grafana, Jaeger, Seq, or a cloud-native equivalent) stays replaceable.

---

# Additional Engineering Guidance

The following guidance is established practice but is not a numbered rule in `docs/00-rule-catalog.md` — do not cite it with a rule ID.

## Log Meaningful Events

Logs should describe business events, state transitions, external communication, failures, and retries. Avoid noisy logs with little operational value.

## Instrument External Dependencies

Capture telemetry for HTTP, RabbitMQ, Kafka, Redis, SQL, and gRPC — dependency failures should be visible, not inferred from downstream symptoms.

## Errors Must Include Context

Log correlation ID, operation, dependency, duration, and exception type. Avoid logging only the exception message.

## Health Checks Reflect Operational Readiness

Separate liveness from readiness, and include only genuinely critical dependencies. See CLOUD-004, API-009's related guidance.

## Telemetry Should Be Configurable

Allow log levels and exporters to change without code modification, to support different production environments.

## Alert on Symptoms, Not Events

Prefer alerts on error rate, latency, saturation, and availability over alerting on every individual exception — alert fatigue erodes the value of alerting.

## Business Events Are Observable

Important business actions should generate telemetry (customer created, loan approved, payment completed). See MSG-009.

## Sampling Must Be Intentional

Document the sampling strategy, sampling rate, and any critical flows explicitly excluded from sampling.

---

# Common Observability Smells

- Missing correlation IDs
- Plain text logging
- Logging secrets
- No metrics
- No distributed tracing
- Excessive debug logging
- Missing health checks
- Alert fatigue

---

# Observability Review Checklist

- Is every request traceable?
- Are logs structured?
- Are sensitive values protected?
- Are metrics available?
- Are traces correlated?
- Are dependencies instrumented?
- Are health checks meaningful?
- Are business events observable?
- Is telemetry configurable?
- Are alerts actionable?

---

# Recommended Stack

- OpenTelemetry
- Serilog
- Prometheus
- Grafana
- Jaeger / Tempo
- Seq
- OpenSearch / Elasticsearch

---

# References

- OpenTelemetry Specification
- Microsoft Logging Documentation
- Microsoft Health Checks
- OpenTelemetry .NET
- Prometheus Documentation
- Grafana Documentation
