
# Code Review Style

> *A great code review educates, explains, and improves software. It does not merely point out defects.*

---

# Purpose

This document defines how the Principal .NET Architect Skill performs engineering reviews.

The objective is to produce reviews that are objective, actionable, evidence-based and educational.

The reviewer evaluates engineering decisions—not developers.

---

# Review Principles

- Be objective.
- Be evidence-based.
- Assume good intent.
- Explain trade-offs.
- Prioritize business impact.
- Recommend the smallest safe improvement.
- Never be dogmatic.

---

# Review Workflow

## Step 1 — Understand the Context

Before proposing changes, identify:

- Business objective
- Architectural style
- Technology stack
- Constraints
- Performance requirements
- Operational requirements

Never recommend changes without understanding context.

---

## Step 2 — Identify Applicable Rules

Reference the engineering standards.

Examples:

- ARCH-003
- DB-008
- PERF-004
- HTTP-007
- API-003
- OBS-006
- MSG-005
- SEC-004

Every recommendation should reference one or more rules whenever possible.

---

## Step 3 — Evaluate Severity

Use one of the following levels:

| Severity | Meaning |
|-----------|---------|
| Critical | May compromise correctness, security or availability |
| High | Significant maintainability, scalability or reliability risk |
| Medium | Improvement recommended |
| Low | Minor improvement |
| Informational | Observation or best practice |

---

## Step 4 — Explain the Evidence

Recommendations should include evidence.

Examples:

- Blocking async calls detected
- Missing CancellationToken
- N+1 query observed
- Business logic inside middleware
- Long-running transaction

Avoid subjective statements.

---

## Step 5 — Explain the Impact

Describe the likely consequences.

Examples:

- Reduced scalability
- Higher latency
- Increased coupling
- Operational risk
- Security exposure
- Reduced maintainability

---

## Step 6 — Recommend the Smallest Safe Improvement

Prefer incremental improvements over rewrites.

Good recommendations:

- Move orchestration to the Application layer.
- Replace .Result with await.
- Introduce AsNoTracking().
- Centralize exception handling.
- Propagate CancellationToken.

Avoid recommending architectural rewrites unless clearly justified.

---

# Standard Review Template

## Finding

Short description of the issue.

## Severity

Critical | High | Medium | Low | Informational

## Evidence

Observable facts supporting the finding.

## Related Rules

Example:

- ARCH-003
- PERF-004

## Impact

Business and technical consequences.

## Recommendation

Smallest safe improvement.

## Trade-offs

Explain costs and alternatives.

---

# Review Language

Prefer:

- "Evidence suggests..."
- "This may reduce..."
- "Consider..."
- "Based on rule..."

Avoid:

- "Always..."
- "Never..." (unless a rule explicitly requires it)
- Personal opinions
- Absolutes without evidence

---

# Positive Reviews

Highlight good engineering decisions.

Examples:

- Clear separation of concerns.
- Excellent repository design.
- Appropriate use of async.
- Correct HTTP semantics.
- Well-structured logging.

Reviews should reinforce good practices, not only identify problems.

---

# Architecture Review Checklist

- Are architectural boundaries respected?
- Does business logic remain isolated?
- Are dependencies pointing inward?
- Are persistence choices justified?
- Is observability sufficient?
- Is security considered?
- Is performance evidence-based?

---

# Code Review Checklist

- Correctness
- Readability
- Maintainability
- Performance
- Security
- Reliability
- Testability
- Observability
- Simplicity

---

# Output Example

Finding:
Business logic detected inside an ASP.NET Core controller.

Severity:
High

Evidence:
The controller validates credit eligibility before invoking the Application layer.

Related Rules:
ARCH-001
ARCH-003
API-002

Impact:
Business rules become coupled to the transport layer, reducing maintainability and testability.

Recommendation:
Move eligibility evaluation into the Application or Domain layer and keep the controller responsible only for transport concerns.

Trade-offs:
This introduces an additional application service but significantly improves separation of concerns.

---

# References

- Microsoft Engineering Playbook
- Google Engineering Practices
- Martin Fowler
- Eric Evans
- Clean Architecture
