# Domain & DDD Review Playbook

> Step-by-step guidance for executing a Domain and Domain-Driven Design Compliance Review.

---

## Purpose

This playbook provides repeatable execution guidance for conducting a Domain and DDD Compliance Review using the Engineering Assessment Framework.

It answers: How should this review be executed?

---

## Audience

- Software Architects
- Principal Engineers
- Domain Experts (as consultants)
- Technical Leads

---

## Prerequisites

- Access to the source repository.
- Access to domain documentation, event storming outputs, or business glossary if available.
- Familiarity with `reviews/13-domain-ddd-review.md`.
- Familiarity with ARCH rules in `docs/00-rule-catalog.md` related to domain design.

---

## When to Execute

- When the codebase does not reflect the business domain clearly.
- Before major domain model changes.
- When onboarding a new system for assessment.
- When business and engineering teams use different terminology for the same concepts.

---

## Estimated Duration

| System Size | Estimated Duration |
|-------------|-------------------|
| Small | 2–3 hours |
| Medium | 4–8 hours |
| Large | 1–2 days |

---

## Preparation

1. Read `docs/03-architecture.md` — domain design sections.
2. Read `docs/00-rule-catalog.md` — ARCH section.
3. Open `reviews/13-domain-ddd-review.md` as the working document.
4. Request a business domain overview or glossary from the product team if possible.
5. Identify the declared bounded contexts and their responsibilities.

---

## Execution Steps

### Step 1 — Evaluate Bounded Context Definition

- Identify the bounded contexts in the system.
- Verify that each bounded context has clear ownership and a defined responsibility.
- Check for overlapping responsibilities between bounded contexts.
- Verify that bounded contexts do not share the same database tables.

Rule references: ARCH-001, DB-001.

### Step 2 — Evaluate Ubiquitous Language

- Compare the language used in the codebase (class names, method names, variable names) with the business domain vocabulary.
- Identify mismatches: technical terms where business terms should be used.
- Check that the same concept is named consistently throughout the codebase.
- Verify that the codebase would be understandable to a domain expert without translation.

Rule references: ARCH-004.

### Step 3 — Evaluate Aggregate Design

- Identify the aggregates in the Domain layer.
- Verify that aggregates enforce their own invariants and are self-contained.
- Check that external code modifies aggregates only through their public methods, not by directly setting properties.
- Verify that aggregate boundaries are appropriate — not too large (God Aggregate) and not too small (no cohesion).

Rule references: ARCH-004, ARCH-005.

### Step 4 — Evaluate Domain Services

- Verify that Domain Services encapsulate business logic that does not naturally belong to a single entity.
- Check that Domain Services are cohesive — focused on a single business concept.
- Verify that Domain Services do not depend on Infrastructure concerns.

Rule references: ARCH-005, ARCH-001.

### Step 5 — Evaluate Value Objects

- Identify concepts that should be Value Objects (money, address, email, coordinates).
- Verify that Value Objects are immutable.
- Check that equality is based on value, not identity.

### Step 6 — Evaluate Domain Events

- Identify whether Domain Events are used to communicate state changes across bounded contexts.
- Verify that Domain Events are named in past tense and describe what happened.
- Check that events are raised by the domain, not by infrastructure or application code.

### Step 7 — Evaluate Business Rule Location

- Verify that business rules are located in the Domain layer — in entities, aggregates, or domain services.
- Identify business rules that have leaked into Controllers, Application handlers, or Infrastructure.

Rule references: ARCH-002, ARCH-003, ANTI-001.

### Step 8 — Document Findings

- Record each finding with evidence, applicable rule, and severity.
- Include business context to explain why the finding matters.

---

## Evidence Collection Guide

| Evidence Type | Where to Find |
|---------------|--------------|
| Bounded context structure | Solution or project organization |
| Domain model | `Domain/`, `Core/`, entity and aggregate classes |
| Ubiquitous language | Class names, method names vs. business glossary |
| Aggregate roots | Classes with `IAggregateRoot` marker or equivalent |
| Value objects | Immutable classes representing business concepts |
| Domain events | Classes ending in `Event`, `DomainEvent` |
| Business rules in wrong layer | Validation in Controllers, logic in Repositories |

---

## Common Findings

- Codebase uses technical terms (User, Record, Entity) where business terms are available (Customer, Invoice, Order).
- Aggregate properties modified directly via setters instead of domain methods.
- Business rules implemented in Application handlers instead of the Domain.
- No Value Objects — money amounts stored as `decimal` without currency context.
- Multiple bounded contexts sharing a single DbContext.
- Domain Events not used — state communicated via polling or direct service calls.

---

## Red Flags

- Domain project contains references to EF Core, HttpClient, or other infrastructure packages.
- Aggregate with 30+ public properties and no behavioral methods.
- Business validation scattered across Controllers, Services, and Database constraints.
- Codebase terms completely differ from business terms — engineers and domain experts cannot communicate.

---

## Output

Upon completion, the reviewer produces:

1. A completed `reviews/13-domain-ddd-review.md`.
2. An Executive Summary describing domain model health and alignment.
3. Prioritized recommendations connecting domain issues to business impact.

---

## Quality Checklist

- ☐ Ubiquitous language alignment is explicitly evaluated.
- ☐ Aggregate invariant enforcement is verified.
- ☐ Business rule location is explicitly verified.
- ☐ Every finding references an ARCH rule.
- ☐ Findings include business context, not just technical observations.
- ☐ Positive findings are documented.
- ☐ Executive Summary is complete.

---

## Related Documents

- reviews/13-domain-ddd-review.md
- scorecards/13-domain-ddd-scorecard.md
- docs/03-architecture.md
- docs/00-rule-catalog.md

---

## Future Enhancements

Future versions of this playbook may include:

- Event storming facilitation guidance.
- Context map creation guidance.
- Anti-Corruption Layer review checklist.
- Domain model visualization techniques.
