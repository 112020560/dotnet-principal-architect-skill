# Business Criticality Assessment

> Transform consolidated engineering evidence from all domain scorecards into a formal evaluation of the alignment between the system's business criticality and its current engineering investment level.

---

# Purpose

The Business Criticality Assessment determines whether the engineering investment applied to a software system is proportionate to its business importance and organizational risk exposure.

Its objectives are to:

- Establish the system's business criticality classification.
- Consolidate engineering health evidence from all domain scorecards.
- Evaluate the alignment between engineering investment and business risk.
- Identify engineering gaps that are unacceptable given the system's criticality.
- Produce a formal investment alignment decision.

This assessment does not perform engineering reviews.

This assessment does not recalculate scorecard scores.

All engineering evidence originates from the domain scorecards produced by the Engineering Review Framework.

Business criticality is a business determination, not an engineering determination.

Engineering evidence informs the assessment.

Business stakeholders provide the criticality classification.

---

# Assessment Metadata

| Field | Value |
|-------|-------|
| System | |
| Version | |
| Repository | |
| Business Owner | |
| Assessment Date | |
| Lead Reviewer | |
| Engineering Manager | |
| CTO / Technical Director | |

---

# Executive Summary

Provide a concise summary for executive and governance audiences.

Include:

- Business criticality classification.
- Current engineering health relative to criticality.
- Investment alignment status.
- Highest risk gaps given criticality.
- Formal investment alignment decision.

Limit to one page.

---

# Business Criticality Classification

Classify the system's business criticality. This classification is provided by the business owner.

| Dimension | Value | Notes |
|-----------|-------|-------|
| Business Criticality Level | | |
| Revenue Impact | | |
| Regulatory or Compliance Exposure | | |
| User Impact (number of users affected by outage) | | |
| Reputational Impact | | |
| Data Sensitivity | | |
| Recovery Time Objective (RTO) | | |
| Recovery Point Objective (RPO) | | |

---

# Business Criticality Levels

| Level | Definition |
|-------|-----------|
| Mission-Critical | System failure causes immediate business stoppage, regulatory breach, or significant financial loss. |
| Business-Critical | System failure causes significant operational disruption, revenue loss, or customer impact. |
| Business-Important | System failure causes moderate operational disruption or degraded business performance. |
| Business-Supportive | System failure causes inconvenience but does not materially affect business operations. |
| Non-Critical | System failure has negligible business impact. |

---

# Input Scorecards

This assessment consolidates engineering evidence from all domain scorecards.

| Scorecard | Domain | Grade | Risk Level |
|-----------|--------|-------|------------|
| 01 | Architecture | | |
| 02 | Database | | |
| 03 | Performance | | |
| 04 | HTTP | | |
| 05 | ASP.NET Core | | |
| 06 | Observability | | |
| 07 | Messaging | | |
| 08 | Security | | |
| 09 | Cloud Infrastructure | | |
| 10 | DevOps & CI/CD | | |
| 11 | Testing | | |
| 12 | Code Quality | | |
| 13 | Domain & DDD | | |
| 14 | API Design | | |
| 15 | Engineering Governance | | |
| 17 | Engineering Excellence | | |

---

# Engineering Investment Requirements by Criticality

The following table defines the minimum expected engineering standards by business criticality level.

| Engineering Capability | Mission-Critical | Business-Critical | Business-Important | Supportive |
|------------------------|-----------------|-------------------|-------------------|------------|
| Architecture | A | B | C | D |
| Security | A | A | B | C |
| Observability | A | B | B | C |
| Testing | A | B | B | C |
| DevOps & CI/CD | A | B | C | C |
| Database | A | B | B | C |
| Performance | A | B | C | D |
| Disaster Recovery | A | A | B | C |

---

# Investment Alignment Analysis

Compare current engineering grades against the minimum required for the system's criticality level.

| Engineering Capability | Required Grade | Current Grade | Status | Gap |
|------------------------|---------------|---------------|--------|-----|
| Architecture | | | | |
| Security | | | | |
| Observability | | | | |
| Testing | | | | |
| DevOps & CI/CD | | | | |
| Database | | | | |
| Performance | | | | |
| Disaster Recovery | | | | |

---

# Alignment Status Legend

| Status | Meaning |
|--------|---------|
| ALIGNED | Current grade meets or exceeds the required grade for this criticality level. |
| BELOW STANDARD | Current grade is below the required grade. Investment is required. |
| CRITICAL GAP | Current grade is significantly below the required grade. Immediate action is required. |

---

# Business Risk Assessment

Evaluate the business risk resulting from engineering investment gaps.

| Risk | Engineering Gap | Business Impact | Criticality Multiplier | Priority |
|------|----------------|-----------------|------------------------|----------|
| | | | | |
| | | | | |
| | | | | |

---

# Criticality Multiplier

The criticality multiplier reflects the business amplification of engineering risk.

| Business Criticality | Multiplier | Meaning |
|---------------------|------------|---------|
| Mission-Critical | 5x | Engineering failures have immediate and severe business consequences. |
| Business-Critical | 3x | Engineering failures have significant business consequences. |
| Business-Important | 2x | Engineering failures have measurable business consequences. |
| Supportive | 1x | Engineering failures have limited business consequences. |
| Non-Critical | 0.5x | Engineering failures are tolerated with minimal business impact. |

---

# Investment Gap Summary

Summarize the most significant engineering investment gaps relative to business criticality.

| Gap | Severity | Business Risk | Required Investment |
|-----|----------|---------------|---------------------|
| | | | |
| | | | |
| | | | |

---

# Investment Priorities

Identify engineering investments required to align with business criticality.

Prioritize by business risk reduction value, not implementation effort.

| Priority | Investment | Gap Addressed | Business Risk Reduced | Complexity |
|----------|------------|---------------|----------------------|------------|
| 1 | | | | |
| 2 | | | | |
| 3 | | | | |
| 4 | | | | |
| 5 | | | | |

---

# Overall Investment Alignment

Choose one.

- ☐ **Aligned** — Engineering investment is proportionate to business criticality. No material gaps identified.
- ☐ **Partially Aligned** — Engineering investment is adequate for most capabilities but gaps exist in specific domains.
- ☐ **Under-Invested** — Engineering investment is below the level required for the system's business criticality.
- ☐ **Critically Under-Invested** — Engineering investment gaps pose unacceptable risk given the system's business criticality. Immediate executive action is required.

---

# Formal Investment Alignment Decision

Select one decision and document the rationale.

---

## INVESTMENT ALIGNED

The engineering investment applied to this system is proportionate to its business criticality.

No material investment gaps have been identified.

**Business Criticality Level:**

**Rationale:**

---

## INVESTMENT ALIGNMENT REQUIRED

The engineering investment applied to this system does not meet the standard required for its business criticality.

The following investments are required to align with business risk.

**Business Criticality Level:**

**Required Investments:**

-

-

-

**Target Timeline:**

**Rationale:**

---

## INVESTMENT CRITICALLY MISALIGNED

The engineering investment applied to this system is significantly below the standard required for its business criticality.

The current engineering gaps pose unacceptable business risk.

Executive intervention and dedicated investment are required immediately.

**Business Criticality Level:**

**Critical Gaps:**

-

-

**Required Actions:**

-

-

**Rationale:**

---

## CRITICALITY CLASSIFICATION REQUIRED

The business criticality of this system has not been formally established.

This assessment cannot be completed without a formal business criticality classification from the business owner.

**Required Information:**

-

-

---

# Related Documentation

- scorecards/17-engineering-scorecard.md
- scorecards/08-security-scorecard.md
- scorecards/06-observability-scorecard.md
- scorecards/09-cloud-scorecard.md
- assessments/01-production-readiness-assessment.md
- assessments/02-engineering-maturity-assessment.md
- assessments/05-security-risk-assessment.md
- assessments/08-scalability-assessment.md
- framework/ENGINEERING-ASSESSMENT-FRAMEWORK.md

---

# Future Enhancements

Future versions of this assessment may include:

- Business criticality classification integration with enterprise architecture tools.
- Automated investment gap calculation from scorecard grades.
- Business risk quantification in financial terms.
- SLA and SLO alignment verification against criticality requirements.
- Cross-system portfolio criticality analysis.
- Investment roadmap generation aligned with criticality standards.
- AI-assisted business risk assessment from engineering evidence.
- Historical investment alignment trend tracking.

These enhancements will evolve the Business Criticality Assessment from a point-in-time investment alignment evaluation into a continuous portfolio intelligence capability that enables executive decision-making on engineering investment allocation across the entire software portfolio.
