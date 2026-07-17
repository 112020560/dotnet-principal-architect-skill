# Engineering Review Template

> *Consistency is the foundation of trustworthy engineering reviews.*

---

# Purpose

This document defines the standard structure for every engineering review performed using the Principal .NET Architect Engineering Standard.

All review checklists in this repository MUST follow this template.

The objective is to ensure every review is:

- Consistent
- Objective
- Evidence-based
- Actionable
- Traceable
- Repeatable

This template applies to:

- Architecture Reviews
- Database Reviews
- Performance Reviews
- HTTP Reviews
- ASP.NET Core Reviews
- Observability Reviews
- Messaging Reviews
- Security Reviews
- Cloud Reviews
- Testing Reviews
- Pull Request Reviews
- Production Readiness Reviews

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
| Review Scope | |
| Environment | Development / QA / Production |
| Architecture Style | |
| Application Version | |

---

# Executive Summary

Provide a concise summary of the review.

The summary should answer:

- What was reviewed?
- What is the overall engineering quality?
- What are the primary strengths?
- What are the highest risks?
- What should be addressed first?

Limit the summary to one page.

---

# Engineering Score

| Category | Score |
|----------|------:|
| Current Review | |

---

# Findings Summary

| Severity | Count |
|----------|------:|
| Critical | |
| High | |
| Medium | |
| Low | |
| Informational | |

---

# Review Checklist

Each checklist item should follow the same structure.

| Status | Rule | Requirement | Evidence | Notes |
|---------|------|-------------|----------|-------|
| | | | | |

---

# Status Legend

| Status | Meaning |
|---------|----------|
| ✅ | Compliant |
| ⚠️ | Partially Compliant |
| ❌ | Non-Compliant |
| N/A | Not Applicable |

---

# Evidence Guidelines

Every finding should be supported by observable evidence.

Acceptable evidence includes:

- Source code
- Configuration
- Logs
- Metrics
- Architecture diagrams
- API contracts
- SQL queries
- Benchmark results
- Production telemetry

Engineering reviews should never rely on assumptions.

---

# Positive Findings

Document notable engineering strengths.

Examples:

- Excellent separation of concerns.
- Strong Domain Model.
- Proper async implementation.
- Good observability.
- Well-designed HTTP clients.
- Clear architectural boundaries.

Recognizing good engineering decisions is as important as identifying risks.

---

# Risks

| Risk | Business Impact | Recommendation |
|------|-----------------|----------------|
| | | |
| | | |
| | | |

---

# Top Recommendations

Prioritize recommendations by engineering value rather than implementation effort.

| Priority | Recommendation | Expected Benefit |
|-----------|----------------|------------------|
| 1 | | |
| 2 | | |
| 3 | | |

---

# Related Engineering Rules

Reference every applicable rule from the Engineering Rule Catalog.

Example:

- ARCH-003
- DB-007
- PERF-004
- HTTP-005
- API-002
- OBS-006
- MSG-005
- SEC-004

Do not invent rule identifiers.

---

# Related Documentation

Reference only documents that support the review.

Examples:

- docs/00-rule-catalog.md
- docs/03-architecture.md
- docs/05-performance.md
- docs/13-anti-patterns.md
- docs/14-code-review-style.md

---

# Final Assessment

Summarize the engineering quality of the reviewed solution.

The assessment should answer:

- Is the solution maintainable?
- Is the design scalable?
- Does it comply with the Engineering Standard?
- What are the highest-priority improvements?

The objective is continuous engineering improvement, not architectural perfection.

---

# Reviewer Notes

Additional observations that do not fit into the structured review.

---

# Review Completion Checklist

Before closing the review, verify:

- ☐ Scope understood.
- ☐ Findings supported by evidence.
- ☐ Rule identifiers referenced.
- ☐ Business impact explained.
- ☐ Recommendations prioritized.
- ☐ Positive findings documented.
- ☐ Final assessment completed.

---

# References

- docs/00-rule-catalog.md
- docs/01-philosophy.md
- docs/02-review-process.md
- docs/14-code-review-style.md
- docs/15-examples.md