# Cloud Readiness Assessment

> Transform consolidated engineering evidence from infrastructure, performance, observability, and DevOps scorecards into a formal evaluation of the system's readiness for cloud or cloud-native deployment.

---

# Purpose

The Cloud Readiness Assessment determines whether a software system is architecturally and operationally prepared for effective deployment and operation in cloud environments.

Its objectives are to:

- Consolidate cloud-readiness evidence from relevant domain scorecards.
- Evaluate adherence to cloud-native engineering principles.
- Assess scalability, resilience, and operational cloud capabilities.
- Identify cloud adoption blockers and gaps.
- Produce a formal cloud readiness decision.

This assessment does not perform engineering reviews.

This assessment does not recalculate scorecard scores.

All engineering evidence originates from the domain scorecards produced by the Engineering Review Framework.

Cloud readiness is distinct from production readiness.

Production readiness determines whether a system can be deployed.

Cloud readiness determines whether a system is architecturally suited for cloud environments.

---

# Assessment Metadata

| Field | Value |
|-------|-------|
| System | |
| Version | |
| Repository | |
| Target Environment | |
| Assessment Date | |
| Lead Reviewer | |
| Platform Lead | |
| Cloud Architect | |

---

# Executive Summary

Provide a concise summary for executive and governance audiences.

Include:

- Overall cloud readiness level.
- Strongest cloud-native capabilities.
- Critical cloud adoption blockers.
- Migration or adoption risks.
- Formal cloud readiness decision.

Limit to one page.

---

# Primary Input Scorecards

This assessment draws primary evidence from the following domain scorecards.

| Scorecard | Domain | Cloud Relevance |
|-----------|--------|-----------------|
| 09 | Cloud Infrastructure | Containerization, orchestration, resilience, health checks |
| 10 | DevOps & CI/CD | Deployment automation, pipeline cloud-readiness |
| 06 | Observability | Cloud-native observability, telemetry |
| 03 | Performance | Scalability, resource efficiency |
| 01 | Architecture | Statelessness, bounded contexts, modularity |

---

# Supporting Input Scorecards

| Scorecard | Domain | Supporting Evidence |
|-----------|--------|---------------------|
| 08 | Security | Cloud security controls, secrets management |
| 05 | ASP.NET Core | Health checks, configuration management |
| 07 | Messaging | Cloud messaging patterns |
| 02 | Database | Managed database, connection resilience |

---

# Cloud Readiness Capability Overview

Consolidate cloud-relevant grades from domain scorecards.

Grades are sourced directly from domain scorecards and are not recalculated here.

| Cloud Capability | Grade | Risk Level | Source Scorecard |
|-----------------|-------|------------|------------------|
| Application Statelessness | | | 01 |
| Container Readiness | | | 09 |
| Orchestration Readiness | | | 09 |
| Health Check Implementation | | | 05, 09 |
| Environment-Driven Configuration | | | 05 |
| Observability (Cloud-Native) | | | 06 |
| Horizontal Scalability | | | 03, 09 |
| Resilience Design | | | 09 |
| Deployment Automation | | | 10 |
| Cloud Security Controls | | | 08 |
| Infrastructure as Code | | | 09 |

---

# Cloud-Native Principles Assessment

Evaluate adherence to cloud-native engineering principles.

---

## The Twelve-Factor Application Principles

| Factor | Principle | Status | Evidence |
|--------|-----------|--------|----------|
| 1 | Codebase — One codebase tracked in version control | | |
| 2 | Dependencies — Explicitly declared and isolated | | |
| 3 | Configuration — Stored in the environment, not code | | |
| 4 | Backing Services — Treated as attached resources | | |
| 5 | Build, Release, Run — Strictly separated stages | | |
| 6 | Processes — Stateless, share-nothing processes | | |
| 7 | Port Binding — Services exported via port binding | | |
| 8 | Concurrency — Scaled out via the process model | | |
| 9 | Disposability — Fast startup and graceful shutdown | | |
| 10 | Dev/Prod Parity — Development and production are similar | | |
| 11 | Logs — Treated as event streams | | |
| 12 | Admin Processes — Run as one-off processes | | |

---

## Cloud Resilience Principles

| Principle | Status | Evidence |
|-----------|--------|----------|
| Application handles transient failures gracefully | | |
| Retry policies are implemented | | |
| Circuit breakers are configured | | |
| Timeouts are explicit | | |
| Graceful degradation is supported | | |
| Health checks are implemented and accurate | | |

---

## Cloud Scalability Principles

| Principle | Status | Evidence |
|-----------|--------|----------|
| Application is stateless | | |
| Session state is externalized | | |
| Application scales horizontally without code changes | | |
| Databases support cloud scaling patterns | | |
| External caching is used where appropriate | | |
| Resources are not hardcoded | | |

---

# Cloud Adoption Readiness

Evaluate the system's readiness for cloud adoption across key adoption dimensions.

| Dimension | Readiness | Notes |
|-----------|-----------|-------|
| Containerization | | |
| Container orchestration compatibility | | |
| Infrastructure as Code | | |
| Managed service compatibility | | |
| Cloud-native CI/CD pipeline | | |
| Cloud observability integration | | |
| Cloud identity and access management | | |
| Cloud secrets management | | |

---

# Cloud Adoption Blockers

Document findings that prevent or significantly complicate cloud adoption.

| Blocker | Severity | Impact | Remediation |
|---------|----------|--------|-------------|
| | | | |
| | | | |

If no blockers exist, state:

> No cloud adoption blockers identified.

---

# Cloud Migration Risks

Document risks that may arise during or after cloud migration.

| Risk | Severity | Business Impact | Mitigation |
|------|----------|-----------------|------------|
| | | | |
| | | | |

---

# Overall Cloud Readiness Level

Choose one.

- ☐ **Cloud-Native Ready** — The system fully adheres to cloud-native principles. No significant blockers.
- ☐ **Cloud-Ready** — The system is ready for cloud deployment with minor adaptations required.
- ☐ **Cloud-Compatible** — The system can operate in a cloud environment with moderate refactoring.
- ☐ **Cloud Migration Required** — Significant architectural changes are required before cloud adoption.
- ☐ **Cloud Adoption Blocked** — Fundamental architectural constraints prevent cloud adoption without re-engineering.

---

# Formal Cloud Readiness Decision

Select one decision and document the rationale.

---

## CLOUD-READY

The system satisfies cloud-native engineering principles and is ready for cloud deployment.

**Rationale:**

---

## CLOUD-READY WITH ADAPTATIONS

The system is ready for cloud deployment after the following adaptations are completed.

**Required Adaptations:**

-

-

-

**Rationale:**

---

## CLOUD MIGRATION REQUIRED

Significant architectural or engineering changes are required before the system can operate effectively in a cloud environment.

**Required Changes:**

-

-

-

**Estimated Migration Complexity:** Low / Medium / High / Very High

**Rationale:**

---

## CLOUD ADOPTION NOT RECOMMENDED

The system's current architecture or technology choices make cloud adoption impractical without full re-engineering.

**Blockers:**

-

-

**Rationale:**

---

# Investment Priorities

Identify cloud readiness improvements with the highest adoption value.

| Priority | Improvement | Expected Outcome | Complexity |
|----------|-------------|------------------|------------|
| 1 | | | |
| 2 | | | |
| 3 | | | |

---

# Related Documentation

- scorecards/09-cloud-scorecard.md
- scorecards/10-devops-cicd-scorecard.md
- scorecards/06-observability-scorecard.md
- scorecards/01-architecture-scorecard.md
- reviews/09-cloud-review.md
- reviews/10-devops-cicd-review.md
- framework/ENGINEERING-ASSESSMENT-FRAMEWORK.md
- assessments/01-production-readiness-assessment.md
- assessments/03-operational-readiness-assessment.md

---

# Future Enhancements

Future versions of this assessment may include:

- Cloud provider-specific readiness evaluation (per deployment target).
- Cloud cost efficiency assessment.
- Multi-cloud and hybrid cloud readiness.
- Kubernetes-specific readiness scoring.
- Serverless architecture readiness.
- Cloud-native security posture evaluation.
- FinOps readiness assessment.
- AI-assisted cloud adoption roadmap generation.

These enhancements will evolve the Cloud Readiness Assessment from a point-in-time evaluation into a continuous cloud adoption intelligence capability that guides organizations through progressive cloud-native adoption.
