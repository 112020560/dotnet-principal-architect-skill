# Technical Debt Assessment

> Transform consolidated engineering evidence from all domain scorecards into a formal evaluation of technical debt exposure, business impact, and investment priorities.

---

# Purpose

The Technical Debt Assessment evaluates the accumulated technical debt across a software system and its potential impact on business outcomes.

Its objectives are to:

- Consolidate technical debt evidence from all domain scorecards.
- Categorize and quantify debt by engineering domain.
- Assess the business impact of accumulated debt.
- Prioritize debt remediation by organizational value.
- Identify debt that represents immediate risk.
- Produce a formal technical debt management decision.

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
| Product Owner | |

---

# Executive Summary

Provide a concise summary for executive and governance audiences.

Include:

- Overall technical debt level.
- Domains with the highest debt concentration.
- Business impact of accumulated debt.
- Immediate risk areas.
- Recommended investment priorities.

Limit to one page.

---

# Input Scorecards

This assessment consolidates technical debt evidence from the following domain scorecards.

| Scorecard | Domain | Debt Evidence Section |
|-----------|--------|-----------------------|
| 01 | Architecture | Architecture Technical Debt |
| 02 | Database | Database Technical Debt |
| 03 | Performance | Performance Technical Debt |
| 04 | HTTP | HTTP Technical Debt |
| 05 | ASP.NET Core | Framework Technical Debt |
| 06 | Observability | Observability Technical Debt |
| 07 | Messaging | Messaging Technical Debt |
| 08 | Security | Security Technical Debt |
| 09 | Cloud Infrastructure | Infrastructure Technical Debt |
| 10 | DevOps & CI/CD | Delivery Technical Debt |
| 11 | Testing | Testing Technical Debt |
| 12 | Code Quality | Code Quality Technical Debt |
| 13 | Domain & DDD | Domain Technical Debt |
| 14 | API Design | API Technical Debt |
| 15 | Engineering Governance | Governance Technical Debt |

---

# Technical Debt Taxonomy

The following categories classify technical debt within this assessment.

| Category | Description |
|----------|-------------|
| Architectural Debt | Structural decisions that constrain evolution or scalability |
| Design Debt | Design patterns or abstractions that increase complexity or reduce maintainability |
| Code Debt | Code quality issues that increase defect risk or maintenance cost |
| Infrastructure Debt | Infrastructure decisions that limit resilience, scalability, or operability |
| Security Debt | Security gaps that increase exposure to vulnerabilities or compliance risk |
| Testing Debt | Insufficient test coverage or quality that reduces deployment confidence |
| Operational Debt | Operational deficiencies that increase incident risk or recovery cost |
| Governance Debt | Governance gaps that reduce engineering consistency or decision quality |

---

# Technical Debt Inventory

Consolidate technical debt from all domain scorecards.

Debt items are sourced directly from domain scorecards and are not re-evaluated here.

| Engineering Domain | Debt Category | Debt Level | Business Impact | Source |
|--------------------|--------------|------------|-----------------|--------|
| Architecture | Architectural | | | 01 |
| Database | Design | | | 02 |
| Performance | Design | | | 03 |
| HTTP | Design | | | 04 |
| ASP.NET Core | Design | | | 05 |
| Observability | Operational | | | 06 |
| Messaging | Design | | | 07 |
| Security | Security | | | 08 |
| Cloud Infrastructure | Infrastructure | | | 09 |
| DevOps & CI/CD | Operational | | | 10 |
| Testing | Testing | | | 11 |
| Code Quality | Code | | | 12 |
| Domain & DDD | Design | | | 13 |
| API Design | Design | | | 14 |
| Engineering Governance | Governance | | | 15 |

---

# Debt Level Scale

| Level | Meaning |
|-------|---------|
| Negligible | Minimal debt. No material impact on delivery or quality. |
| Low | Manageable debt. Limited impact on delivery velocity or quality. |
| Moderate | Accumulating debt. Measurable impact on delivery and maintainability. |
| High | Significant debt. Delivery velocity is reduced. Defect risk is elevated. |
| Critical | Severe debt. System evolution is constrained. Business continuity risk. |

---

# Debt Concentration Analysis

Identify the engineering domains with the highest debt concentration.

| Rank | Engineering Domain | Debt Level | Primary Debt Category | Business Risk |
|------|--------------------|------------|----------------------|---------------|
| 1 | | | | |
| 2 | | | | |
| 3 | | | | |
| 4 | | | | |
| 5 | | | | |

---

# Business Impact Assessment

Evaluate the business impact of accumulated technical debt.

| Business Dimension | Impact | Evidence |
|-------------------|--------|----------|
| Delivery Velocity | | |
| Defect Rate | | |
| Operational Cost | | |
| Security Exposure | | |
| Scalability Constraints | | |
| Onboarding Difficulty | | |
| Competitive Agility | | |

---

# High-Risk Debt Items

Document technical debt items that represent immediate business risk.

| Debt Item | Domain | Risk Level | Business Impact | Immediate Action Required |
|-----------|--------|------------|-----------------|--------------------------|
| | | | | |
| | | | | |
| | | | | |

---

# Debt Accumulation Assessment

Evaluate whether technical debt is being managed or accumulating.

| Dimension | Assessment | Notes |
|-----------|------------|-------|
| Technical debt is actively tracked | | |
| Debt remediation is included in delivery planning | | |
| Debt is not increasing faster than it is resolved | | |
| Engineering governance reviews debt regularly | | |
| High-risk debt items have owners and resolution plans | | |

---

# Overall Technical Debt Level

Choose one.

- ☐ **Negligible** — Minimal debt across all domains. Engineering practices are current and sustainable.
- ☐ **Manageable** — Controlled debt. Debt is tracked, prioritized, and reducing.
- ☐ **Significant** — Accumulated debt measurably affects delivery, quality, or operational stability.
- ☐ **Critical** — Technical debt represents a material risk to business continuity, security, or delivery capability.

---

# Debt Remediation Priorities

Identify technical debt items that provide the highest remediation value.

Prioritize by business impact, not implementation effort.

| Priority | Debt Item | Domain | Expected Benefit | Estimated Complexity |
|----------|-----------|--------|------------------|----------------------|
| 1 | | | | |
| 2 | | | | |
| 3 | | | | |
| 4 | | | | |
| 5 | | | | |

---

# Complexity Scale

| Complexity | Meaning |
|------------|---------|
| Low | Can be addressed within a sprint. |
| Medium | Requires a dedicated sprint or small initiative. |
| High | Requires a multi-sprint initiative or architectural change. |
| Very High | Requires a major re-engineering effort. |

---

# Debt Management Recommendations

Provide specific, actionable recommendations for managing and reducing technical debt.

| Recommendation | Debt Category | Expected Outcome | Priority |
|----------------|--------------|------------------|----------|
| | | | |
| | | | |
| | | | |

---

# Formal Technical Debt Decision

Select one decision and document the rationale.

---

## DEBT UNDER CONTROL

Technical debt is at an acceptable level and is being actively managed.

Current engineering practices are sufficient to prevent material debt accumulation.

**Rationale:**

---

## DEBT REMEDIATION REQUIRED

Technical debt has accumulated to a level that measurably affects delivery, quality, or operational stability.

The following remediation actions are required.

**Required Actions:**

-

-

-

**Target Debt Level:**

**Rationale:**

---

## DEBT ESCALATION REQUIRED

Technical debt represents a material risk to business continuity, security, or engineering capability.

Executive attention and dedicated investment are required to address the following critical debt items.

**Critical Debt Items:**

-

-

**Required Investment:**

**Rationale:**

---

# Related Documentation

- scorecards/01-architecture-scorecard.md through scorecards/15-engineering-governance-scorecard.md
- scorecards/17-engineering-scorecard.md
- framework/ENGINEERING-ASSESSMENT-FRAMEWORK.md
- assessments/02-engineering-maturity-assessment.md

---

# Future Enhancements

Future versions of this assessment may include:

- Automated debt scoring from scorecard data.
- Technical debt trend across multiple assessment cycles.
- Debt cost estimation in engineering hours or delivery velocity impact.
- Debt-to-feature ratio tracking.
- Domain-level debt aging analysis.
- AI-assisted debt prioritization based on business risk.
- Integration with backlog management tools for debt tracking.

These enhancements will evolve the Technical Debt Assessment from a point-in-time snapshot into a continuous technical debt intelligence capability that supports long-term engineering investment decisions.
