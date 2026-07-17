
# Performance Rules

> *Performance is a property of the entire system, not of isolated lines of code.*

---

# Purpose

This document defines the engineering rules for reviewing and improving performance in modern .NET applications.

The objective is to maximize measurable business value while avoiding premature optimization.

Performance recommendations must always follow the philosophy and review process defined in this knowledge base.

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

---

# Rule PERF-002 — Optimize the Largest Bottleneck First

Prioritize improvements in this order:

1. Database
2. Network
3. Disk I/O
4. Serialization
5. Concurrency
6. Memory
7. CPU
8. Micro-optimizations

---

# Rule PERF-003 — Async All the Way

Avoid blocking asynchronous flows.

Avoid:

- .Result
- .Wait()
- Task.Run() around I/O

Prefer true async APIs.

---

# Rule PERF-004 — Task.Run Is Not an Async Strategy

Task.Run is appropriate for CPU-bound work.

Do not wrap asynchronous I/O simply to "make it async".

---

# Rule PERF-005 — Propagate CancellationToken

Every async boundary should propagate CancellationToken whenever practical.

This reduces wasted work and improves resource utilization.

---

# Rule PERF-006 — Allocation Must Be Intentional

Reduce unnecessary allocations by:

- Reusing objects where appropriate
- Avoiding repeated string concatenation
- Streaming large payloads
- Preferring projections

Only optimize allocations after measurement.

---

# Rule PERF-007 — ValueTask Is a Specialized Optimization

Use ValueTask only when:

- The operation frequently completes synchronously.
- Profiling shows allocation pressure.

Otherwise, prefer Task.

---

# Rule PERF-008 — Avoid Excessive LINQ Chains

LINQ improves readability.

Review long query chains only when profiling identifies them as significant.

Never sacrifice maintainability for hypothetical gains.

---

# Rule PERF-009 — Minimize Serialization Costs

Review:

- Payload size
- Nested graphs
- Redundant properties
- Streaming opportunities

Transfer only required data.

---

# Rule PERF-010 — HttpClient Must Reuse Connections

Prefer:

- IHttpClientFactory
- Long-lived HttpClient
- SocketsHttpHandler

Avoid creating HttpClient per request.

---

# Rule PERF-011 — ThreadPool Threads Are Valuable

Avoid blocking ThreadPool threads with:

- Sleep
- Wait
- Long synchronous I/O

Blocking reduces scalability.

---

# Rule PERF-012 — Logging Has a Cost

Prefer structured logging.

Avoid expensive serialization when log level is disabled.

Do not log excessive payloads in production unless justified.

---

# Rule PERF-013 — Optimize Database Access Before C#

Review:

- Round trips
- Indexes
- N+1
- Execution plans
- Projections

Database improvements often produce the largest gains.

---

# Rule PERF-014 — Cache Intentionally

Cache only when:

- Data is expensive to compute.
- Staleness is acceptable.
- Invalidation strategy exists.

Caching without invalidation is a correctness risk.

---

# Rule PERF-015 — Benchmark Significant Changes

Use BenchmarkDotNet for critical performance decisions.

Benchmark representative workloads.

Avoid synthetic conclusions.

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
