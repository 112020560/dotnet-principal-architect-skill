# Performance Review Playbook

> Step-by-step guidance for executing a Performance Compliance Review.

---

## Purpose

This playbook provides repeatable execution guidance for conducting a Performance Compliance Review using the Engineering Assessment Framework.

It answers: How should this review be executed?

---

## Audience

- Software Architects
- Principal Engineers
- Technical Leads
- Performance Engineers

---

## Prerequisites

- Access to the source repository.
- Access to production or load test telemetry if available.
- Familiarity with `reviews/03-performance-review.md`.
- Familiarity with PERF rules in `docs/00-rule-catalog.md`.

---

## When to Execute

- When performance degradation is reported or suspected.
- Before high-traffic events or scaling milestones.
- As part of a production readiness process.
- When onboarding a new system for assessment.

---

## Estimated Duration

| System Size | Estimated Duration |
|-------------|-------------------|
| Small | 2–3 hours |
| Medium | 4–8 hours |
| Large | 1–2 days |

---

## Preparation

1. Read `docs/05-performance.md`.
2. Read `docs/00-rule-catalog.md` — PERF section.
3. Open `reviews/03-performance-review.md` as the working document.
4. Request any available telemetry: response times, error rates, CPU and memory profiles.
5. Identify the highest-traffic or most latency-sensitive code paths.

---

## Execution Steps

### Step 1 — Identify Performance-Critical Paths

- Identify the endpoints or operations handling the highest volume or with the strictest latency requirements.
- Focus the review on these paths first.
- Do not attempt to review every code path equally.

Rule references: PERF-001.

### Step 2 — Evaluate Asynchronous I/O

- Search for synchronous I/O calls in async contexts: `.Result`, `.Wait()`, `GetAwaiter().GetResult()`.
- Verify that all database, HTTP, and file I/O operations use `async`/`await`.
- Search for `Task.Run` wrapping synchronous I/O.

Rule references: PERF-002, PERF-003, PERF-004, ANTI-004, ANTI-005.

### Step 3 — Evaluate CancellationToken Propagation

- Verify that `CancellationToken` is accepted and propagated through the call chain.
- Check that database calls, HTTP client calls, and long-running operations pass `CancellationToken`.

Rule references: PERF-005.

### Step 4 — Evaluate Allocations

- Identify unnecessary object creation in hot paths: LINQ on every request, string concatenation in loops.
- Look for large collection allocations where streaming would be appropriate.
- Check for `IEnumerable` being materialized multiple times.

Rule references: PERF-006, PERF-007.

### Step 5 — Evaluate Batching and Streaming

- Identify operations that process large datasets item-by-item where batching would reduce round-trips.
- Check that large response payloads use streaming (`IAsyncEnumerable`, chunked responses) where appropriate.

Rule references: PERF-008, PERF-009.

### Step 6 — Evaluate Measurement Evidence

- Verify that performance claims are supported by benchmarks, profiling data, or production telemetry.
- Identify cases where optimization was performed without measurement evidence.

Rule references: PERF-001, PERF-010, ANTI-012.

### Step 7 — Document Findings

- Record each finding with evidence: file path, method name, and description of the issue.
- Assign severity based on business impact and traffic volume.

---

## Evidence Collection Guide

| Evidence Type | Where to Find |
|---------------|--------------|
| Sync-over-Async patterns | Search for `.Result`, `.Wait()`, `GetAwaiter().GetResult()` |
| Task.Run around I/O | Search for `Task.Run` |
| Missing CancellationToken | Method signatures in Handlers, Services, Repositories |
| Allocation hotspots | LINQ chains in request handlers |
| Large payloads | API responses, database queries returning full entities |
| Benchmarks | `BenchmarkDotNet` project if present |

---

## Common Findings

- Synchronous database calls in async methods.
- `.Result` or `.Wait()` causing thread pool starvation.
- `Task.Run` wrapping EF Core or HttpClient operations.
- CancellationToken accepted but not forwarded to downstream calls.
- Large collections materialized fully when streaming would suffice.
- LINQ queries re-enumerated multiple times.

---

## Red Flags

- `.Result` or `.Wait()` on async operations in request-handling code.
- `Task.Run(() => dbContext.SaveChanges())` or equivalent.
- No `CancellationToken` in any method signature across the entire codebase.
- Loading entire tables into memory for filtering in application code.

---

## Output

Upon completion, the reviewer produces:

1. A completed `reviews/03-performance-review.md`.
2. An Executive Summary describing overall performance posture.
3. Prioritized recommendations with specific code locations.

---

## Quality Checklist

- ☐ All checklist items have a status.
- ☐ Sync-over-Async patterns are explicitly searched and evidenced.
- ☐ Every finding references a PERF or ANTI rule.
- ☐ Severity reflects traffic volume and business impact.
- ☐ Positive findings are documented.
- ☐ Executive Summary is complete.

---

## Related Documents

- reviews/03-performance-review.md
- scorecards/03-performance-scorecard.md
- docs/05-performance.md
- docs/00-rule-catalog.md
- docs/13-anti-patterns.md

---

## Future Enhancements

Future versions of this playbook may include:

- dotnet-trace and dotnet-counters usage guidance.
- BenchmarkDotNet setup template.
- Memory profiling walkthrough.
- Load test scenario design guidance.
