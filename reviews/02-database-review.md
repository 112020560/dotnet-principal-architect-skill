# Database Compliance Review

> Evaluate database design, persistence strategy, and data access compliance against the Principal .NET Architect Engineering Standard.

---

# Purpose

This review evaluates the persistence layer of a software solution.

Its objectives are to:

- Verify compliance with the Engineering Standard.
- Assess persistence architecture.
- Evaluate ORM usage.
- Identify database-related risks.
- Detect performance opportunities.
- Capture engineering observations based on real-world experience.

This review verifies compliance.

It does not redefine engineering rules.

All referenced rules are defined in:

> docs/00-rule-catalog.md

---

# Review Scope

This review evaluates:

- Database ownership
- Aggregate persistence
- Repository design
- EF Core
- Dapper
- SQL quality
- Transactions
- Query performance
- Persistence architecture

---

# Review Metadata

| Field | Value |
|---------|-------|
| Project | |
| Repository | |
| Branch | |
| Commit | |
| Reviewer | |
| Review Date | |
| Database Engine | |
| ORM | |
| Review Scope | |

---

# Executive Summary

Summarize the persistence quality of the solution.

Include:

- Main strengths
- Main weaknesses
- Highest risks
- Recommended priorities

---

# Compliance Legend

| Compliance | Meaning |
|------------|---------|
| ✅ Compliant | Fully complies with the Engineering Standard. |
| ⚠️ Partially Compliant | Mostly compliant but improvements are recommended. |
| ❌ Non-Compliant | Violates the Engineering Standard. |
| ➖ Not Applicable | Rule does not apply to the reviewed solution. |

---

# Database Compliance Review

## Database Design

| Compliance | Rule | Evidence | Notes |
|------------|------|----------|-------|
| | DB-001 | | |
| | DB-002 | | |

---

## Persistence Strategy

| Compliance | Rule | Evidence | Notes |
|------------|------|----------|-------|
| | DB-003 | | |
| | DB-004 | | |
| | DB-005 | | |

---

## Repository Design

| Compliance | Rule | Evidence | Notes |
|------------|------|----------|-------|
| | DB-006 | | |
| | DB-007 | | |

---

## Query Performance

| Compliance | Rule | Evidence | Notes |
|------------|------|----------|-------|
| | DB-008 | | |
| | DB-009 | | |
| | DB-010 | | |

---

# Engineering Review Questions

These questions are intended to capture engineering judgment.

They **do not affect compliance**.

They identify opportunities for optimization and architectural improvement.

---

## EF Core Engineering Questions

| Question | Answer | Notes |
|----------|--------|-------|
| Are read-only queries using AsNoTracking()? | | |
| Are entities projected instead of loading complete graphs? | | |
| Are unnecessary Include() statements avoided? | | |
| Are Split Queries used where appropriate? | | |
| Are compiled queries justified for hot paths? | | |
| Are CancellationTokens propagated to EF Core operations? | | |
| Are async APIs used consistently? | | |
| Is DbContext lifetime appropriate? | | |
| Is lazy loading disabled unless explicitly justified? | | |
| Are ValueConverters improving the domain model? | | |
| Is optimistic concurrency implemented where appropriate? | | |
| Are migrations version-controlled? | | |
| Is query execution observable through logging or telemetry? | | |

---

## Dapper Engineering Questions

Complete only if Dapper is used.

| Question | Answer | Notes |
|----------|--------|-------|
| Is Dapper used only where it provides measurable value? | | |
| Are SQL statements parameterized? | | |
| Is SQL readable and maintainable? | | |
| Are indexes aligned with query patterns? | | |
| Is QueryMultiple used where it reduces database round trips? | | |
| Are transactions managed correctly? | | |
| Is connection lifetime appropriate? | | |
| Are mappings simple and explicit? | | |
| Is duplicated SQL minimized? | | |
| Are execution plans reviewed for critical queries? | | |

---

## Persistence Engineering Questions

| Question | Answer | Notes |
|----------|--------|-------|
| Does every Aggregate own its persistence boundary? | | |
| Is every Repository business-oriented? | | |
| Is Generic Repository avoided? | | |
| Is CQRS justified? | | |
| Are read models optimized independently? | | |
| Are transaction boundaries explicit? | | |
| Is eventual consistency acceptable where implemented? | | |
| Is data ownership clearly defined? | | |
| Is caching justified with measurable benefits? | | |
| Are N+1 queries prevented? | | |

---

# Database Smells

Identify persistence anti-patterns observed during the review.

| Compliance | Rule | Evidence | Notes |
|------------|------|----------|-------|
| | ANTI-003 | | |
| | ANTI-008 | | |
| | ANTI-010 | | |

---

# Positive Findings

Document engineering decisions that strengthen the persistence layer.

Examples:

- Well-defined Aggregate boundaries.
- Excellent repository design.
- Proper EF Core usage.
- Dapper used only where justified.
- Excellent indexing strategy.
- Good transaction management.
- Clean separation between write and read models.

---

# Risks

| Risk | Business Impact | Recommendation |
|------|-----------------|----------------|
| | | |
| | | |
| | | |

---

# Top Recommendations

Prioritize recommendations by engineering value.

| Priority | Recommendation | Expected Benefit |
|----------|----------------|------------------|
| 1 | | |
| 2 | | |
| 3 | | |

---

# Database Compliance Score

| Area | Compliance |
|------|-----------:|
| Database Design | |
| Persistence Strategy | |
| Repository Design | |
| Query Performance | |
| Transactions | |

---

## Overall Compliance

```
Overall Database Compliance

__________ %
```

### Engineering Assessment

- ☐ Excellent (95–100%)
- ☐ Very Good (85–94%)
- ☐ Good (75–84%)
- ☐ Needs Improvement (60–74%)
- ☐ Critical (<60%)

---

# Compliance Summary

| Metric | Value |
|--------|------:|
| Rules Evaluated | |
| Compliant | |
| Partially Compliant | |
| Non-Compliant | |
| Not Applicable | |

---

# Related Engineering Rules

## Database

- DB-001 → DB-010

## Anti-Patterns

- ANTI-003
- ANTI-008
- ANTI-010

---

# Related Documentation

- docs/00-rule-catalog.md
- docs/04-database.md
- docs/13-anti-patterns.md
- docs/14-code-review-style.md

---

# Final Assessment

Summarize the persistence quality of the reviewed solution.

The assessment should answer:

- Is the persistence layer maintainable?
- Is the data model well designed?
- Is EF Core used appropriately?
- Is Dapper justified?
- Are query performance risks controlled?
- What improvements provide the highest engineering value?

The objective is to build a persistence layer that is maintainable, performant, scalable, and aligned with the Engineering Standard.