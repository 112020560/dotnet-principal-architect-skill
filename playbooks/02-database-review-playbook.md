# Database Review Playbook

> Step-by-step guidance for executing a Database Compliance Review.

---

## Purpose

This playbook provides repeatable execution guidance for conducting a Database Compliance Review using the Engineering Assessment Framework.

It answers: How should this review be executed?

---

## Audience

- Software Architects
- Principal Engineers
- Technical Leads
- Database Engineers

---

## Prerequisites

- Access to the source repository.
- Access to database migration files or schema definitions.
- Access to EF Core DbContext and entity configurations if applicable.
- Familiarity with `reviews/02-database-review.md`.
- Familiarity with DB rules in `docs/00-rule-catalog.md`.

---

## When to Execute

- Before major releases involving data model changes.
- When onboarding a new system for assessment.
- When performance issues are suspected to originate from the data layer.
- As part of a production readiness process.

---

## Estimated Duration

| System Size | Estimated Duration |
|-------------|-------------------|
| Small | 2–4 hours |
| Medium | 4–8 hours |
| Large | 1–2 days |

---

## Preparation

1. Read `docs/04-database.md` to refresh database standards.
2. Read `docs/00-rule-catalog.md` — DB section.
3. Open `reviews/02-database-review.md` as the working document.
4. Locate: DbContext, entity configurations, repository implementations, migration history.
5. Identify the ORM strategy (EF Core, Dapper, raw SQL, or mixed).
6. Identify the database technology (PostgreSQL, SQL Server, or other).

---

## Execution Steps

### Step 1 — Evaluate Data Ownership

- Verify that each bounded context or service owns its data exclusively.
- Identify shared databases or tables accessed by multiple services.
- Check for cross-service joins or direct database access from multiple contexts.

Rule references: DB-001.

### Step 2 — Evaluate the Data Model

- Assess whether the entity model reflects business aggregates, not just relational tables.
- Check whether EF Core entities exist in the Infrastructure layer or have leaked into the Domain.
- Verify that value objects and aggregate roots are modeled correctly.

Rule references: DB-002, DB-003.

### Step 3 — Evaluate ORM Usage

- Check that EF Core is used as the default ORM.
- If Dapper is used, verify there is a documented justification (performance-critical queries, reporting).
- Identify any raw SQL usage and evaluate its necessity.

Rule references: DB-003, DB-004.

### Step 4 — Evaluate Repository Design

- Verify that repositories express business intent rather than generic CRUD.
- Identify Generic Repository implementations (`IRepository<T>`) and evaluate whether they obscure domain intent.
- Check that queries return only the data required for the use case.

Rule references: DB-006, DB-007.

### Step 5 — Evaluate Query Performance

- Search for N+1 query patterns: collections loaded inside loops without eager loading.
- Verify that `Include` and `ThenInclude` are used intentionally.
- Check for unbounded queries (no `Take`, no pagination).
- Identify queries without appropriate indexes.

Rule references: DB-008, DB-009, DB-010, ANTI-008.

### Step 6 — Evaluate Persistence Strategy

- Confirm that the persistence strategy matches the workload (OLTP vs. read-heavy vs. analytical).
- Check for unnecessary round-trips or chatty data access patterns.

Rule references: DB-005.

### Step 7 — Document Findings

- Record each finding in the review checklist with status, evidence, and applicable rule.
- Assign severity based on business impact.
- Document positive findings.

---

## Evidence Collection Guide

| Evidence Type | Where to Find |
|---------------|--------------|
| Entity models | Infrastructure or Domain projects |
| DbContext configuration | `*DbContext.cs`, `OnModelCreating` |
| Repository implementations | `Repositories/` folder |
| Migration history | `Migrations/` folder |
| Query patterns | Handlers, Services, Repositories |
| Raw SQL | `FromSqlRaw`, `ExecuteSqlRaw`, Dapper calls |

---

## Common Findings

- EF Core entities used as Domain models.
- Generic repositories that hide domain intent.
- N+1 query patterns in collection loading.
- Missing indexes on frequently filtered columns.
- Unbounded queries with no pagination.
- Cross-context data access through shared DbContext.

---

## Red Flags

- Shared DbContext across multiple bounded contexts or services.
- Database entities imported directly into the Domain project.
- Loops containing individual database calls.
- No migration history (schema managed manually).
- Raw SQL mixed with ORM usage without documented justification.

---

## Output

Upon completion, the reviewer produces:

1. A completed `reviews/02-database-review.md`.
2. An Executive Summary describing overall data platform health.
3. Prioritized recommendations addressing the highest-risk findings.

---

## Quality Checklist

- ☐ All checklist items have a status.
- ☐ Every ❌ or ⚠️ has observable evidence (code location or query example).
- ☐ Every finding references a DB or ANTI rule.
- ☐ N+1 patterns are identified with specific evidence.
- ☐ Positive findings are documented.
- ☐ Executive Summary is complete.

---

## Related Documents

- reviews/02-database-review.md
- scorecards/02-database-scorecard.md
- docs/04-database.md
- docs/00-rule-catalog.md

---

## Future Enhancements

Future versions of this playbook may include:

- SQL execution plan analysis guidance.
- EF Core query logging and profiling setup instructions.
- Index analysis tooling recommendations.
- Database migration review checklist.
