
# Database Rules

> *Data access is an architectural concern. Choose persistence technologies based on measurable business and technical requirements—not preference.*

---

# Purpose

This document defines the database and persistence engineering rules used by the Principal .NET Architect Skill.

The goal is to provide objective guidance for designing, reviewing, and optimizing persistence layers in modern .NET applications.

These rules apply regardless of the underlying database engine (PostgreSQL, SQL Server, MySQL, Oracle, etc.).

---

# Guiding Principles

- Persistence serves the domain, not the opposite.
- Choose technologies based on workload characteristics.
- Measure before optimizing.
- Avoid dogmatic recommendations.
- Transactions represent business consistency boundaries.
- Database design is part of software architecture.

---

# Rule DB-001 — Persistence Must Follow Business Boundaries

**Severity:** Critical

Persistence should respect bounded contexts and aggregate boundaries.

Avoid sharing tables or schemas between unrelated business capabilities.

---

# Rule DB-002 — Choose the Right Persistence Technology

**Severity:** Critical

There is no universally correct persistence technology.

Selection should consider:

- Business complexity
- Query complexity
- Throughput
- Team expertise
- Operational constraints
- Maintainability

---

# Rule DB-003 — Entity Framework Core Is Not the Default Choice

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

Engineering Note

EF Core optimizes developer productivity, not raw database throughput.

---

# Rule DB-004 — Dapper Is Not the Default Choice

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

Engineering Note

Dapper is a micro ORM, not a replacement for domain modeling.

---

# Rule DB-005 — EF Core and Dapper Can Coexist

**Severity:** High

Using both technologies is a mature engineering strategy.

Typical pattern:

- Writes → EF Core
- Reads → Dapper
- Same transaction when required
- Same connection when appropriate

Avoid migrating an entire application to one technology without evidence.

---

# Rule DB-006 — Repositories Express Business Intent

Repositories should expose business language.

Prefer:

- ExistsByIdentification()
- GetPendingLoan()
- FindActiveCustomer()

Avoid:

- GetAll()
- Query()
- Find()

---

# Rule DB-007 — Never Return IQueryable Outside Infrastructure

`IQueryable` leaks persistence concerns into higher layers.

Expose business operations or materialized results instead.

Exception:

Internal infrastructure composition.

---

# Rule DB-008 — Tracking Must Be Intentional

Enable tracking only when entity state changes are required.

Prefer `AsNoTracking()` for:

- Read models
- Queries
- Reporting
- Dashboards

---

# Rule DB-009 — Prefer Projection Over Large Entity Graphs

Prefer:

```csharp
.Select(x => new CustomerDto(...))
```

Instead of loading large graphs with multiple `Include()` calls.

Transfer only the data required.

---

# Rule DB-010 — Avoid N+1 Queries

Detect:

- Lazy loading loops
- Nested queries
- Repeated database round-trips

Prefer:

- Projection
- Explicit loading
- Batch queries

---

# Rule DB-011 — One Transaction Per Business Operation

Transactions should represent business consistency.

Avoid long-running transactions.

Never span user interaction.

---

# Rule DB-012 — Keep Transactions Short

Inside transactions:

- Validate beforehand
- Avoid HTTP calls
- Avoid messaging
- Avoid user input

Commit as early as safely possible.

---

# Rule DB-013 — Use ExecuteUpdate and ExecuteDelete When Appropriate

When aggregates are not required and business rules are unaffected, prefer set-based operations over loading entities.

---

# Rule DB-014 — Indexes Are Architecture

Indexes are part of the system design.

Review:

- Missing indexes
- Unused indexes
- Covering indexes
- Composite indexes

Always validate using execution plans.

---

# Rule DB-015 — Execution Plans Before Optimization

Never optimize SQL based on assumptions.

Review:

- Execution plan
- Scan vs Seek
- Estimated rows
- Actual rows
- Sorts
- Hash joins

Evidence precedes optimization.

---

# Rule DB-016 — Bulk Operations Must Be Explicit

Bulk inserts, updates, and deletes require dedicated strategies.

Examples:

- COPY (PostgreSQL)
- SqlBulkCopy
- Bulk libraries
- ExecuteUpdate

Avoid entity-by-entity loops for large datasets.

---

# Rule DB-017 — Read Models Are Different From Aggregates

Read models optimize queries.

Aggregates enforce business invariants.

Do not confuse the two.

CQRS is optional but often benefits complex systems.

---

# Rule DB-018 — Stored Procedures Are Engineering Decisions

Stored procedures are acceptable when they provide measurable value.

Examples:

- Legacy integration
- Vendor requirements
- Complex reporting
- Batch processing

Avoid ideological positions.

---

# Rule DB-019 — Optimistic Concurrency Should Be Preferred

Use optimistic concurrency unless contention measurements justify pessimistic locking.

Protect critical updates with concurrency tokens where appropriate.

---

# Rule DB-020 — Measure Database Performance Before Optimizing Code

Most performance problems originate in:

- SQL
- Missing indexes
- Network latency
- Excessive round-trips
- Large payloads

Optimize the database before micro-optimizing C# code.

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
