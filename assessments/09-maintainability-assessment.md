# Maintainability Assessment

> Transform consolidated engineering evidence from code quality, architecture, testing, and governance scorecards into a formal evaluation of the system's long-term maintainability and the organization's capacity to evolve it sustainably.

---

# Purpose

The Maintainability Assessment determines whether a software system can be understood, modified, extended, and corrected by the engineering team without excessive cost, risk, or dependency on specific individuals.

Its objectives are to:

- Consolidate maintainability evidence from relevant domain scorecards.
- Evaluate code quality, architectural clarity, and test confidence.
- Assess knowledge distribution and documentation coverage.
- Identify maintainability risks that affect long-term sustainability.
- Produce a formal maintainability determination.

This assessment does not perform engineering reviews.

This assessment does not recalculate scorecard scores.

All engineering evidence originates from the domain scorecards produced by the Engineering Review Framework.

---

# Assessment Metadata

| Field | Value |
|-------|-------|
| System | |
| Version | |
| Repository | |
| Assessment Date | |
| Lead Reviewer | |
| Engineering Manager | |
| Team Size | |

---

# Executive Summary

Provide a concise summary for executive and governance audiences.

Include:

- Overall maintainability level.
- Strongest maintainability capabilities.
- Highest maintainability risks.
- Key bus-factor concerns.
- Formal maintainability determination.

Limit to one page.

---

# Primary Input Scorecards

This assessment draws primary evidence from the following domain scorecards.

| Scorecard | Domain | Maintainability Relevance |
|-----------|--------|--------------------------|
| 12 | Code Quality | Readability, complexity, naming, cohesion, coupling |
| 01 | Architecture | Separation of concerns, modularity, dependency direction |
| 11 | Testing | Test confidence, regression safety, change safety |
| 13 | Domain & DDD | Domain model clarity, business concept alignment |
| 15 | Engineering Governance | Documentation, ADRs, knowledge management |

---

# Supporting Input Scorecards

| Scorecard | Domain | Supporting Evidence |
|-----------|--------|---------------------|
| 05 | ASP.NET Core | Framework conventions, configuration clarity |
| 14 | API Design | API contract stability and clarity |
| 04 | Technical Debt | Debt impact on maintainability |

---

# Maintainability Capability Overview

Consolidate maintainability-relevant grades from domain scorecards.

Grades are sourced directly from domain scorecards and are not recalculated here.

| Maintainability Capability | Grade | Risk Level | Source Scorecard |
|---------------------------|-------|------------|------------------|
| Code Readability | | | 12 |
| Code Complexity | | | 12 |
| Separation of Concerns | | | 01 |
| Modularity | | | 01 |
| Test Confidence | | | 11 |
| Domain Model Clarity | | | 13 |
| Architecture Documentation | | | 15 |
| Engineering Knowledge Coverage | | | 15 |
| API Contract Stability | | | 14 |

---

# Maintainability Dimension Analysis

---

## Code Quality and Readability

Evaluate whether the codebase can be understood and modified with low cognitive effort.

| Dimension | Status | Evidence |
|-----------|--------|----------|
| Code is readable without requiring original author | | |
| Naming is clear and consistent | | |
| Functions and methods have single responsibilities | | |
| Cyclomatic complexity is within acceptable bounds | | |
| Code duplication is minimal | | |
| Magic numbers and strings are avoided | | |
| Business intent is evident from code | | |

---

## Architectural Maintainability

Evaluate whether the architecture supports safe, incremental change.

| Dimension | Status | Evidence |
|-----------|--------|----------|
| Responsibilities are clearly separated | | |
| Dependencies point in the correct direction | | |
| Modules or components can be changed in isolation | | |
| Infrastructure is isolated from the domain | | |
| Business rules are not scattered across layers | | |
| The architecture can be explained to a new engineer | | |

---

## Test Safety

Evaluate whether the test suite provides confidence to change the system safely.

| Dimension | Status | Evidence |
|-----------|--------|----------|
| Tests verify behavior, not implementation details | | |
| Tests cover critical business paths | | |
| Regression is detected before deployment | | |
| Tests are deterministic and reliable | | |
| Failing tests are meaningful and actionable | | |
| New engineers can add tests without extensive guidance | | |

---

## Domain Model Clarity

Evaluate whether the domain model reflects business concepts accurately and clearly.

| Dimension | Status | Evidence |
|-----------|--------|----------|
| Business concepts are explicitly modeled | | |
| Domain terminology matches business language | | |
| Business rules are located in the domain layer | | |
| Domain model is stable under business evolution | | |
| New engineers can understand the domain without extensive context | | |

---

## Documentation and Knowledge Coverage

Evaluate whether engineering knowledge is captured and accessible.

| Dimension | Status | Evidence |
|-----------|--------|----------|
| Architecture decisions are documented (ADRs) | | |
| Complex business rules are documented | | |
| Runbooks cover critical operational scenarios | | |
| Engineering standards are documented and accessible | | |
| Onboarding documentation exists | | |

---

# Bus Factor Assessment

Evaluate the risk of critical knowledge being concentrated in a small number of individuals.

| Area | Bus Factor | Risk | Notes |
|------|------------|------|-------|
| Core business domain knowledge | | | |
| Critical system components | | | |
| Infrastructure and deployment | | | |
| Database and data model | | | |
| Security and authentication | | | |

---

## Bus Factor Scale

| Level | Meaning |
|-------|---------|
| 1 | Critical risk. Loss of one person causes significant operational impact. |
| 2 | High risk. Limited resilience to team changes. |
| 3+ | Acceptable. Knowledge is sufficiently distributed. |

---

# Maintainability Risks

Document maintainability risks identified across relevant scorecards.

| Risk | Severity | Business Impact | Source | Recommendation |
|------|----------|-----------------|--------|----------------|
| | | | | |
| | | | | |
| | | | | |

---

# Maintainability Anti-Patterns Detected

Summarize maintainability anti-patterns identified in domain scorecards.

| Anti-Pattern | Detected | Domain | Business Impact |
|--------------|---------|--------|-----------------|
| God Service | | | |
| Fat Controller | | | |
| Shared Database | | | |
| Business Logic in Infrastructure | | | |
| Circular Dependencies | | | |
| Duplicate Business Rules | | | |
| Undocumented Business Logic | | | |
| Missing Tests for Critical Paths | | | |
| Hero Knowledge (Bus Factor 1) | | | |

---

# Onboarding Assessment

Evaluate how effectively a new engineer can become productive with this system.

| Dimension | Assessment | Notes |
|-----------|------------|-------|
| New engineer can understand the domain in one week | | |
| New engineer can make a safe change in two weeks | | |
| Development environment setup is documented | | |
| Business context is documented | | |
| Architecture is documented and current | | |

---

# Overall Maintainability Level

Choose one.

- ☐ **Highly Maintainable** — The system is clean, well-structured, and well-documented. Changes are safe and efficient.
- ☐ **Maintainable** — The system can be maintained with reasonable effort. Minor improvements recommended.
- ☐ **Marginally Maintainable** — Maintenance is possible but carries elevated risk and cost. Improvement investment is required.
- ☐ **Difficult to Maintain** — The system presents significant maintainability challenges. Delivery velocity and defect risk are materially affected.
- ☐ **Critical Maintainability Risk** — The system is at risk of becoming unmaintainable. Immediate investment is required.

---

# Formal Maintainability Decision

Select one decision and document the rationale.

---

## MAINTAINABILITY CONFIRMED

The system demonstrates acceptable maintainability. Engineering teams can evolve the system safely and efficiently.

**Rationale:**

---

## MAINTAINABILITY IMPROVEMENT REQUIRED

The system can be maintained but carries elevated risk or cost. The following improvements are required.

**Required Improvements:**

-

-

-

**Rationale:**

---

## MAINTAINABILITY CRITICAL

The system's maintainability presents material risk to delivery velocity, defect rate, or business continuity.

Immediate engineering investment is required.

**Critical Issues:**

-

-

**Required Actions:**

-

-

**Rationale:**

---

# Investment Priorities

Identify maintainability investments with the highest long-term value.

| Priority | Investment | Expected Outcome | Complexity |
|----------|------------|------------------|------------|
| 1 | | | |
| 2 | | | |
| 3 | | | |

---

# Related Documentation

- scorecards/12-code-quality-scorecard.md
- scorecards/01-architecture-scorecard.md
- scorecards/11-testing-scorecard.md
- scorecards/13-domain-ddd-scorecard.md
- scorecards/15-engineering-governance-scorecard.md
- reviews/12-code-quality-review.md
- reviews/14-code-review-style.md
- framework/ENGINEERING-ASSESSMENT-FRAMEWORK.md
- assessments/02-engineering-maturity-assessment.md
- assessments/04-technical-debt-assessment.md

---

# Future Enhancements

Future versions of this assessment may include:

- Static analysis integration (cyclomatic complexity, coupling, cohesion metrics).
- Automated bus factor detection from commit history analysis.
- Test coverage mapping to critical business paths.
- Documentation coverage scoring.
- Maintainability trend across multiple assessment cycles.
- AI-assisted identification of maintainability hotspots from code metrics.
- Onboarding time estimation from knowledge distribution analysis.

These enhancements will evolve the Maintainability Assessment from a point-in-time evaluation into a continuous maintainability intelligence capability that helps organizations proactively manage long-term engineering sustainability.
