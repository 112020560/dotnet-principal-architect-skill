# Security Compliance Review

> Evaluate the security posture of a software solution against the Principal .NET Architect Engineering Standard.

---

# Purpose

This review evaluates the security capabilities of a software solution throughout its architecture, implementation, deployment, and operation.

Its objectives are to:

- Verify compliance with the Engineering Standard.
- Evaluate identity and access management.
- Assess data protection.
- Review API and infrastructure security.
- Evaluate secure development practices.
- Assess operational security readiness.
- Capture engineering decisions and trade-offs.

This review verifies compliance.

It does not redefine engineering rules.

All referenced rules are defined in:

> docs/00-rule-catalog.md

---

# Review Scope

This review evaluates:

- Identity
- Authentication
- Authorization
- Secrets Management
- Data Protection
- API Security
- Infrastructure Security
- Secure Development
- Supply Chain Security
- Monitoring & Detection
- Incident Response

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
| Security Standard | |
| Review Scope | |

---

# Executive Summary

Summarize the overall security posture.

Include:

- Main strengths.
- Main weaknesses.
- Highest security risks.
- Operational concerns.
- Recommended priorities.

---

# Compliance Legend

| Compliance | Meaning |
|------------|---------|
| ✅ Compliant | Fully complies with the Engineering Standard. |
| ⚠️ Partially Compliant | Mostly compliant but improvements are recommended. |
| ❌ Non-Compliant | Violates the Engineering Standard. |
| ➖ Not Applicable | Rule does not apply to the reviewed solution. |

---

# Security Compliance Review

| Compliance | Rule | Evidence | Notes |
|------------|------|----------|-------|
| | SEC-001 | | |
| | SEC-002 | | |
| | SEC-003 | | |
| | SEC-004 | | |
| | SEC-005 | | |
| | SEC-006 | | |
| | SEC-007 | | |
| | SEC-008 | | |
| | SEC-009 | | |
| | SEC-010 | | |

---

# Engineering Review Questions

These questions capture engineering judgment.

They complement the compliance review by documenting the reasoning behind engineering decisions.

Answers do not affect the Compliance Score.

---

## Answer Legend

| Value | Meaning |
|--------|---------|
| Yes | Implemented |
| No | Not Implemented |
| Partial | Partially Implemented |
| Unknown | Unable to Determine |
| N/A | Not Applicable |

---

# Identity & Authentication

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Is authentication centralized? | | | |
| Is MFA enforced where appropriate? | | | |
| Is OAuth2/OpenID Connect implemented correctly? | | | |
| Are refresh tokens protected? | | | |
| Are machine identities managed securely? | | | |
| Are authentication failures monitored? | | | |

---

# Authorization

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Is authorization enforced server-side? | | | |
| Is Least Privilege applied? | | | |
| Are permissions centrally managed? | | | |
| Are authorization policies reusable? | | | |
| Is privilege escalation prevented? | | | |

---

# Secrets Management

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Are secrets stored outside source code? | | | |
| Is a centralized secrets manager used? | | | |
| Are secrets rotated periodically? | | | |
| Are certificates managed securely? | | | |
| Are connection strings protected? | | | |

---

# Data Protection

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Is encryption applied at rest? | | | |
| Is TLS enforced in transit? | | | |
| Is sensitive data minimized? | | | |
| Is PII identified and protected? | | | |
| Are encryption keys managed securely? | | | |
| Is data classification documented? | | | |

---

# API Security

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Is input validation implemented? | | | |
| Is output encoding applied where appropriate? | | | |
| Is CORS configured correctly? | | | |
| Are security headers configured? | | | |
| Is rate limiting implemented? | | | |
| Are request size limits configured? | | | |

---

# Infrastructure Security

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Are containers scanned regularly? | | | |
| Is Least Privilege applied to infrastructure? | | | |
| Are unnecessary ports closed? | | | |
| Are network boundaries enforced? | | | |
| Are runtime permissions minimized? | | | |

---

# Secure Development

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Are code reviews mandatory? | | | |
| Is static code analysis executed? | | | |
| Are secrets scanned before merge? | | | |
| Are dependency vulnerabilities reviewed? | | | |
| Is threat modeling considered during design? | | | |

---

# Supply Chain Security

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Are third-party dependencies monitored? | | | |
| Is Software Composition Analysis performed? | | | |
| Is an SBOM generated? | | | |
| Are package signatures verified when applicable? | | | |
| Is a dependency update policy defined? | | | |

---

# Monitoring & Detection

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Are authentication failures monitored? | | | |
| Are authorization failures logged? | | | |
| Are suspicious activities detected? | | | |
| Are audit logs protected from tampering? | | | |
| Are security alerts actionable? | | | |

---

# Incident Response

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Can security incidents be investigated? | | | |
| Are forensic logs available? | | | |
| Are incident response procedures documented? | | | |
| Can compromised credentials be revoked quickly? | | | |
| Are recovery procedures tested? | | | |

---

# Production Evidence

## Identity

| Evidence | Available | Source | Notes |
|----------|-----------|--------|-------|
| Failed Logins | | | |
| MFA Adoption | | | |
| Authentication Errors | | | |
| Token Expiration Metrics | | | |

---

## API Security

| Evidence | Available | Source | Notes |
|----------|-----------|--------|-------|
| Rate Limit Hits | | | |
| Invalid Tokens | | | |
| Rejected Requests | | | |
| Security Header Validation | | | |

---

## Infrastructure

| Evidence | Available | Source | Notes |
|----------|-----------|--------|-------|
| Vulnerability Scan Reports | | | |
| Container Scan Reports | | | |
| Patch Compliance | | | |
| Certificate Expiration Monitoring | | | |

---

## Monitoring

| Evidence | Available | Source | Notes |
|----------|-----------|--------|-------|
| Security Alerts | | | |
| SIEM Integration | | | |
| Audit Logs | | | |
| Threat Detection Events | | | |

---

# Threat Readiness

Evaluate the system's preparedness against common security threats.

| Threat Scenario | Protected | Evidence | Notes |
|-----------------|-----------|----------|-------|
| Credential Theft | | | |
| Privilege Escalation | | | |
| SQL Injection | | | |
| Cross-Site Scripting (XSS) | | | |
| Cross-Site Request Forgery (CSRF) | | | |
| Replay Attack | | | |
| Token Theft | | | |
| Insider Threat | | | |
| Dependency Compromise | | | |
| Supply Chain Attack | | | |

---

# Security Maturity

| Capability | Level |
|------------|------:|
| Identity | |
| Authorization | |
| Secrets Management | |
| Data Protection | |
| Infrastructure Security | |
| Monitoring & Detection | |
| Incident Response | |

---

## Overall Maturity

- ☐ Level 1 – Basic Authentication
- ☐ Level 2 – Secure APIs
- ☐ Level 3 – Defense in Depth
- ☐ Level 4 – Zero Trust Architecture
- ☐ Level 5 – Security by Design

---

# Security Smells

| Detected | Anti-Pattern | Impact | Evidence | Recommendation |
|----------|--------------|--------|----------|----------------|
| ☐ | Hardcoded Secrets | | | |
| ☐ | Missing Authorization Checks | | | |
| ☐ | Over-Privileged Accounts | | | |
| ☐ | Long-Lived Tokens | | | |
| ☐ | Disabled TLS Validation | | | |
| ☐ | Excessive Permissions | | | |
| ☐ | Public Administrative Endpoints | | | |
| ☐ | Sensitive Data in Logs | | | |
| ☐ | Missing Dependency Scanning | | | |
| ☐ | Outdated Security Libraries | | | |
| ☐ | Trusting Client-Side Validation | | | |
| ☐ | Weak Password Policy | | | |

---

# Positive Findings

Document engineering decisions that improve the overall security posture.

Examples:

- Strong identity architecture.
- Excellent secrets management.
- Defense in depth implemented.
- Secure software supply chain.
- Comprehensive monitoring and alerting.

---

# Risks

| Risk | Business Impact | Recommendation |
|------|-----------------|----------------|
| | | |
| | | |

---

# Top Recommendations

| Priority | Recommendation | Expected Benefit |
|----------|----------------|------------------|
| 1 | | |
| 2 | | |
| 3 | | |

---

# Security Compliance Score

| Area | Compliance |
|------|-----------:|
| Identity & Authentication | |
| Authorization | |
| Secrets Management | |
| Data Protection | |
| API Security | |
| Infrastructure Security | |
| Monitoring & Detection | |

---

## Overall Compliance

Security Compliance

__________ %

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

# Review Confidence

| Area | Confidence | Evidence |
|------|------------|----------|
| Source Code | | |
| Configuration | | |
| Runtime Behavior | | |
| Production Telemetry | | |
| Security Controls | | |

---

## Overall Confidence

☐ High

☐ Medium

☐ Low

---

# Related Engineering Rules

## Security

- SEC-001 → SEC-010

---

# Related Documentation

- docs/00-rule-catalog.md
- docs/10-security.md
- docs/08-observability.md
- docs/13-anti-patterns.md
- docs/14-code-review-style.md

---

# Final Assessment

Provide a concise conclusion covering:

- Security posture.
- Identity and access management.
- Data protection.
- Operational readiness.
- Security maturity.
- Highest-value improvements.

The objective is to ensure the solution protects business assets through secure architecture, secure implementation, secure operations, and continuous monitoring.