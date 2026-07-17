
# Observability Rules

> *If a production issue cannot be explained, the system is not observable.*

---

# Purpose

This document defines engineering rules for implementing observability in modern .NET applications.

Observability is a first-class architectural concern and enables teams to understand system behavior without modifying code.

---

# Observability Principles

- Design for production diagnostics.
- Correlate everything.
- Prefer structured data over plain text.
- Metrics complement logs.
- Traces explain distributed behavior.
- Telemetry should answer operational questions.

---

# Rule OBS-001 — Every Request Must Be Traceable

**Severity:** Critical

Every inbound request should have a correlation identifier.

Prefer standards such as:

- traceparent
- tracestate

Support application identifiers such as:

- X-Trace-Id
- X-Correlation-Id

---

# Rule OBS-002 — Use Structured Logging

Avoid string concatenation.

Prefer named properties.

Good:

logger.LogInformation("Customer {CustomerId} approved.", id);

Bad:

logger.LogInformation($"Customer {id} approved.");

---

# Rule OBS-003 — Log Meaningful Events

Logs should describe:

- Business events
- State transitions
- External communication
- Failures
- Retries

Avoid noisy logs with little operational value.

---

# Rule OBS-004 — Do Not Log Sensitive Data

Never log:

- Passwords
- Secrets
- JWT tokens
- OTP values
- CVV
- Full PAN
- Private keys

Mask or omit sensitive values.

---

# Rule OBS-005 — Metrics Measure System Health

Capture metrics for:

- Request duration
- Throughput
- Error rate
- Queue depth
- Active workers
- Cache hit ratio

Metrics should support dashboards and alerting.

---

# Rule OBS-006 — Distributed Tracing Is Mandatory for Distributed Systems

Trace requests across:

- APIs
- Message brokers
- Databases
- Background workers

Prefer OpenTelemetry.

---

# Rule OBS-007 — Instrument External Dependencies

Capture telemetry for:

- HTTP
- RabbitMQ
- Kafka
- Redis
- SQL
- gRPC

Dependency failures should be visible.

---

# Rule OBS-008 — Errors Must Include Context

Log:

- Correlation ID
- Operation
- Dependency
- Duration
- Exception type

Avoid logging only exception messages.

---

# Rule OBS-009 — Health Checks Reflect Operational Readiness

Separate:

- Liveness
- Readiness

Include critical dependencies only where appropriate.

---

# Rule OBS-010 — Logs, Metrics and Traces Must Work Together

Logs answer:

"What happened?"

Metrics answer:

"How often?"

Traces answer:

"Where did it happen?"

Use all three together.

---

# Rule OBS-011 — Telemetry Should Be Configurable

Allow log levels and exporters to change without code modifications.

Support different production environments.

---

# Rule OBS-012 — Alert on Symptoms, Not Events

Prefer alerts on:

- Error rate
- Latency
- Saturation
- Availability

Avoid alerting on every exception.

---

# Rule OBS-013 — Business Events Are Observable

Important business actions should generate telemetry.

Examples:

- Customer created
- Loan approved
- Payment completed
- OTP validated

---

# Rule OBS-014 — Sampling Must Be Intentional

Sampling reduces telemetry cost.

Document:

- Sampling strategy
- Sampling rate
- Critical flows excluded from sampling

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
