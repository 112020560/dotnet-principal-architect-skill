# Security Review Playbook

> Step-by-step guidance for executing a Security Compliance Review.

---

## Purpose

This playbook provides repeatable execution guidance for conducting a Security Compliance Review using the Engineering Assessment Framework.

It answers: How should this review be executed?

---

## Audience

- Software Architects
- Principal Engineers
- Security Engineers
- Technical Leads

---

## Prerequisites

- Access to the source repository.
- Access to infrastructure and deployment configuration if available.
- Familiarity with `reviews/08-security-review.md`.
- Familiarity with SEC rules in `docs/00-rule-catalog.md`.

---

## When to Execute

- Before every production deployment.
- When new authentication or authorization mechanisms are introduced.
- When handling new categories of sensitive data.
- As part of a production readiness process.

---

## Estimated Duration

| System Size | Estimated Duration |
|-------------|-------------------|
| Small | 2–4 hours |
| Medium | 4–8 hours |
| Large | 1–2 days |

---

## Preparation

1. Read `docs/10-security.md`.
2. Read `docs/00-rule-catalog.md` — SEC section.
3. Open `reviews/08-security-review.md` as the working document.
4. Identify: authentication mechanism, authorization approach, all external input entry points, secrets management strategy.
5. Clarify any applicable compliance requirements (GDPR, PCI-DSS, SOC 2).

---

## Execution Steps

### Step 1 — Evaluate Authentication

- Verify that authentication is enforced on all non-public endpoints.
- Check the authentication mechanism: JWT, OAuth 2.0, API Key, Cookie.
- Verify that token validation is correct: issuer, audience, expiry, signature.
- Check for weak or missing authentication on administrative endpoints.

Rule references: SEC-003.

### Step 2 — Evaluate Authorization

- Verify that authorization is explicitly defined and not implicitly assumed.
- Check that every endpoint has an authorization policy or explicitly opts out with `[AllowAnonymous]`.
- Identify horizontal privilege escalation risks: user A accessing user B's resources.
- Verify that role or claim checks are applied to sensitive operations.

Rule references: SEC-002, SEC-007.

### Step 3 — Evaluate Input Validation

- Verify that all external input is validated before processing.
- Identify endpoints that accept and use user-supplied identifiers without validation.
- Check for SQL injection risks in raw queries or string-interpolated SQL.
- Check for mass assignment vulnerabilities (binding full DTOs from request bodies to domain models).

Rule references: SEC-001.

### Step 4 — Evaluate Secrets Management

- Search for connection strings, API keys, passwords, or tokens in source code.
- Search for secrets in `appsettings.json` committed to the repository.
- Verify that secrets are sourced from environment variables, Azure Key Vault, AWS Secrets Manager, or equivalent.
- Check that secrets are not logged.

Rule references: SEC-004, OBS-004.

### Step 5 — Evaluate Data Protection

- Identify all sensitive data categories handled by the system (PII, financial, health).
- Verify that sensitive data is encrypted at rest where required.
- Verify that sensitive data is transmitted only over TLS.
- Check that sensitive data is not included in URLs, logs, or error responses.

Rule references: SEC-005.

### Step 6 — Evaluate Failure Behavior

- Verify that authentication and authorization failures return 401 or 403 without exposing internals.
- Check that error responses do not include stack traces, exception messages, or internal paths in production.
- Verify that the system fails to a secure state (deny by default).

Rule references: SEC-006.

### Step 7 — Evaluate Supply Chain Security

- Check whether dependency scanning is configured in the CI/CD pipeline.
- Identify any known vulnerable dependencies using `dotnet list package --vulnerable`.

### Step 8 — Document Findings

- Record each finding with evidence (file path, method, line if possible), applicable rule, and severity.
- Critical and High findings must have specific, reproducible evidence.

---

## Evidence Collection Guide

| Evidence Type | Where to Find |
|---------------|--------------|
| Authentication setup | `Program.cs`, `AddAuthentication`, `AddJwtBearer` |
| Authorization policies | `AddAuthorization`, `[Authorize]` attributes, endpoint policies |
| Input validation | Request DTOs, FluentValidation validators, model binders |
| Secrets in code | Search for connection strings, `password`, `apikey`, `secret` in source |
| TLS configuration | HTTPS middleware, HSTS, Kestrel configuration |
| Error responses | Exception handlers, `ProblemDetails` implementation |
| Dependency vulnerabilities | `dotnet list package --vulnerable` |

---

## Common Findings

- Missing `[Authorize]` on sensitive endpoints relying on convention.
- Horizontal authorization not enforced — user ID taken from request body instead of token claims.
- Connection strings in `appsettings.json` committed to the repository.
- Stack traces returned in production error responses.
- Input from query strings or request bodies used in queries without validation.
- Sensitive data included in log statements.

---

## Red Flags

- Any endpoint accepting user input that is used in a database query without parameterization.
- Admin endpoints accessible without an explicit authorization policy.
- Secrets committed to source control in any form.
- Authentication bypassed in test or staging environments by default.
- No HTTPS enforcement in production configuration.

---

## Output

Upon completion, the reviewer produces:

1. A completed `reviews/08-security-review.md`.
2. An Executive Summary describing the security posture.
3. Prioritized recommendations — Critical and High findings must be addressed first.

---

## Quality Checklist

- ☐ Every endpoint's authorization is verified — no assumptions.
- ☐ Secrets in source code are explicitly searched.
- ☐ Input validation is verified at all external entry points.
- ☐ Failure behavior is explicitly tested.
- ☐ Every finding references a SEC rule.
- ☐ Critical findings have reproducible evidence.
- ☐ Executive Summary is complete.

---

## Related Documents

- reviews/08-security-review.md
- scorecards/08-security-scorecard.md
- docs/10-security.md
- docs/00-rule-catalog.md

---

## Future Enhancements

Future versions of this playbook may include:

- OWASP Top 10 mapping to review steps.
- SAST tool configuration guidance.
- Threat modeling process integration.
- Penetration testing scope definition guidance.
