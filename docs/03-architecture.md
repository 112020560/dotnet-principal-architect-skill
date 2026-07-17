# Architecture Rules

> *Good architecture is measured by how easily a system can evolve while preserving business correctness.*

---

# Purpose

This document defines the architectural rules used by the Principal .NET Architect Skill.

These rules establish the engineering standards for designing modern .NET applications.

The goal is not to enforce a specific architectural style.

The goal is to evaluate whether an architecture is appropriate, maintainable, scalable, and aligned with business requirements.

---

# Architecture Principles

Architecture exists to solve business problems.

Good architecture reduces complexity instead of introducing it.

Patterns, frameworks, and technologies are tools—not objectives.

Every architectural recommendation must preserve the principles defined in **01-philosophy.md** and follow the review process defined in **02-review-process.md**.

---

# Rule ARCH-001 — Business Logic Must Not Live Outside the Domain or Application Layer

## Severity

Critical

## Applies To

- ASP.NET Core
- Hexagonal Architecture
- Clean Architecture
- Onion Architecture
- Vertical Slice Architecture
- DDD

## Motivation

Business rules are the most valuable asset of any software system.

They must remain independent from frameworks, transport protocols, persistence technologies, and infrastructure concerns.

## Problem

Business logic implemented inside Controllers, Endpoints, Middleware, Background Services, Entity Framework configurations, or Infrastructure components creates tight coupling and makes the domain difficult to evolve and test.

## Good

Business rules are implemented inside:

- Domain
- Application Services
- Domain Services
- Aggregates

## Bad

Business rules implemented inside:

- Controllers
- Minimal API Endpoints
- Middleware
- DbContext
- Repository implementations
- HTTP Clients

## Exceptions

Simple request validation and transport concerns are acceptable outside the domain.

## Trade-offs

Moving business logic into the Domain may require additional abstractions but significantly improves maintainability and testability.

---

# Rule ARCH-002 — Dependencies Must Always Point Toward the Business

## Severity

Critical

## Applies To

All architectures.

## Motivation

Business rules should never depend on infrastructure.

Infrastructure should depend on business rules.

## Problem

When the Domain references EF Core, ASP.NET Core, RabbitMQ, Serilog, or other infrastructure libraries, business logic becomes tightly coupled to implementation details.

## Good

Infrastructure depends on Application.

Application depends on Domain.

Domain depends on nothing.

## Bad

Domain referencing:

- Entity Framework Core
- ASP.NET Core
- RabbitMQ
- Serilog
- Redis
- HttpClient

## Exceptions

Shared abstractions that represent business concepts are acceptable.

---

# Rule ARCH-003 — Controllers and Endpoints Must Remain Thin

## Severity

High

## Motivation

Controllers are transport adapters.

Their responsibility is receiving requests and returning responses.

## Responsibilities

Controllers should only:

- Validate transport data
- Delegate work
- Return HTTP responses

They should never:

- Execute business rules
- Access databases directly
- Coordinate transactions
- Implement workflow logic

## Trade-offs

Thin controllers increase the number of application classes but dramatically improve separation of concerns.

---

# Rule ARCH-004 — The Application Layer Orchestrates Use Cases

## Severity

High

## Motivation

Application Services coordinate work.

They do not implement business rules.

## Responsibilities

Application Services may:

- Coordinate repositories
- Publish events
- Start transactions
- Call external services
- Invoke domain logic

They should not contain business rules that belong to the domain model.

## Notes

Application is an orchestrator.

The Domain is the decision maker.

---

# Rule ARCH-005 — Repositories Represent Business Intent

## Severity

High

## Motivation

Repositories exist to express persistence operations using the language of the business.

## Good

Examples:

- GetActiveCustomer()
- ExistsByIdentification()
- FindPendingApplication()

## Avoid

Generic repositories that expose persistence mechanics instead of business intent.

Examples:

- GetAll()
- Find()
- Query()

## Exceptions

Generic repositories may be acceptable for internal infrastructure utilities.

---

# Rule ARCH-006 — Domain Models Must Not Leak Infrastructure

## Severity

Critical

## Motivation

Business entities should remain independent of persistence frameworks.

## Avoid

Domain entities implementing:

- IEntityTypeConfiguration
- IDataReader
- DbContext
- Repository logic
- Serialization concerns

Avoid persistence-specific attributes when possible.

## Goal

A domain model should be reusable regardless of the persistence technology.

---

# Rule ARCH-007 — Architectural Boundaries Must Be Explicit

## Severity

High

## Motivation

Every architectural boundary should have a clearly defined responsibility.

Typical boundaries include:

- Presentation
- Application
- Domain
- Infrastructure

Each layer should expose only what the next layer requires.

Avoid leaking implementation details across boundaries.

---

# Rule ARCH-008 — Architecture Must Follow Business Boundaries

## Severity

High

## Motivation

Business capabilities define architectural boundaries.

Technology should never define service boundaries.

## Good

Services organized around business capabilities.

Examples:

- CRM
- Payments
- Credit
- Identity
- Notifications

## Avoid

Services organized around technologies.

Examples:

- Database Service
- Logging Service
- EF Core Service

---

# Rule ARCH-009 — Prefer Simplicity Until Complexity Is Justified

## Severity

Medium

## Motivation

Architecture should evolve together with the business.

Avoid introducing complexity before it becomes necessary.

Examples include:

- CQRS
- Event Sourcing
- Microservices
- Saga orchestration
- Distributed transactions

These are powerful techniques but should only be introduced when justified by measurable business or technical requirements.

---

# Rule ARCH-010 — Every Architectural Decision Must Be Justifiable

## Severity

Critical

## Motivation

Architecture is a sequence of engineering decisions.

Every significant decision should be explainable.

Questions every architect should be able to answer:

- Why was this decision made?
- Which alternatives were considered?
- What trade-offs exist?
- What problem does this solve?
- What evidence supports this choice?

If these questions cannot be answered, the decision should be reconsidered.

---

# Architecture Review Checklist

During an architecture review, verify:

- Business logic is properly isolated.
- Dependencies point inward.
- Controllers remain thin.
- Application orchestrates use cases.
- Domain owns business rules.
- Infrastructure remains replaceable.
- Boundaries are explicit.
- Business capabilities define modules.
- Complexity is justified.
- Architectural decisions are documented.

---

# Common Architecture Smells

Watch for the following indicators:

- Fat Controllers
- Anemic Domain Model
- Infrastructure Leakage
- Circular Dependencies
- Generic Repository Abuse
- God Services
- Shared Database Between Services
- Business Logic Inside Middleware
- Business Logic Inside Background Workers
- Excessive Layering Without Value

Architecture smells are not always defects.

They are indicators that deserve investigation.

---

# Decision Framework

Before recommending an architectural change, ask:

1. Does this solve a business problem?
2. Is the current implementation incorrect?
3. Is there measurable evidence?
4. Will maintainability improve?
5. Is additional complexity justified?
6. Can the team support the new architecture?
7. Are the trade-offs acceptable?

If the answer to any of these questions is unclear, gather more information before recommending changes.

---

# Summary

Architecture should maximize:

- Correctness
- Maintainability
- Evolvability
- Reliability
- Simplicity

Architecture should minimize:

- Coupling
- Accidental complexity
- Framework dependency
- Business rule duplication
- Technology lock-in

The best architecture is not the most sophisticated.

The best architecture is the one that solves today's business problems while remaining easy to evolve tomorrow.