
# Messaging Rules

> *Messaging is about reliable communication between business capabilities, not simply moving data from one process to another.*

---

# Purpose

This document defines engineering rules for designing asynchronous communication in modern .NET systems.

The objective is to build reliable, observable, scalable, and resilient message-driven architectures.

---

# Messaging Principles

- Events represent facts.
- Commands represent intent.
- Messages are contracts.
- Delivery is not processing.
- Idempotency is mandatory.
- Reliability is designed, not assumed.

---

# Rule MSG-001 — Choose Messaging Only When It Solves a Business Problem

**Severity:** Critical

Do not introduce a broker simply because the architecture uses microservices.

Messaging is appropriate when systems require:

- Decoupling
- Scalability
- Asynchronous workflows
- Event-driven integration
- Resiliency

---

# Rule MSG-002 — Distinguish Commands from Events

Commands:

- Express intent
- Have one expected consumer
- May fail

Events:

- Represent completed facts
- May have multiple consumers
- Should not be rejected because they already happened

---

# Rule MSG-003 — Messages Are Contracts

Treat every message as a public contract.

Version contracts carefully.

Avoid breaking existing consumers.

---

# Rule MSG-004 — Consumers Must Be Idempotent

Consumers should safely process duplicate deliveries.

Typical techniques:

- Message IDs
- Processed message store
- Business idempotency keys

---

# Rule MSG-005 — Use the Outbox Pattern for Reliable Publishing

When updating a database and publishing an event belong to the same business operation, prefer the Outbox Pattern.

Avoid dual-write inconsistencies.

---

# Rule MSG-006 — Dead Letter Queues Are Operational Requirements

Messages that cannot be processed should be routed to a Dead Letter Queue.

Never discard failures silently.

---

# Rule MSG-007 — Retry Policies Must Be Intentional

Retries should distinguish:

- Transient failures
- Permanent failures

Avoid infinite retry loops.

---

# Rule MSG-008 — Preserve Correlation Across Messages

Propagate:

- traceparent
- X-Trace-Id
- CorrelationId

Distributed tracing must continue beyond HTTP.

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

# Rule MSG-011 — Ordering Should Never Be Assumed

Do not assume message ordering unless the broker explicitly guarantees it and the business requires it.

Design consumers accordingly.

---

# Rule MSG-012 — Long Running Workflows Require Orchestration

Use orchestration or sagas only when workflows span multiple services and compensation is required.

Avoid unnecessary distributed workflows.

---

# Rule MSG-013 — Observe the Messaging System

Capture telemetry for:

- Queue depth
- Publish latency
- Consumer latency
- Retry count
- Dead letters
- Throughput

---

# Rule MSG-014 — Business Failures Are Not Infrastructure Failures

Differentiate:

- Validation failure
- Business rejection
- Infrastructure outage
- Serialization error

Each requires a different operational response.

---

# Rule MSG-015 — Technology Is an Implementation Detail

RabbitMQ, Kafka, Azure Service Bus, MassTransit and NServiceBus are implementation choices.

Business contracts should remain independent of messaging technology.

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
