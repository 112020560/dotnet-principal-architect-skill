
# Security Rules

> *Security is an architectural property. It must be designed into the system, not added after deployment.*

---

# Purpose

This document defines engineering rules for building secure .NET applications and APIs.

The goal is to reduce security risk while preserving maintainability, performance, and developer productivity.

---

# Security Principles

- Secure by default.
- Least privilege.
- Defense in depth.
- Fail securely.
- Protect sensitive data.
- Never trust external input.

---

# Rule SEC-001 — Authentication and Authorization Are Different

**Severity:** Critical

Authentication identifies a caller.

Authorization determines what the caller may do.

Never mix these responsibilities.

---

# Rule SEC-002 — Validate Every External Input

Treat all incoming data as untrusted.

Validate:

- HTTP requests
- Message payloads
- Files
- Query parameters
- Headers

Validation protects boundaries, not business rules.

---

# Rule SEC-003 — Never Store Secrets in Source Code

Use secure secret management.

Examples:

- Azure Key Vault
- AWS Secrets Manager
- HashiCorp Vault
- Environment variables

Rotate secrets regularly.

---

# Rule SEC-004 — Protect Sensitive Data

Encrypt sensitive information:

- At rest
- In transit

Mask sensitive values in logs.

Never expose credentials, tokens, OTPs, CVVs or full PANs.

---

# Rule SEC-005 — Use HTTPS Everywhere

Require TLS for all production communication.

Reject insecure transport unless explicitly justified.

---

# Rule SEC-006 — Use Strong Authentication

Prefer:

- OAuth2
- OpenID Connect
- JWT
- Mutual TLS (where appropriate)

Avoid custom authentication mechanisms.

---

# Rule SEC-007 — Authorization Must Be Explicit

Protect every business capability intentionally.

Prefer policy-based authorization over scattered role checks.

---

# Rule SEC-008 — Security Logging Must Be Actionable

Log security-relevant events:

- Login
- Logout
- Failed authentication
- Authorization failures
- Privilege changes
- Secret rotation

Do not log secrets.

---

# Rule SEC-009 — Apply Least Privilege

Applications, users and services should receive only the permissions they require.

Review permissions regularly.

---

# Rule SEC-010 — Dependencies Must Be Maintained

Keep frameworks and libraries updated.

Review:

- CVEs
- Security advisories
- Breaking security fixes

---

# Rule SEC-011 — Fail Securely

Unexpected failures should deny access by default.

Avoid exposing stack traces or internal implementation details.

---

# Rule SEC-012 — Rate Limiting Protects Availability

Protect public endpoints against abuse.

Review:

- Rate limiting
- Throttling
- Quotas

---

# Rule SEC-013 — Protect Against Injection

Always use parameterized queries.

Avoid string concatenation for:

- SQL
- Shell commands
- Dynamic queries

---

# Rule SEC-014 — Secure File Handling

Validate:

- Size
- Type
- Extension
- Content

Store uploaded files outside the application root whenever possible.

---

# Rule SEC-015 — Security Is Continuously Reviewed

Perform:

- Dependency scanning
- Secret scanning
- Static analysis
- Penetration testing
- Security code reviews

Security is an ongoing engineering activity.

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
