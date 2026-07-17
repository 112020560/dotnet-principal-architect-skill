# Performance Compliance Review

> Evaluate performance, scalability, and resource efficiency against the Principal .NET Architect Engineering Standard.

---

# Purpose

This review evaluates the performance characteristics of a software solution and its compliance with the Engineering Standard.

Its objectives are to:

- Verify compliance with performance engineering rules.
- Identify bottlenecks.
- Detect scalability risks.
- Evaluate resource utilization.
- Capture engineering decisions and trade-offs.
- Recommend measurable improvements.

This review verifies compliance.

It does not redefine engineering rules.

All referenced rules are defined in:

> docs/00-rule-catalog.md

---

# Review Scope

This review evaluates:

- Async Programming
- Thread Usage
- Memory Management
- HTTP Performance
- EF Core Performance
- LINQ
- Serialization
- Parallelism
- Resource Management
- Performance Observability

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
| Framework | |
| Runtime | |
| Review Scope | |

---

# Executive Summary

Summarize the overall performance characteristics of the solution.

Include:

- Primary strengths.
- Performance bottlenecks.
- Scalability concerns.
- Optimization priorities.

---

# Compliance Legend

| Compliance | Meaning |
|------------|---------|
| ✅ Compliant | Fully complies with the Engineering Standard. |
| ⚠️ Partially Compliant | Mostly compliant but improvements are recommended. |
| ❌ Non-Compliant | Violates the Engineering Standard. |
| ➖ Not Applicable | Rule does not apply to the reviewed solution. |

---

# Performance Compliance Review

| Compliance | Rule | Evidence | Notes |
|------------|------|----------|-------|
| | PERF-001 | | |
| | PERF-002 | | |
| | PERF-003 | | |
| | PERF-004 | | |
| | PERF-005 | | |
| | PERF-006 | | |
| | PERF-007 | | |
| | PERF-008 | | |
| | PERF-009 | | |
| | PERF-010 | | |

---

# Engineering Review Questions

These questions capture engineering judgment.

They complement the compliance review by documenting the reasoning behind engineering decisions.

Engineering is about making informed trade-offs rather than blindly applying rules.

When a recommendation is intentionally not followed, the reviewer should document the technical rationale.

Answers do not affect the Compliance Score.

---

## Answer Legend

| Value | Meaning |
|--------|---------|
| Yes | The practice is implemented. |
| No | The practice is not implemented. |
| Partial | The practice is partially implemented. |
| Unknown | The reviewer could not determine the answer. |
| N/A | The question does not apply. |

---

## Async Programming

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Is async implemented end-to-end? | | | |
| Is Task.Run avoided for I/O operations? | | | |
| Is Sync-over-Async avoided? | | | |
| Are async calls awaited correctly? | | | |
| Are fire-and-forget operations justified? | | | |
| Are CancellationTokens propagated through the call chain? | | | |
| Is ConfigureAwait(false) used appropriately in reusable libraries? | | | |

---

## HTTP Performance

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Is IHttpClientFactory used correctly? | | | |
| Are Typed Clients preferred? | | | |
| Is ResponseHeadersRead used for large payloads? | | | |
| Are retries justified? | | | |
| Are timeouts explicitly configured? | | | |
| Is connection pooling functioning correctly? | | | |
| Is HTTP compression enabled where appropriate? | | | |

---

## EF Core Performance

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Are read-only queries using AsNoTracking()? | | | |
| Are projections preferred over loading entities? | | | |
| Are unnecessary Include() statements avoided? | | | |
| Are Split Queries used where appropriate? | | | |
| Are N+1 queries prevented? | | | |
| Are compiled queries justified? | | | |
| Are database round trips minimized? | | | |
| Are bulk operations optimized? | | | |

---

## LINQ Performance

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Is IEnumerable materialized only when necessary? | | | |
| Are unnecessary ToList() calls avoided? | | | |
| Are projections preferred? | | | |
| Is Any() preferred over Count() when applicable? | | | |
| Are expensive LINQ chains avoided? | | | |
| Are large collections paginated? | | | |

---

## Memory Management

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Are allocations minimized? | | | |
| Are unnecessary object creations avoided? | | | |
| Are large strings minimized? | | | |
| Are buffers reused where appropriate? | | | |
| Are immutable objects preferred? | | | |
| Are disposable resources released correctly? | | | |

---

## Serialization

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Are DTOs optimized? | | | |
| Are unnecessary properties excluded? | | | |
| Is serialization efficient? | | | |
| Is streaming preferred for large payloads? | | | |
| Is compression used when appropriate? | | | |

---

## Parallelism

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Is parallelism justified? | | | |
| Is Task.WhenAll used correctly? | | | |
| Is Parallel.ForEach avoided for async operations? | | | |
| Is thread pool starvation prevented? | | | |
| Is concurrency controlled appropriately? | | | |

---

## Performance Observability

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Are slow operations measurable? | | | |
| Are distributed traces available? | | | |
| Are performance metrics collected? | | | |
| Are hot paths observable? | | | |
| Are performance regressions monitored? | | | |

---

# Performance Metrics

Complete this section whenever measurements are available.

| Metric | Current | Target | Notes |
|--------|--------:|-------:|------|
| Average Response Time | | | |
| P95 Latency | | | |
| P99 Latency | | | |
| Requests per Second | | | |
| CPU Usage | | | |
| Memory Usage | | | |
| Allocation Rate | | | |
| GC Collections | | | |
| Database Round Trips | | | |
| HTTP Calls per Request | | | |

---

# Performance Smells

Identify performance anti-patterns observed during the review.

| Detected | Anti-Pattern | Impact | Evidence | Recommendation |
|----------|--------------|--------|----------|----------------|
| ☐ | ANTI-004 | | | |
| ☐ | ANTI-005 | | | |
| ☐ | ANTI-008 | | | |
| ☐ | ANTI-009 | | | |
| ☐ | ANTI-012 | | | |

---

# Positive Findings

Document engineering decisions that improve performance.

Examples:

- Excellent async implementation.
- Efficient EF Core queries.
- Proper HttpClientFactory usage.
- Minimal allocations.
- Good batching strategy.
- Streaming implementation.
- Efficient caching.
- Excellent observability.

---

# Risks

| Risk | Business Impact | Recommendation |
|------|-----------------|----------------|
| | | |
| | | |
| | | |

---

# Top Recommendations

Prioritize recommendations according to engineering value.

| Priority | Recommendation | Expected Benefit |
|----------|----------------|------------------|
| 1 | | |
| 2 | | |
| 3 | | |

---

# Performance Compliance Score

| Area | Compliance |
|------|-----------:|
| Async Programming | |
| HTTP | |
| EF Core | |
| LINQ | |
| Memory | |
| Serialization | |
| Parallelism | |
| Observability | |

---

## Overall Compliance

```
Overall Performance Compliance

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

# Related Engineering Rules

## Performance

- PERF-001 → PERF-010

## Anti-Patterns

- ANTI-004
- ANTI-005
- ANTI-008
- ANTI-009
- ANTI-012

---

# Related Documentation

- docs/00-rule-catalog.md
- docs/05-performance.md
- docs/06-http.md
- docs/08-observability.md
- docs/13-anti-patterns.md
- docs/14-code-review-style.md

---

# Final Assessment

Provide a concise conclusion covering:

- Overall performance quality.
- Scalability.
- Resource efficiency.
- Async implementation.
- Memory management.
- Network efficiency.
- Highest-value optimization opportunities.

The objective is to build software that is performant by design, measurable in production, and scalable under real workloads.