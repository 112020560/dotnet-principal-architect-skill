
# Database Rules

> *Data access is an architectural concern. Choose persistence technologies based on measurable business and technical requirements—not preference.*

---

# Purpose

This document defines the database and persistence engineering rules used by the Principal .NET Architect Skill.

The goal is to provide objective guidance for designing, reviewing, and optimizing persistence layers in modern .NET applications.

These rules apply regardless of the underlying database engine (PostgreSQL, SQL Server, MySQL, Oracle, etc.).

Rule IDs and descriptions in this document must always match `docs/00-rule-catalog.md` exactly — if a number here does not match the catalog, the catalog wins and this file has drifted.

---

# Guiding Principles

- Persistence serves the domain, not the opposite.
- Choose technologies based on workload characteristics.
- Measure before optimizing.
- Avoid dogmatic recommendations.
- Transactions represent business consistency boundaries.
- Database design is part of software architecture.

---

# Rule DB-001 — Every Bounded Context Owns Its Data

**Severity:** Critical

Persistence should respect bounded contexts and aggregate boundaries.

Avoid sharing tables or schemas between unrelated business capabilities.

Related Rules: ARCH-008, ANTI-010.

---

# Rule DB-002 — Model Aggregates Before Tables

**Severity:** High

Design the Aggregate and its invariants first. Let the table or document schema follow from that model — not the other way around.

Avoid:

- Designing tables first and reverse-engineering entities from columns.
- Letting a normalized relational schema force an Aggregate boundary that doesn't match the business transaction.

An Aggregate is a consistency boundary; a table is a storage detail.

---

# Rule DB-003 — EF Core Is a Context-Dependent Choice, Not a Default

**Severity:** High

Entity Framework Core excels at:

- Rich domain models
- CRUD applications
- Complex change tracking
- Productivity
- Maintainability

Decision Matrix

| Scenario | Rating |
|----------|--------|
| CRUD | ⭐⭐⭐⭐⭐ |
| Rich Domain | ⭐⭐⭐⭐⭐ |
| Maintainability | ⭐⭐⭐⭐⭐ |
| Reporting | ⭐⭐⭐☆☆ |
| Extreme Throughput | ⭐⭐☆☆☆ |
| Bulk Operations | ⭐⭐☆☆☆ |

EF Core optimizes developer productivity, not raw database throughput. It is never a universal default — see DB-005.

---

# Rule DB-004 — Dapper Is a Deliberate Choice for High-Throughput Reads

**Severity:** High

Dapper excels at:

- Read-heavy workloads
- Hand-crafted SQL
- Low allocations
- High throughput APIs
- Reporting

Decision Matrix

| Scenario | Rating |
|----------|--------|
| CRUD | ⭐⭐☆☆☆ |
| Rich Domain | ⭐⭐☆☆☆ |
| Reporting | ⭐⭐⭐⭐⭐ |
| High Throughput | ⭐⭐⭐⭐⭐ |
| Low Allocation | ⭐⭐⭐⭐⭐ |

Dapper is a micro ORM, not a replacement for domain modeling. Choosing it must be justified by a measured workload characteristic, not by default preference.

---

# Rule DB-005 — Choose the Right Persistence Strategy Per Workload

**Severity:** High

There is no universally correct persistence technology. Selection should consider business complexity, query complexity, throughput, team expertise, operational constraints, and maintainability.

Using EF Core and Dapper together is a mature engineering strategy, not a compromise:

- Writes → EF Core
- Reads → Dapper
- Same transaction when required
- Same connection when appropriate

Avoid migrating an entire application to one technology without evidence.

---

# Rule DB-006 — Repositories Express Business Intent

Repositories should expose business language.

Prefer:

- `ExistsByIdentification()`
- `GetPendingLoan()`
- `FindActiveCustomer()`

Avoid:

- `GetAll()`
- `Query()`
- `Find()`

Related Rules: ARCH-011.

---

# Rule DB-007 — Avoid Generic Repository Abuse

A generic `IRepository<T>` that exposes `GetAll()`, `Find()`, `Query()`, or a raw `IQueryable` leaks persistence mechanics into higher layers and erases business language.

`IQueryable` returned outside the Infrastructure layer is the clearest symptom: it lets any caller compose arbitrary queries, bypassing the intent the repository was meant to express.

Exception: generic repositories may be acceptable for internal infrastructure utilities that genuinely have no business-specific behavior.

Related Rules: ANTI-003.

---

# Rule DB-008 — Optimize Queries and Indexes Before Scaling Hardware

Most performance problems originate in SQL, missing indexes, network latency, excessive round-trips, or large payloads — not in CPU or memory capacity.

Review execution plans (scan vs. seek, estimated vs. actual rows, sorts, hash joins) before scaling compute. Evidence precedes optimization.

Related Rules: PERF-001.

---

# Rule DB-009 — Design Indexes Intentionally

Indexes are part of the system design, not an afterthought.

Review:

- Missing indexes
- Unused indexes
- Covering indexes
- Composite indexes

Always validate using execution plans.

---

# Rule DB-010 — Prevent N+1 Queries

Detect:

- Lazy loading loops
- Nested queries
- Repeated database round-trips

Prefer:

- Projection
- Explicit loading
- Batch queries

Related Rules: ANTI-008.

---

# Additional Engineering Guidance

The following guidance is established practice but is not a numbered rule in `docs/00-rule-catalog.md` — do not cite it with a rule ID.

## Tracking Must Be Intentional

Enable EF Core change tracking only when entity state changes are required. Prefer `AsNoTracking()` for read models, queries, reporting, and dashboards.

## Prefer Projection Over Large Entity Graphs

Prefer `.Select(x => new CustomerDto(...))` instead of loading large graphs with multiple `Include()` calls. Transfer only the data required.

## Transactions Represent Business Consistency

One transaction per business operation. Validate beforehand, avoid HTTP calls or messaging inside a transaction, avoid waiting on user input, and commit as early as safely possible. Never let a transaction span user interaction.

## Use Set-Based Operations When Appropriate

When aggregates are not required and business rules are unaffected, prefer `ExecuteUpdate`/`ExecuteDelete` or other set-based operations over loading entities one by one.

## Bulk Operations Must Be Explicit

Bulk inserts, updates, and deletes require dedicated strategies (`COPY` in PostgreSQL, `SqlBulkCopy`, bulk libraries, `ExecuteUpdate`). Avoid entity-by-entity loops for large datasets.

## Read Models Are Different From Aggregates

Read models optimize queries; Aggregates enforce business invariants. Do not confuse the two. CQRS is optional but often benefits complex systems once this distinction matters.

## Stored Procedures Are Engineering Decisions

Stored procedures are acceptable when they provide measurable value (legacy integration, vendor requirements, complex reporting, batch processing). Avoid ideological positions against them.

## Optimistic Concurrency Should Be Preferred

Use optimistic concurrency unless contention measurements justify pessimistic locking. Protect critical updates with concurrency tokens where appropriate.

---

# Common Persistence Smells

- Generic Repository Abuse
- Returning IQueryable
- N+1 Queries
- Chatty Persistence
- Massive Include Chains
- Long Transactions
- Missing Indexes
- SELECT *
- Entity-per-row Batch Updates
- Ignoring Execution Plans

---

# Database Review Checklist

- Does persistence respect business boundaries?
- Is the chosen technology justified?
- Is tracking intentional?
- Are read models optimized?
- Are transactions short?
- Are indexes reviewed?
- Are execution plans analyzed?
- Is SQL measurable?
- Are repositories business-oriented?
- Is performance evidence-based?

---

# References

- Microsoft Entity Framework Core Documentation
- Microsoft SQL Performance Guidelines
- Npgsql Documentation
- Martin Fowler — Patterns of Enterprise Application Architecture
- Eric Evans — Domain-Driven Design
- PostgreSQL Documentation
- SQL Server Query Processing Architecture Guide
