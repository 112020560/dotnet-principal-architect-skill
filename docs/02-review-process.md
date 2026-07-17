# Engineering Review Process

> *A code review is an engineering assessment, not a search for mistakes.*

---

# Purpose

This document defines the standard review process used by the Principal .NET Architect Skill.

Its objective is to ensure every review is:

- Consistent
- Evidence-based
- Context-aware
- Actionable
- Educational

Every recommendation should improve the system while respecting business constraints.

---

# Core Principles

Every review must:

- Understand before judging.
- Explain before recommending.
- Use evidence instead of opinion.
- Consider trade-offs.
- Respect the existing architecture.
- Prefer incremental improvements.

---

# Review Lifecycle

Every review follows the same engineering process.

```
Understand Context
        │
        ▼
Collect Evidence
        │
        ▼
Identify Applicable Rules
        │
        ▼
Evaluate Severity
        │
        ▼
Explain Business Impact
        │
        ▼
Recommend Improvements
        │
        ▼
Describe Trade-offs
```

---

# Step 1 — Understand the Context

Before making recommendations, identify:

- Business objective
- System architecture
- Technology stack
- Deployment model
- Performance requirements
- Security requirements
- Operational constraints

Never review code in isolation.

Context changes engineering decisions.

---

# Step 2 — Collect Evidence

Recommendations must be supported by observable facts.

Examples:

- Blocking asynchronous calls
- N+1 queries
- Missing CancellationToken
- Duplicate business logic
- Circular dependencies
- Excessive allocations
- Large controllers
- Infrastructure leaking into the Domain

Avoid assumptions.

---

# Step 3 — Identify Applicable Rules

Reference one or more engineering standards whenever possible.

Examples:

- ARCH-003
- DB-007
- PERF-004
- HTTP-006
- API-002
- OBS-008
- MSG-005
- SEC-004

Recommendations should be traceable to documented engineering guidance.

---

# Step 4 — Evaluate Severity

Every finding should include a severity level.

| Severity | Meaning |
|-----------|---------|
| Critical | Risk to correctness, security, availability or data integrity |
| High | Significant architectural or operational impact |
| Medium | Recommended improvement |
| Low | Minor optimization or readability improvement |
| Informational | Observation or best practice |

Severity should reflect business impact, not personal preference.

---

# Step 5 — Explain the Business Impact

Every finding should answer:

Why does this matter?

Possible impacts include:

- Lower scalability
- Increased latency
- Reduced maintainability
- Security exposure
- Operational complexity
- Reduced testability
- Higher infrastructure costs

Technical findings should always connect to business outcomes.

---

# Step 6 — Recommend the Smallest Safe Improvement

Prefer incremental improvements over complete rewrites.

Good recommendations:

- Introduce CancellationToken propagation.
- Replace Task.Run with asynchronous APIs.
- Move orchestration into the Application layer.
- Introduce structured logging.
- Replace synchronous database access.

Avoid recommendations that require unnecessary architectural rewrites.

---

# Step 7 — Explain Trade-offs

Every engineering decision has advantages and disadvantages.

Good reviews explain both.

Example:

Using Dapper may improve query performance but introduces manual mapping and additional maintenance.

Using EF Core improves maintainability but may not be appropriate for high-volume analytical queries.

Trade-offs are more valuable than absolute recommendations.

---

# Review Categories

Every finding should belong to one or more categories.

- Architecture
- Domain Design
- Persistence
- Performance
- HTTP
- Security
- Messaging
- Observability
- Cloud
- Testing
- Maintainability

---

# Review Output Template

## Finding

Short description.

---

## Severity

Critical | High | Medium | Low | Informational

---

## Evidence

Observable facts supporting the finding.

---

## Related Rules

Example:

- ARCH-003
- PERF-004

---

## Business Impact

Explain why the issue matters.

---

## Recommendation

Describe the smallest safe improvement.

---

## Trade-offs

Explain advantages and disadvantages.

---

# Good Review Characteristics

A good review:

- Is objective
- Is respectful
- Teaches engineering concepts
- References standards
- Explains trade-offs
- Improves maintainability
- Avoids dogmatic statements

---

# Poor Review Characteristics

Poor reviews:

- State opinions as facts.
- Ignore business context.
- Recommend unnecessary rewrites.
- Focus on style instead of engineering.
- Criticize developers rather than decisions.
- Lack supporting evidence.

---

# Engineering Mindset

The goal is not to prove that code is wrong.

The goal is to help teams make better engineering decisions.

A successful review increases confidence, improves maintainability and reduces long-term operational risk.

---

# References

- Microsoft Engineering Practices
- Google Engineering Practices
- Martin Fowler
- Clean Architecture
- Domain-Driven Design