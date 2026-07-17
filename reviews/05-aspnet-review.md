# ASP.NET Core Compliance Review

> Evaluate framework usage, application composition, and hosting practices against the Principal .NET Architect Engineering Standard.

---

# Purpose

This review evaluates how effectively a software solution leverages ASP.NET Core.

Its objectives are to:

- Verify compliance with the Engineering Standard.
- Evaluate application composition.
- Assess Dependency Injection usage.
- Review middleware configuration.
- Validate hosting and configuration practices.
- Evaluate framework extensibility.
- Capture engineering decisions and trade-offs.

This review verifies compliance.

It does not redefine engineering rules.

All referenced rules are defined in:

> docs/00-rule-catalog.md

---

# Review Scope

This review evaluates:

- Hosting
- Middleware Pipeline
- Dependency Injection
- Configuration
- Controllers
- Minimal APIs
- Filters
- Endpoint Filters
- Background Services
- Problem Details
- Health Checks
- Options Pattern
- Dependency Lifetimes
- Native AOT Readiness
- Trimming Readiness

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
| ASP.NET Core Version | |
| Hosting Model | |
| Review Scope | |

---

# Executive Summary

Summarize the overall quality of the ASP.NET Core implementation.

Include:

- Main strengths.
- Main weaknesses.
- Framework misuse.
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

# ASP.NET Core Compliance Review

| Compliance | Rule | Evidence | Notes |
|------------|------|----------|-------|
| | API-001 | | |
| | API-002 | | |
| | API-003 | | |
| | API-004 | | |
| | API-005 | | |
| | API-006 | | |
| | API-007 | | |

---

# Engineering Review Questions

These questions capture engineering judgment.

They complement the compliance review by documenting the reasoning behind engineering decisions.

Engineering is about making informed trade-offs rather than blindly applying rules.

Answers do not affect the Compliance Score.

---

## Answer Legend

| Value | Meaning |
|--------|---------|
| Yes | The practice is implemented. |
| No | The practice is not implemented. |
| Partial | Implemented only in some areas. |
| Unknown | The reviewer could not determine the answer. |
| N/A | Not applicable. |

---

# Hosting

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Is the hosting model appropriate for the application? | | | |
| Is graceful shutdown implemented correctly? | | | |
| Is startup time optimized? | | | |
| Is configuration loaded predictably? | | | |

---

# Middleware Pipeline

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Is the middleware order correct? | | | |
| Is exception handling configured first? | | | |
| Is Authentication executed before Authorization? | | | |
| Is HTTPS enforced? | | | |
| Is Rate Limiting configured appropriately? | | | |
| Is Response Compression enabled when appropriate? | | | |
| Is Response Caching configured correctly? | | | |

---

# Dependency Injection

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Are services registered with the correct lifetime? | | | |
| Are Singleton services free of Scoped dependencies? | | | |
| Is Service Locator avoided? | | | |
| Is BuildServiceProvider() avoided? | | | |
| Is constructor injection preferred? | | | |
| Are factories used only when justified? | | | |
| Is dependency registration modularized? | | | |

---

# Configuration

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Is the Options Pattern used? | | | |
| Are Options validated? | | | |
| Is IConfiguration avoided outside the composition root? | | | |
| Are secrets managed securely? | | | |
| Is environment-specific configuration implemented correctly? | | | |

---

# Controllers

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Are controllers thin? | | | |
| Is business logic delegated to the Application layer? | | | |
| Are DTOs used consistently? | | | |
| Is model validation centralized? | | | |

---

# Minimal APIs

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| If Minimal APIs are used, is the decision justified? | | | |
| Are endpoints kept small and focused? | | | |
| Is business logic kept outside endpoints? | | | |
| Are Endpoint Filters used appropriately? | | | |
| Are endpoints documented? | | | |

---

# Filters

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Are Action Filters used appropriately? | | | |
| Are Exception Filters justified? | | | |
| Is cross-cutting behavior centralized? | | | |

---

# Background Services

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Are BackgroundServices asynchronous? | | | |
| Is CancellationToken respected? | | | |
| Are failures handled gracefully? | | | |
| Are retries controlled? | | | |
| Are BackgroundServices observable? | | | |

---

# Health Checks

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Are Health Checks implemented? | | | |
| Are Readiness and Liveness separated? | | | |
| Are external dependencies validated appropriately? | | | |

---

# Problem Details

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Is RFC 9457 implemented? | | | |
| Are validation errors standardized? | | | |
| Are internal exceptions hidden? | | | |

---

# Native AOT & Trimming

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Is the application Trim-friendly? | | | |
| Is reflection minimized? | | | |
| Are AOT-incompatible libraries avoided? | | | |
| Is dynamic loading minimized? | | | |

---

# Production Evidence

| Evidence | Available | Source | Notes |
|----------|-----------|--------|-------|
| Health Check Results | | | |
| Startup Time | | | |
| Memory Usage | | | |
| Dependency Injection Diagnostics | | | |
| Middleware Metrics | | | |
| Application Logs | | | |
| OpenTelemetry Traces | | | |

---

# ASP.NET Core Smells

| Detected | Anti-Pattern | Impact | Evidence | Recommendation |
|----------|--------------|--------|----------|----------------|
| ☐ | Fat Controllers | | | |
| ☐ | Business Logic in Controllers | | | |
| ☐ | Service Locator | | | |
| ☐ | Singleton depending on Scoped | | | |
| ☐ | Middleware Order Issues | | | |
| ☐ | Configuration scattered across the application | | | |
| ☐ | Long-running BackgroundService without cancellation | | | |

---

# Positive Findings

Document engineering decisions that improve framework usage.

Examples:

- Excellent Dependency Injection design.
- Well-structured middleware pipeline.
- Thin Controllers.
- Proper use of Minimal APIs.
- Strong configuration management.
- Robust health checks.
- Clean application composition.

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

# ASP.NET Core Compliance Score

| Area | Compliance |
|------|-----------:|
| Hosting | |
| Middleware | |
| Dependency Injection | |
| Configuration | |
| Controllers / Endpoints | |
| Background Services | |
| Health Checks | |
| Problem Details | |

---

## Overall Compliance

```
Overall ASP.NET Core Compliance

__________ %
```

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

---

## Overall Confidence

☐ High

☐ Medium

☐ Low

---

# Related Engineering Rules

## ASP.NET Core

- API-001 → API-007

---

# Related Documentation

- docs/00-rule-catalog.md
- docs/07-aspnet-core.md
- docs/08-observability.md
- docs/10-security.md
- docs/13-anti-patterns.md
- docs/14-code-review-style.md

---

# Final Assessment

Provide a concise conclusion covering:

- Framework usage quality.
- Application composition.
- Operational readiness.
- Maintainability.
- Extensibility.
- Highest-value improvements.

The objective is to ensure ASP.NET Core is used intentionally, consistently, and in alignment with the Engineering Standard.