# Security Risk Assessment

> Transform consolidated engineering evidence from security and related domain scorecards into a formal evaluation of security risk exposure and executive risk acceptance decisions.

---

# Purpose

The Security Risk Assessment evaluates the security risk posture of a software system and determines whether identified risks are acceptable for the organization's risk tolerance.

Its objectives are to:

- Consolidate security evidence from relevant domain scorecards.
- Identify and classify security risks by severity and exploitability.
- Assess the business impact of security exposure.
- Evaluate compliance with security requirements.
- Determine whether identified risks require formal acceptance or remediation.
- Produce a formal security risk decision.

This assessment does not perform a security review.

This assessment does not recalculate scorecard scores.

All engineering evidence originates from the domain scorecards produced by the Engineering Review Framework.

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
| Security Lead | |
| Risk Owner | |
| Compliance Officer | |

---

# Executive Summary

Provide a concise summary for executive and governance audiences.

Include:

- Overall security risk level.
- Critical security exposures.
- Compliance status.
- Risk acceptance requirements.
- Formal security risk decision.

Limit to one page.

---

# Primary Input Scorecards

This assessment draws primary evidence from the following domain scorecards.

| Scorecard | Domain | Security Relevance |
|-----------|--------|--------------------|
| 08 | Security | Authentication, authorization, secrets, input validation |
| 06 | Observability | Audit logging, security event visibility |
| 09 | Cloud Infrastructure | Network security, infrastructure access controls |
| 10 | DevOps & CI/CD | Supply chain security, pipeline integrity |
| 15 | Engineering Governance | Security governance, vulnerability management |

---

# Supporting Input Scorecards

| Scorecard | Domain | Supporting Evidence |
|-----------|--------|---------------------|
| 05 | ASP.NET Core | Authentication pipeline, security middleware |
| 04 | HTTP | HTTPS enforcement, transport security |
| 02 | Database | Database access controls, data protection |
| 14 | API Design | API security contracts |

---

# Security Capability Overview

Consolidate security-relevant grades from domain scorecards.

Grades are sourced directly from domain scorecards and are not recalculated here.

| Security Capability | Grade | Risk Level | Source Scorecard |
|--------------------|-------|------------|------------------|
| Authentication | | | 08 |
| Authorization | | | 08 |
| Input Validation | | | 08 |
| Secrets Management | | | 08 |
| Data Protection | | | 08 |
| Transport Security | | | 04 |
| Database Access Control | | | 02 |
| Audit Logging | | | 06 |
| Infrastructure Security | | | 09 |
| Pipeline Security | | | 10 |
| Security Governance | | | 15 |

---

# Security Risk Inventory

Consolidate security findings from all relevant scorecards.

Risk items are sourced directly from domain scorecards and are not re-evaluated here.

| Risk | Category | Severity | Exploitability | Business Impact | Source |
|------|----------|----------|----------------|-----------------|--------|
| | | | | | |
| | | | | | |
| | | | | | |
| | | | | | |

---

# Risk Severity Scale

| Severity | Meaning |
|----------|---------|
| Critical | Immediate exploitation risk. Data breach or system compromise likely. |
| High | Significant security exposure. Exploitation is possible without advanced capability. |
| Medium | Security weakness present. Exploitation requires specific conditions. |
| Low | Minor security gap. Exploitation is unlikely or impact is limited. |
| Informational | Security observation. No immediate risk. |

---

# Exploitability Scale

| Level | Meaning |
|-------|---------|
| High | Can be exploited without authentication or specialized knowledge. |
| Medium | Exploitation requires authenticated access or specific conditions. |
| Low | Exploitation requires significant capability or privileged access. |
| Negligible | Theoretical risk. Exploitation is unlikely in practice. |

---

# Security Domain Analysis

---

## Authentication and Authorization

Evaluate security controls governing system access.

| Control | Status | Risk | Notes |
|---------|--------|------|-------|
| Authentication mechanism is strong | | | |
| Authorization is enforced on all endpoints | | | |
| Privilege escalation is prevented | | | |
| Token validation is correct | | | |
| Session management is secure | | | |

---

## Data Protection

Evaluate controls protecting sensitive and regulated data.

| Control | Status | Risk | Notes |
|---------|--------|------|-------|
| Sensitive data is encrypted at rest | | | |
| Data is encrypted in transit | | | |
| Personally identifiable information (PII) is identified | | | |
| Data retention policies are enforced | | | |
| Data access is logged | | | |

---

## Input and Boundary Security

Evaluate controls preventing exploitation at system boundaries.

| Control | Status | Risk | Notes |
|---------|--------|------|-------|
| All external input is validated | | | |
| Injection risks are mitigated | | | |
| API contracts enforce input constraints | | | |
| Error responses do not expose internals | | | |
| Upload and file handling is secured | | | |

---

## Secrets and Configuration Security

Evaluate controls protecting credentials and configuration.

| Control | Status | Risk | Notes |
|---------|--------|------|-------|
| Secrets are not stored in source code | | | |
| Secrets are managed by a secrets management system | | | |
| Configuration does not expose sensitive values | | | |
| Secrets are rotated regularly | | | |
| Least privilege is applied to service accounts | | | |

---

## Supply Chain and Pipeline Security

Evaluate security of the build and delivery pipeline.

| Control | Status | Risk | Notes |
|---------|--------|------|-------|
| Dependencies are scanned for vulnerabilities | | | |
| Build pipeline integrity is verified | | | |
| Container images are scanned | | | |
| Artifact provenance is tracked | | | |
| Third-party components are inventoried | | | |

---

## Security Observability

Evaluate whether security events are visible and auditable.

| Control | Status | Risk | Notes |
|---------|--------|------|-------|
| Authentication events are logged | | | |
| Authorization failures are logged | | | |
| Sensitive data access is audited | | | |
| Security alerts are configured | | | |
| Audit logs are tamper-evident | | | |

---

# Compliance Assessment

Evaluate compliance with applicable security requirements.

| Requirement | Status | Evidence | Gap |
|-------------|--------|----------|-----|
| | | | |
| | | | |
| | | | |

---

# Critical Security Findings

Document all Critical and High severity security findings.

A Critical finding is a release blocker unless formally accepted by the risk owner.

| Finding | Severity | Exploitability | Business Impact | Remediation |
|---------|----------|----------------|-----------------|-------------|
| | | | | |
| | | | | |

---

# Risk Acceptance Register

Document security risks that cannot be immediately remediated and require formal executive acceptance.

| Risk | Severity | Business Impact | Accepted By | Acceptance Date | Review Date |
|------|----------|-----------------|-------------|-----------------|-------------|
| | | | | | |
| | | | | | |

---

# Overall Security Risk Level

Choose one.

- ☐ **Low** — Security controls are comprehensive. No significant exposures identified.
- ☐ **Medium** — Security controls are adequate. Known gaps are low severity and managed.
- ☐ **High** — Significant security exposures exist. Remediation is required before production.
- ☐ **Critical** — Material security vulnerabilities are present. Deployment without remediation is not recommended.

---

# Formal Security Risk Decision

Select one decision and document the rationale.

---

## SECURITY RISK ACCEPTED

Security controls are adequate. Identified risks are within organizational risk tolerance.

The system is approved for production deployment from a security perspective.

**Rationale:**

---

## SECURITY RISK ACCEPTED WITH CONDITIONS

Security risk is acceptable after the following conditions are satisfied.

**Conditions:**

-

-

-

**Accepted Residual Risks:**

-

**Risk Owner:**

**Review Date:**

**Rationale:**

---

## SECURITY RISK NOT ACCEPTED

Identified security risks exceed organizational risk tolerance.

Production deployment is not approved until the following risks are remediated.

**Unacceptable Risks:**

-

-

**Required Remediations:**

-

-

**Rationale:**

---

## SECURITY ASSESSMENT INCONCLUSIVE

Insufficient evidence exists to assess security risk adequately.

A dedicated security review or penetration test is required before this assessment can be completed.

**Missing Evidence:**

-

-

---

# Security Investment Priorities

Identify the security improvements with the highest risk reduction value.

| Priority | Security Control | Risk Reduced | Expected Outcome |
|----------|-----------------|--------------|------------------|
| 1 | | | |
| 2 | | | |
| 3 | | | |

---

# Related Documentation

- scorecards/08-security-scorecard.md
- scorecards/06-observability-scorecard.md
- scorecards/09-cloud-scorecard.md
- scorecards/10-devops-cicd-scorecard.md
- reviews/08-security-review.md
- framework/ENGINEERING-ASSESSMENT-FRAMEWORK.md
- assessments/01-production-readiness-assessment.md

---

# Future Enhancements

Future versions of this assessment may include:

- Integration with vulnerability scanning tool outputs (SAST, DAST, SCA).
- CVE severity mapping from dependency scan reports.
- Compliance framework mapping (SOC 2, ISO 27001, PCI-DSS, GDPR).
- Threat modeling integration.
- Security posture trend across assessment cycles.
- Automated risk scoring from scorecard security evidence.
- Penetration testing findings integration.
- AI-assisted threat identification based on system architecture.

These enhancements will evolve the Security Risk Assessment from a point-in-time evaluation into a continuous security intelligence capability that supports proactive security governance.
