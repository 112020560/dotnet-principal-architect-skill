
# Security Rules

> *Security is an architectural property. It must be designed into the system, not added after deployment.*

---

# Purpose

This document defines engineering rules for building secure .NET applications and APIs.

The goal is to reduce security risk while preserving maintainability, performance, and developer productivity.

Rule IDs and descriptions in this document must always match `docs/00-rule-catalog.md` exactly — if a number here does not match the catalog, the catalog wins and this file has drifted.

---

# Security Principles

- Secure by default.
- Least privilege.
- Defense in depth.
- Fail securely.
- Protect sensitive data.
- Never trust external input.

---

# Rule SEC-001 — Validate Every External Input

**Severity:** Critical

Treat all incoming data as untrusted.

Validate:

- HTTP requests
- Message payloads
- Files
- Query parameters
- Headers

Validation protects boundaries, not business rules.

Related Rules: HTTP-008, API-003.

---

# Rule SEC-002 — Apply Least Privilege

Applications, users and services should receive only the permissions they require.

Review permissions regularly.

---

# Rule SEC-003 — Authenticate Before Authorizing

Authentication identifies a caller. Authorization determines what the caller may do. Never mix these responsibilities.

Prefer standard, well-reviewed mechanisms:

- OAuth2
- OpenID Connect
- JWT
- Mutual TLS (where appropriate)

Avoid custom authentication mechanisms.

---

# Rule SEC-004 — Never Expose Secrets

Use secure secret management.

Examples:

- Azure Key Vault
- AWS Secrets Manager
- HashiCorp Vault
- Environment variables

Rotate secrets regularly. Never store secrets in source code or configuration files committed to version control.

Related Rules: OBS-004, HTTP-009.

---

# Rule SEC-005 — Protect Sensitive Data in Transit and at Rest

Encrypt sensitive information at rest and in transit. Require TLS for all production communication — reject insecure transport unless explicitly justified.

Mask sensitive values in logs. Never expose credentials, tokens, OTPs, CVVs, or full PANs.

---

# Rule SEC-006 — Fail Securely

Unexpected failures should deny access by default.

Avoid exposing stack traces or internal implementation details.

---

# Rule SEC-007 — Authorization Must Be Explicit

Protect every business capability intentionally.

Prefer policy-based authorization over scattered role checks.

---

# Rule SEC-008 — Protect Against Injection

Always use parameterized queries.

Avoid string concatenation for:

- SQL
- Shell commands
- Dynamic queries

Related Rules: DB (persistence layer), ANTI.

---

# Rule SEC-009 — Dependencies Must Be Maintained

Keep frameworks and libraries updated.

Review:

- CVEs
- Security advisories
- Breaking security fixes

---

# Rule SEC-010 — Rate Limiting Protects Availability

Protect public endpoints against abuse.

Review:

- Rate limiting
- Throttling
- Quotas

---

# Additional Engineering Guidance

The following guidance is established practice but is not a numbered rule in `docs/00-rule-catalog.md` — do not cite it with a rule ID.

## Security Logging Must Be Actionable

Log security-relevant events — login, logout, failed authentication, authorization failures, privilege changes, secret rotation — without logging secrets themselves. See OBS-001.

## Secure File Handling

Validate size, type, extension, and content of uploaded files. Store uploaded files outside the application root whenever possible.

## Security Is Continuously Reviewed

Perform dependency scanning, secret scanning, static analysis, penetration testing, and security code reviews as an ongoing engineering activity, not a one-time gate.

---

# Common Security Smells

- Hardcoded secrets
- Missing authorization
- Logging tokens
- SQL injection risks
- Weak password storage
- Excessive privileges
- Missing HTTPS
- Trusting client input
- Unvalidated uploads

---

# Security Review Checklist

- Is authentication appropriate?
- Is authorization explicit?
- Are secrets protected?
- Is sensitive data encrypted?
- Are inputs validated?
- Are dependencies updated?
- Are logs free of secrets?
- Is least privilege applied?
- Is rate limiting configured?
- Are uploads validated?

---

# Recommended Stack

- ASP.NET Core Authentication
- Microsoft Identity
- OAuth2 / OpenID Connect
- JWT Bearer
- Data Protection API
- Azure Key Vault
- AWS Secrets Manager
- OpenTelemetry
- Serilog

---

# References

- OWASP Top 10
- OWASP ASVS
- Microsoft Secure Coding Guidelines
- Microsoft Identity Platform
- NIST Cybersecurity Framework
