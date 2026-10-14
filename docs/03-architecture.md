# Architecture Rules

> *Good architecture is measured by how easily a system can evolve while preserving business correctness.*

---

# Purpose

This document defines the architectural rules used by the Principal .NET Architect Skill.

These rules establish the engineering standards for designing modern .NET applications.

The goal is not to enforce a specific architectural style.

The goal is to evaluate whether an architecture is appropriate, maintainable, scalable, and aligned with business requirements.

Rule IDs and descriptions in this document must always match `docs/00-rule-catalog.md` exactly — if a number here does not match the catalog, the catalog wins and this file has drifted.

---

# Architecture Principles

Architecture exists to solve business problems.

Good architecture reduces complexity instead of introducing it.

Patterns, frameworks, and technologies are tools—not objectives.

Every architectural recommendation must preserve the principles defined in **01-philosophy.md** and follow the review process defined in **02-review-process.md**.

---

# Rule ARCH-001 — Domain Is Independent From Infrastructure

## Severity

Critical

## Motivation

Domain entities and business rules should remain independent of persistence frameworks, transport libraries, and other infrastructure concerns. The Domain is the most durable layer of the system; infrastructure changes far more often.

## Bad

- Domain entities implementing `IEntityTypeConfiguration`, `IDataReader`, `DbContext`, repository logic, or serialization concerns.
- Domain referencing Entity Framework Core, ASP.NET Core, RabbitMQ, Serilog, Redis, or `HttpClient` directly.

## Good

A Domain project with zero package references to infrastructure or framework libraries.

## Exceptions

Shared abstractions that represent business concepts (e.g., a `Money` value object with no framework dependency) are acceptable.

---

# Rule ARCH-002 — Business Rules Belong to the Domain

## Severity

Critical

## Motivation

Business rules are the most valuable asset of any software system. They must remain independent from frameworks, transport protocols, persistence technologies, and infrastructure concerns.

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

# Rule ARCH-003 — Business Logic Is Isolated From Transport and Persistence

## Severity

High

## Motivation

Controllers, endpoints, and persistence adapters are transport/technology boundaries. Their responsibility is receiving input and returning output — not deciding business outcomes.

## Responsibilities

Controllers and endpoints should only:

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

## Related Rules

API-002 restates this rule from the ASP.NET Core surface specifically.

---

# Rule ARCH-004 — Domain Models Represent Business Concepts

## Severity

High

## Motivation

Entities, Value Objects, and Aggregates should model real business concepts and enforce invariants — not merely mirror database tables as data bags.

## Good

- `LoanApplication.Approve()` encapsulating the approval invariant inside the entity.
- `Money`, `EmailAddress` as Value Objects that validate themselves on construction.

## Bad

Anemic entities with public setters and no behavior, where all decision logic lives in external services instead of the model itself.

## Trade-offs

Rich domain models take more upfront design but prevent invariants from being scattered and duplicated across the codebase.

---

# Rule ARCH-005 — Domain Services Are Cohesive and Business-Oriented

## Severity

Medium

## Motivation

A Domain Service should coordinate a single, well-named business operation — not accumulate unrelated responsibilities over time.

## Bad

A service that grows a new method for every unrelated feature request until it depends on a dozen unrelated collaborators.

## Good

Services named and scoped around one business capability (e.g., `LoanApprovalService`, not `LoanService` that also sends notifications and generates reports).

## Related Rules

ANTI-002 (God Service).

---

# Rule ARCH-006 — Application Layer Orchestrates Business Use Cases

## Severity

High

## Motivation

Application Services coordinate work. They do not implement business rules.

## Responsibilities

Application Services may:

- Coordinate repositories
- Publish events
- Start transactions
- Call external services
- Invoke domain logic

They should not contain business rules that belong to the domain model.

## Notes

Application is an orchestrator. The Domain is the decision maker.

---

# Rule ARCH-007 — Commands and Queries Have a Single Responsibility

## Severity

Medium

## Motivation

A command or query handler should express one business intent, so handlers stay testable and changes stay localized to the use case they affect.

## Bad

A single handler that branches on a "mode" or "type" parameter to perform several unrelated operations.

## Good

One handler per use case, named after the business intent (`ApproveLoanCommandHandler`, not a generic `LoanCommandHandler`).

## Exceptions

Small CRUD services may share a thin generic handler when there is no meaningful per-case business logic.

---

# Rule ARCH-008 — Dependencies Point Inward

## Severity

Critical

## Motivation

Business rules should never depend on infrastructure. Infrastructure should depend on business rules.

## Problem

When the Domain references EF Core, ASP.NET Core, RabbitMQ, Serilog, or other infrastructure libraries, business logic becomes tightly coupled to implementation details.

## Good

- Infrastructure depends on Application.
- Application depends on Domain.
- Domain depends on nothing.

## Bad

Domain referencing Entity Framework Core, ASP.NET Core, RabbitMQ, Serilog, Redis, or `HttpClient`.

## Exceptions

Shared abstractions that represent business concepts are acceptable.

---

# Rule ARCH-009 — Depend on Abstractions, Not Implementations

## Severity

High

## Motivation

Application and Domain code should depend on interfaces (ports) owned by the business, not on concrete infrastructure classes.

## Good

`IOrderRepository` defined in Application/Domain, implemented by a concrete class in Infrastructure.

## Bad

Application code instantiating a concrete `SqlOrderRepository`, `HttpClient`, or a specific message-broker client directly.

## Trade-offs

Introduces an interface per dependency — justified when the implementation is genuinely replaceable or needs to be faked in tests.

---

# Rule ARCH-010 — Infrastructure Implements Abstractions Only

## Severity

Medium

## Motivation

Infrastructure projects should contain adapters that implement ports defined by Application/Domain — not their own parallel business logic or a public API surface the rest of the system depends on directly.

## Bad

Other layers referencing concrete Infrastructure classes instead of the abstraction; Infrastructure exposing helper methods that encode business decisions.

## Good

Infrastructure types are only ever referenced through their interface, wired up at the composition root (DI container).

---

# Rule ARCH-011 — Persistence Is Isolated Behind Ports or Repositories

## Severity

High

## Motivation

Repositories exist to express persistence operations using the language of the business, and to isolate the rest of the system from the specific persistence technology.

## Good

Examples:

- `GetActiveCustomer()`
- `ExistsByIdentification()`
- `FindPendingApplication()`

## Avoid

Generic repositories that expose persistence mechanics instead of business intent:

- `GetAll()`
- `Find()`
- `Query()`

## Exceptions

Generic repositories may be acceptable for internal infrastructure utilities.

## Related Rules

DB-006, DB-007.

---

# Rule ARCH-012 — Infrastructure Contains No Business Rules

## Severity

Critical

## Motivation

Infrastructure (persistence, messaging, HTTP clients, background hosts) must execute decisions — it must not make them.

## Problem

Database triggers or stored procedures encoding business rules; HTTP client wrappers that decide whether to call an external system based on business state; hosted services that decide business outcomes instead of just orchestrating a decision already made.

## Good

Infrastructure receives a decision and executes it (save, send, call). Domain/Application made the decision.

## Bad

A background worker or repository implementation branching on business status to decide whether an action is allowed.

## Related Rules

ANTI-006 (Business Logic in Middleware), ANTI-007 (Business Logic in Background Services).

---

# Additional Engineering Guidance

The following guidance is established practice but is not a numbered rule in `docs/00-rule-catalog.md` — do not cite it with a rule ID.

## Architecture Must Follow Business Boundaries

Business capabilities define architectural boundaries (CRM, Payments, Credit, Identity), not technology (Database Service, Logging Service). Services organized around technology tend to require cross-service coordination for every business change.

## Prefer Simplicity Until Complexity Is Justified

Avoid introducing CQRS, Event Sourcing, microservices, Saga orchestration, or distributed transactions before they are justified by a measurable business or technical requirement. See ANTI-013 (Overengineering).

## Every Architectural Decision Must Be Justifiable

Every significant decision should be explainable: why it was made, what alternatives were considered, what trade-offs exist, and what evidence supports the choice. If these questions cannot be answered, reconsider the decision.

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
