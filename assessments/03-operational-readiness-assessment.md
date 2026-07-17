# Operational Readiness Assessment

> Transform consolidated engineering evidence from observability, cloud infrastructure, DevOps, and governance scorecards into a formal evaluation of the organization's ability to operate and sustain the system in production.

---

# Purpose

The Operational Readiness Assessment determines whether the organization is prepared to operate, sustain, and recover the system in a production environment.

Its objectives are to:

- Consolidate operational evidence from relevant domain scorecards.
- Evaluate monitoring, alerting, and observability capabilities.
- Assess incident response and recovery readiness.
- Evaluate deployment and operational automation.
- Identify operational risks and gaps.
- Produce a formal operational readiness determination.

This assessment does not perform engineering reviews.

This assessment does not recalculate scorecard scores.

All engineering evidence originates from the domain scorecards produced by the Engineering Review Framework.

Operational readiness is distinct from production readiness.

Production readiness determines whether the system can be deployed.

Operational readiness determines whether the organization can sustain it.

---

# Assessment Metadata

| Field | Value |
|-------|-------|
| System | |
| Version | |
| Repository | |
| Environment | |
| Assessment Date | |
| Lead Reviewer | |
| Operations Lead | |
| SRE Lead | |

---

# Executive Summary

Provide a concise summary for executive and governance audiences.

Include:

- Overall operational readiness level.
- Strongest operational capabilities.
- Critical operational gaps.
- Highest operational risks.
- Formal operational readiness decision.

Limit to one page.

---

# Primary Input Scorecards

This assessment draws primary evidence from the following domain scorecards.

| Scorecard | Domain | Operational Relevance |
|-----------|--------|-----------------------|
| 06 | Observability | Monitoring, logging, tracing, alerting |
| 09 | Cloud Infrastructure | Infrastructure resilience, health checks, scaling |
| 10 | DevOps & CI/CD | Deployment automation, pipeline reliability |
| 08 | Security | Operational security controls |
| 15 | Engineering Governance | Operational procedures, runbooks, ownership |

---

# Supporting Input Scorecards

| Scorecard | Domain | Supporting Evidence |
|-----------|--------|---------------------|
| 03 | Performance | Capacity planning, bottleneck identification |
| 07 | Messaging | Message queue operational health |
| 02 | Database | Database operational health, backup strategy |
| 17 | Engineering Excellence | Overall operational maturity |

---

# Operational Capability Overview

This section consolidates operational evidence from relevant domain scorecards.

Scores and grades are sourced directly from domain scorecards and are not recalculated here.

| Operational Capability | Grade | Risk Level | Source Scorecard |
|------------------------|-------|------------|------------------|
| Observability | | | 06 |
| Alerting | | | 06 |
| Infrastructure Resilience | | | 09 |
| Deployment Automation | | | 10 |
| Incident Response | | | 15 |
| Runbook Coverage | | | 15 |
| Security Operations | | | 08 |
| Database Operations | | | 02 |
| Messaging Operations | | | 07 |
| Capacity Management | | | 03 |

---

# Operational Readiness Dimensions

---

## Observability Readiness

Evaluate whether the system provides sufficient visibility for production operations.

| Capability | Status | Source | Notes |
|------------|--------|--------|-------|
| Structured logging implemented | | 06 | |
| Logs centralized and searchable | | 06 | |
| Metrics collected and retained | | 06 | |
| Distributed tracing operational | | 06 | |
| Correlation identifiers propagated | | 06 | |
| Dashboards available | | 06 | |
| Alerts configured and tested | | 06 | |
| Alert noise is managed | | 06 | |

---

## Incident Response Readiness

Evaluate whether the organization can detect, respond to, and resolve production incidents.

| Capability | Status | Source | Notes |
|------------|--------|--------|-------|
| Incident response process defined | | 15 | |
| On-call ownership established | | 15 | |
| Runbooks available for critical scenarios | | 15 | |
| Escalation paths defined | | 15 | |
| Post-mortem process established | | 15 | |
| Mean Time to Detect (MTTD) measured | | 06 | |
| Mean Time to Recover (MTTR) measured | | 06 | |

---

## Deployment Operational Readiness

Evaluate the operational reliability of the deployment process.

| Capability | Status | Source | Notes |
|------------|--------|--------|-------|
| Deployment is automated | | 10 | |
| Deployments are repeatable | | 10 | |
| Deployment history is tracked | | 10 | |
| Rollback procedure is documented | | 10 | |
| Rollback has been tested | | 10 | |
| Database migrations are automated | | 02 | |
| Feature flags or progressive delivery available | | 10 | |

---

## Infrastructure Operational Readiness

Evaluate whether the infrastructure can sustain production workloads reliably.

| Capability | Status | Source | Notes |
|------------|--------|--------|-------|
| Health checks implemented | | 09 | |
| Auto-scaling configured | | 09 | |
| Infrastructure is resilient to failures | | 09 | |
| Redundancy is configured for critical components | | 09 | |
| Configuration management is automated | | 09 | |
| Infrastructure is reproducible | | 09 | |

---

## Recovery Readiness

Evaluate the organization's ability to recover from failures, data loss, or disaster scenarios.

| Capability | Status | Source | Notes |
|------------|--------|--------|-------|
| Backup strategy defined and tested | | 02 | |
| Recovery Time Objective (RTO) defined | | 09 | |
| Recovery Point Objective (RPO) defined | | 02 | |
| Disaster recovery procedure documented | | 09 | |
| Disaster recovery tested | | 09 | |
| Data restoration has been validated | | 02 | |

---

## Operational Knowledge Readiness

Evaluate whether operational knowledge is documented, transferable, and not dependent on individuals.

| Capability | Status | Source | Notes |
|------------|--------|--------|-------|
| System architecture is documented | | 15 | |
| Runbooks cover common operational scenarios | | 15 | |
| Operational dependencies are documented | | 15 | |
| Third-party dependencies are inventoried | | 15 | |
| Operations can be performed without key individuals | | 15 | |

---

# Operational Status Legend

| Status | Meaning |
|--------|---------|
| READY | Capability is fully operational. |
| PARTIAL | Capability is partially implemented. Known gaps exist. |
| NOT READY | Capability is absent or inadequate. Operational risk. |
| N/A | Capability is not applicable to this system. |

---

# Operational Risks

Document operational risks identified across all relevant scorecards.

| Risk | Severity | Operational Impact | Source | Recommendation |
|------|----------|--------------------|--------|----------------|
| | | | | |
| | | | | |
| | | | | |

---

# Operational Gaps

Document the highest-priority operational gaps requiring resolution.

| Gap | Severity | Business Impact | Remediation |
|-----|----------|-----------------|-------------|
| | | | |
| | | | |
| | | | |

---

# Operational Strengths

Document operational capabilities that reduce risk and increase confidence.

Examples:

- Mature observability platform.
- Automated deployment with validated rollback.
- Well-maintained runbooks.
- Established on-call rotation.
- Proven disaster recovery procedures.

---

# Operational Confidence Assessment

Evaluate overall confidence in the organization's ability to operate the system sustainably.

| Dimension | Confidence | Notes |
|-----------|------------|-------|
| System visibility (observability) | | |
| Incident detection and response | | |
| Deployment reliability | | |
| Infrastructure resilience | | |
| Recovery capability | | |
| Operational knowledge coverage | | |

---

## Overall Operational Confidence

Choose one.

- ☐ Very High — All operational capabilities are mature and validated.
- ☐ High — Core operational capabilities are in place. Minor gaps identified.
- ☐ Medium — Operational capabilities are partially implemented. Significant gaps require resolution.
- ☐ Low — Critical operational capabilities are absent. Operational risk is material.
- ☐ Critical — The organization is not prepared to operate this system in production.

---

# Formal Operational Readiness Decision

Select one decision and document the rationale.

---

## OPERATIONALLY READY

The organization demonstrates the capabilities required to operate, monitor, and recover the system in production.

**Rationale:**

---

## OPERATIONALLY READY WITH CONDITIONS

The organization is operationally ready after the following conditions are resolved.

**Conditions:**

-

-

-

**Target Resolution Date:**

**Rationale:**

---

## OPERATIONALLY NOT READY

The organization lacks critical operational capabilities required to sustain this system in production.

**Blockers:**

-

-

**Required Actions:**

-

-

**Rationale:**

---

## OPERATIONAL ASSESSMENT INCONCLUSIVE

Insufficient evidence exists to determine operational readiness.

Additional engineering reviews or evidence collection is required.

**Missing Evidence:**

-

-

---

# Investment Priorities

Identify the operational investments with the highest risk reduction value.

| Priority | Capability | Current State | Target State | Expected Outcome |
|----------|------------|---------------|--------------|------------------|
| 1 | | | | |
| 2 | | | | |
| 3 | | | | |

---

# Related Documentation

- scorecards/06-observability-scorecard.md
- scorecards/09-cloud-scorecard.md
- scorecards/10-devops-cicd-scorecard.md
- scorecards/08-security-scorecard.md
- scorecards/15-engineering-governance-scorecard.md
- reviews/06-observability-review.md
- reviews/10-devops-cicd-review.md
- reviews/16-production-readiness.md
- framework/ENGINEERING-ASSESSMENT-FRAMEWORK.md
- assessments/01-production-readiness-assessment.md

---

# Future Enhancements

Future versions of this assessment may include:

- DORA metrics integration (Deployment Frequency, Lead Time, MTTR, Change Failure Rate).
- SLO and error budget compliance tracking.
- Automated runbook coverage analysis.
- Operational maturity trend across assessment cycles.
- Alert quality scoring (signal-to-noise ratio).
- On-call burden analysis.
- AI-assisted identification of operational blind spots.

These enhancements will evolve the Operational Readiness Assessment from a point-in-time evaluation into a continuous operational intelligence capability capable of measuring and improving operational maturity over time.
