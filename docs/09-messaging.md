
# Messaging Rules

> *Messaging is about reliable communication between business capabilities, not simply moving data from one process to another.*

---

# Purpose

This document defines engineering rules for designing asynchronous communication in modern .NET systems.

The objective is to build reliable, observable, scalable, and resilient message-driven architectures.

Rule IDs and descriptions in this document must always match `docs/00-rule-catalog.md` exactly — if a number here does not match the catalog, the catalog wins and this file has drifted.

---

# Messaging Principles

- Events represent facts.
- Commands represent intent.
- Messages are contracts.
- Delivery is not processing.
- Idempotency is mandatory.
- Reliability is designed, not assumed.

---

# Rule MSG-001 — Prefer Asynchronous Communication When Appropriate

**Severity:** Critical

Do not introduce a broker simply because the architecture uses microservices.

Messaging is appropriate when systems require:

- Decoupling
- Scalability
- Asynchronous workflows
- Event-driven integration
- Resiliency

---

# Rule MSG-002 — Messages Are Immutable

Once published, a message's shape for a given version must not change. Add new fields; never repurpose or redefine an existing one, and never mutate a message after it has been handed to the broker.

Treat every message as a public contract: distinguish Commands (express intent, one expected consumer, may fail) from Events (represent completed facts, may have multiple consumers, should not be rejected because they already happened). Version contracts carefully and avoid breaking existing consumers.

---

# Rule MSG-003 — Consumers Are Idempotent

Consumers should safely process duplicate deliveries.

Typical techniques:

- Message IDs
- Processed message store
- Business idempotency keys

Related Rules: MSG-007.

---

# Rule MSG-004 — Design for Retries

Retry behavior must be designed into a messaging flow up front — not bolted on after the first production incident. Decide, per message type: how many attempts, what happens after the last one (Dead Letter Queue), and which failures are even retryable.

Messages that cannot be processed after retries are exhausted should be routed to a Dead Letter Queue. Never discard failures silently.

Related Rules: MSG-003, MSG-007.

---

# Rule MSG-005 — Use the Outbox Pattern When Consistency Is Required

When updating a database and publishing an event belong to the same business operation, prefer the Outbox Pattern.

Avoid dual-write inconsistencies.

---

# Rule MSG-006 — Avoid Business Logic Inside Consumers

A consumer's job is to deserialize a message and dispatch it to the Application layer — not to decide a business outcome itself.

## Bad

A consumer branching on business state to decide whether a payment should be approved, instead of delegating that decision to a Domain/Application Service.

## Good

The consumer calls an Application Service or publishes a Command; the Domain makes the decision.

Related Rules: ARCH-002, ARCH-012.

---

# Rule MSG-007 — Retry Policies Must Be Intentional

Retries should distinguish:

- Transient failures
- Permanent failures

Avoid infinite retry loops.

Implement retry policies with a resilience library (Polly, or the retry primitives built into the messaging framework) rather than a hand-rolled `while(true)` loop. See ANTI-016.

Related Rules: HTTP-002.

---

# Rule MSG-008 — Preserve Correlation Across Messages

Propagate:

- traceparent
- X-Trace-Id
- CorrelationId

Distributed tracing must continue beyond HTTP.

Related Rules: OBS-002.

---

# Rule MSG-009 — Prefer Business Events

Good:

- CustomerCreated
- LoanApproved
- PaymentCompleted

Avoid technical events such as:

- RecordInserted
- DatabaseUpdated

---

# Rule MSG-010 — Keep Messages Small

Transmit only the information required.

Large payloads increase latency and broker resource consumption.

Prefer references to external content when appropriate.

---

# Additional Engineering Guidance

The following guidance is established practice but is not a numbered rule in `docs/00-rule-catalog.md` — do not cite it with a rule ID.

## Ordering Should Never Be Assumed

Do not assume message ordering unless the broker explicitly guarantees it and the business requires it. Design consumers accordingly.

## Long Running Workflows Require Orchestration

Use orchestration or sagas only when workflows span multiple services and compensation is required. Avoid unnecessary distributed workflows.

## Observe the Messaging System

Capture telemetry for queue depth, publish latency, consumer latency, retry count, dead letters, and throughput.

## Business Failures Are Not Infrastructure Failures

Differentiate validation failure, business rejection, infrastructure outage, and serialization error — each requires a different operational response.

## Technology Is an Implementation Detail

RabbitMQ, Kafka, Azure Service Bus, MassTransit, and NServiceBus are implementation choices. Business contracts should remain independent of messaging technology.

---

# Common Messaging Smells

- Dual writes
- Missing idempotency
- Infinite retries
- Technical event names
- Oversized messages
- Shared mutable payloads
- Ignored dead letters
- Missing correlation
- Chatty event storms

---

# Messaging Review Checklist

- Does messaging solve a business need?
- Are commands and events distinguished?
- Are contracts versioned?
- Are consumers idempotent?
- Is the Outbox Pattern considered?
- Are DLQs configured?
- Are retries intentional?
- Is correlation propagated?
- Is telemetry available?
- Is the messaging technology isolated?

---

# Recommended Stack

- RabbitMQ
- MassTransit
- Kafka
- Azure Service Bus
- OpenTelemetry
- Serilog
- Prometheus
- Grafana

---

# References

- Enterprise Integration Patterns
- Microsoft Messaging Guidance
- MassTransit Documentation
- RabbitMQ Documentation
- Kafka Documentation
- Udi Dahan - Reliable Messaging
