# Messaging Review Playbook

> Step-by-step guidance for executing a Messaging Compliance Review.

---

## Purpose

This playbook provides repeatable execution guidance for conducting a Messaging Compliance Review using the Engineering Assessment Framework.

It answers: How should this review be executed?

---

## Audience

- Software Architects
- Principal Engineers
- Technical Leads

---

## Prerequisites

- Access to the source repository.
- Familiarity with `reviews/07-messaging-review.md`.
- Familiarity with MSG rules in `docs/00-rule-catalog.md`.
- Knowledge of the messaging technology in use (MassTransit, RabbitMQ, Azure Service Bus, or equivalent).

---

## When to Execute

- When the system uses asynchronous messaging or event-driven patterns.
- Before major releases involving messaging changes.
- When message processing failures or duplicates are reported.
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

1. Read `docs/09-messaging.md`.
2. Read `docs/00-rule-catalog.md` — MSG section.
3. Open `reviews/07-messaging-review.md` as the working document.
4. Identify all message types, producers, consumers, and message broker configuration.
5. Locate: MassTransit configuration, consumer implementations, Saga or state machine definitions if present.

---

## Execution Steps

### Step 1 — Evaluate Messaging Appropriateness

- Verify that asynchronous messaging is used for operations where decoupling, reliability, or temporal independence is required.
- Identify use cases where synchronous HTTP would be more appropriate (real-time query responses).

Rule references: MSG-001.

### Step 2 — Evaluate Message Immutability

- Verify that message contracts are defined as records or immutable types.
- Check that message contracts do not contain mutable state or behavior.
- Verify that message contracts do not expose domain types directly.

Rule references: MSG-002.

### Step 3 — Evaluate Consumer Idempotency

- For each consumer, verify that processing the same message twice produces the same result.
- Check for deduplication mechanisms: idempotency keys, processed message tracking.
- Identify consumers that perform non-idempotent operations (payment processing, email sending) without deduplication guards.

Rule references: MSG-003.

### Step 4 — Evaluate Retry Design

- Verify that consumers are designed to be retried safely.
- Check that retry policies are configured on the consumer or the message broker.
- Verify that dead letter queues or error queues are configured for unprocessable messages.

Rule references: MSG-004.

### Step 5 — Evaluate Outbox Pattern

- Identify operations that combine database writes and message publishing in the same operation.
- Verify that the Outbox Pattern is used where message publishing must be consistent with database changes.
- Check for scenarios where messages are published before the database transaction commits.

Rule references: MSG-005.

### Step 6 — Evaluate Business Logic in Consumers

- Verify that consumers delegate to Application layer handlers or commands.
- Identify consumers that contain business logic directly (validation, calculation, decision-making).

Rule references: MSG-006, ANTI-007.

### Step 7 — Document Findings

- Record each finding with evidence, applicable rule, and severity.
- Identify the specific consumer or message type affected.

---

## Evidence Collection Guide

| Evidence Type | Where to Find |
|---------------|--------------|
| Message contracts | `Messages/`, `Events/`, `Commands/` folders |
| Consumer implementations | Classes implementing `IConsumer<T>` |
| MassTransit configuration | `AddMassTransit`, bus configuration |
| Outbox configuration | `AddEntityFrameworkOutbox`, Outbox middleware |
| Dead letter configuration | Error queue configuration in broker settings |
| Retry policies | `UseMessageRetry`, `UseScheduledRedelivery` |

---

## Common Findings

- Consumers that perform non-idempotent operations without deduplication.
- Message publishing inside a database transaction without the Outbox Pattern.
- Business logic implemented directly in consumers.
- No retry policy configured — messages fail permanently on transient errors.
- Message contracts defined as mutable classes.
- No dead letter queue configured for failed messages.

---

## Red Flags

- Consumer sends an email or charges a payment without idempotency protection.
- `await _bus.Publish(message)` called before `await dbContext.SaveChangesAsync()` in the same handler.
- Consumer class contains validation rules, calculation logic, or domain decisions.
- No error queue or dead letter configuration — failed messages are silently discarded.

---

## Output

Upon completion, the reviewer produces:

1. A completed `reviews/07-messaging-review.md`.
2. An Executive Summary describing messaging reliability.
3. Prioritized recommendations addressing the highest-risk findings.

---

## Quality Checklist

- ☐ Every consumer is evaluated for idempotency.
- ☐ Outbox Pattern usage is verified for all combined DB + publish operations.
- ☐ Dead letter and retry configuration is confirmed.
- ☐ Every finding references a MSG or ANTI rule.
- ☐ Positive findings are documented.
- ☐ Executive Summary is complete.

---

## Related Documents

- reviews/07-messaging-review.md
- scorecards/07-messaging-scorecard.md
- docs/09-messaging.md
- docs/00-rule-catalog.md

---

## Future Enhancements

Future versions of this playbook may include:

- MassTransit Saga review guidance.
- Event Sourcing review checklist.
- Message schema versioning review.
- Dead letter queue monitoring setup guidance.
