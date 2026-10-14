
# Performance Rules

> *Performance is a property of the entire system, not of isolated lines of code.*

---

# Purpose

This document defines the engineering rules for reviewing and improving performance in modern .NET applications.

The objective is to maximize measurable business value while avoiding premature optimization.

Performance recommendations must always follow the philosophy and review process defined in this knowledge base.

Rule IDs and descriptions in this document must always match `docs/00-rule-catalog.md` exactly — if a number here does not match the catalog, the catalog wins and this file has drifted.

---

# Performance Principles

- Measure before optimizing.
- Optimize systems before code.
- Correctness always comes first.
- Readability has value.
- Every optimization has a cost.
- Benchmark assumptions.
- Production telemetry outweighs intuition.

---

# Rule PERF-001 — Measure Before Optimizing

**Severity:** Critical

Never optimize based on intuition.

Preferred evidence:

- BenchmarkDotNet
- OpenTelemetry
- dotnet-counters
- dotnet-trace
- Production metrics
- SQL execution plans

Related Rules: ANTI-012 (Premature Optimization).

---

# Rule PERF-002 — Prefer Asynchronous I/O

True asynchronous APIs free the calling thread instead of blocking it while waiting on I/O (database, HTTP, disk, messaging).

Prefer `async`/`await` end-to-end over any blocking equivalent. This is the default for I/O-bound work; see PERF-003 and PERF-004 for the two ways this default is most commonly violated.

---

# Rule PERF-003 — Never Wrap Asynchronous I/O With Task.Run

`Task.Run` is appropriate for genuinely CPU-bound work. It is not an async strategy for I/O.

## Symptoms

Wrapping naturally asynchronous I/O (an EF Core call, an HTTP request, a file read) inside `Task.Run` just to "make it async."

## Consequences

- Wasted ThreadPool threads
- No real scalability improvement — the I/O still blocks a thread, just a different one

## Recommended Fix

Use the true asynchronous API the library already exposes instead of wrapping a synchronous one.

Related Rules: ANTI-005 (Task.Run Around I/O).

---

# Rule PERF-004 — Avoid Sync-over-Async

## Symptoms

- `.Result`
- `.Wait()`
- `.GetAwaiter().GetResult()`

## Consequences

- Thread starvation
- Deadlocks (particularly under a synchronization context)
- Reduced scalability

## Recommended Fix

Propagate `async`/`await` end-to-end instead of blocking on a Task partway through the call chain.

Related Rules: ANTI-004 (Sync over Async).

---

# Rule PERF-005 — Propagate CancellationToken

Every async boundary should propagate `CancellationToken` whenever practical.

This reduces wasted work and improves resource utilization when a caller disconnects or a request times out.

---

# Rule PERF-006 — Minimize Allocations

Reduce unnecessary allocations by:

- Reusing objects where appropriate
- Avoiding repeated string concatenation
- Streaming large payloads
- Preferring projections

Only optimize allocations after measurement.

---

# Rule PERF-007 — Avoid Unnecessary Object Creation

Avoid allocating objects that the business logic doesn't need:

- Boxing value types in hot paths
- Allocating a new collection where an existing one (or a span/slice) would do
- Constructing DTOs or wrapper objects per iteration inside a loop when one reusable instance would do

`ValueTask` is a specialized tool for this — use it only when an operation frequently completes synchronously and profiling shows allocation pressure from `Task`. Otherwise prefer `Task`; `ValueTask` has sharp edges (it must not be awaited twice).

---

# Rule PERF-008 — Batch Operations When Appropriate

Prefer one batched call over many small ones when the workload allows it: bulk database writes instead of row-by-row loops, a single HTTP call with multiple items instead of one call per item, chunked processing for large datasets.

Review long LINQ chains only when profiling identifies them as a measurable cost — do not sacrifice readability for a hypothetical gain.

Related Rules: ANTI-008 (N+1 Queries), ANTI-009 (Chatty APIs).

---

# Rule PERF-009 — Prefer Streaming for Large Payloads

Review payload size, nested graphs, redundant properties, and streaming opportunities before transferring data. Transfer only what is required.

For large HTTP responses, prefer `HttpCompletionOption.ResponseHeadersRead` over buffering the entire response.

Related Rules: HTTP-010.

---

# Rule PERF-010 — Measure With BenchmarkDotNet When Required

Use BenchmarkDotNet for performance-critical decisions. Benchmark representative workloads and avoid synthetic conclusions that don't reflect production traffic shape.

---

# Additional Engineering Guidance

The following guidance is established practice but is not a numbered rule in `docs/00-rule-catalog.md` — do not cite it with a rule ID.

## Optimize the Largest Bottleneck First

Prioritize improvements in this order: database, network, disk I/O, serialization, concurrency, memory, CPU, micro-optimizations. Most measurable gains come from the top of this list.

## HttpClient Must Reuse Connections

Prefer `IHttpClientFactory`, a long-lived `HttpClient`, or `SocketsHttpHandler` over creating a client per request. This is the performance angle of HTTP-001, which owns the rule.

## ThreadPool Threads Are Valuable

Avoid blocking ThreadPool threads with `Sleep`, `Wait`, or long synchronous I/O — blocking reduces the pool's capacity to serve other requests.

## Logging Has a Cost

Prefer structured logging and avoid expensive serialization when the log level is disabled. Do not log excessive payloads in production unless justified.

## Optimize Database Access Before C#

Round trips, indexes, N+1 queries, execution plans, and projections usually produce larger gains than micro-optimizing C#. See DB-008.

## Cache Intentionally

Cache only when data is expensive to compute, staleness is acceptable, and an invalidation strategy exists. Caching without invalidation is a correctness risk, not a performance win.

---

# Common Performance Smells

- Blocking async code
- Task.Run around I/O
- N+1 queries
- Excessive allocations
- Multiple HttpClient instances
- Over-fetching
- Missing cancellation
- Large object graphs
- Logging entire payloads
- Premature optimization

---

# Performance Review Checklist

- Was the bottleneck measured?
- Is async implemented correctly?
- Are ThreadPool threads blocked?
- Is CancellationToken propagated?
- Are allocations justified?
- Is HttpClient reused?
- Is database access efficient?
- Are payloads minimized?
- Are logs appropriately structured?
- Are benchmarks available?

---

# References

- Microsoft .NET Performance Documentation
- ASP.NET Core Performance Best Practices
- BenchmarkDotNet Documentation
- Stephen Toub Performance Blogs
- .NET Runtime Team Documentation
