# Principal .NET Architect Skill

An Engineering Assessment Framework (EAF) that installs a Principal .NET Architect role into your AI coding assistant. The assistant works in two modes: it **reviews** existing architecture, performance, security, and operational readiness, and it **builds** new .NET code that already complies with the same engineering standard.

---

## What it does

Once installed in a project, your AI assistant operates as a Principal .NET Architect, in one of two modes:

**Review Mode** — evaluates code that already exists:

- Reviews code and identifies findings with severity, evidence, and business impact
- Produces engineering scorecards by capability domain (Architecture, Security, Performance, etc.)
- Issues formal production readiness decisions: GO, GO WITH CONDITIONS, or NO GO
- Answers architectural questions with trade-offs, not dogma

**Build Mode** — writes new code so it complies from the start:

- Applies the same EAF rules while implementing endpoints, services, consumers, repositories, etc.
- Self-checks the generated code against the same pattern checklist used in Review Mode (sync-over-async, missing `CancellationToken`, unbounded `HttpClient`, hardcoded secrets, unparameterized queries, and more) before returning it
- Annotates only the non-obvious decisions with a rule ID, instead of producing a full findings report

All findings and build decisions reference permanent rule identifiers from the EAF Rule Catalog (e.g., `ARCH-003`, `PERF-004`, `SEC-007`). Rules are never invented.

---

## Installation

Clone this repository once. Then run the installer against any .NET project:

```bash
git clone https://github.com/your-username/dotnet-principal-architect-skill ~/tools/dotnet-eaf
chmod +x ~/tools/dotnet-eaf/install.sh

# Install into a project
~/tools/dotnet-eaf/install.sh ~/projects/my-dotnet-api
```

The installer:

- Appends the system prompt to `CLAUDE.md` in the target project (Claude Code picks this up automatically)
- Copies the Cursor rule to `.cursor/rules/principal-architect.mdc` in the target project

Safe to run multiple times — idempotent.

---

## Platform support

| Platform | How it activates |
|----------|-----------------|
| Claude Code | Via `CLAUDE.md` in the project root |
| Cursor | Via `.cursor/rules/principal-architect.mdc` — auto-attaches to `.cs`, `.csproj`, `.sln`, `appsettings*.json` |

---

## How to use it

The assistant selects the operating mode from what you ask — you don't need to name it explicitly. Say what you want as you normally would; the trigger words below are just what the assistant is listening for.

### Reviewing existing code

Use these when you want the assistant to **evaluate** code that already exists — a Sonar-style pass, but with business impact and trade-offs attached.

```
Review this service for production readiness.
```

```
Give me a scorecard for the persistence layer.
```

```
Is this ready to deploy?
```

```
What are the trade-offs between EF Core and Dapper for this use case?
```

Expect a structured output: severity, rule ID, evidence, business impact, recommendation, trade-offs (see [Operating modes](#operating-modes) below for the exact format per mode).

### Building new code

Use these when you want the assistant to **write** new code — an endpoint, a consumer, a repository — already compliant with the EAF standard, instead of writing it first and reviewing it later.

```
Implement an endpoint that returns an order by id, following our architecture standards.
```

```
Create a repository for the Invoice aggregate using Dapper.
```

```
Add a message consumer for OrderPlaced that publishes to the outbox.
```

Expect working code as the primary output. The assistant applies the same rule catalog used in Review Mode (`CancellationToken` propagation, `IHttpClientFactory`, structured logging, parameterized queries, etc.) while writing it, and only adds a short rule annotation when a decision isn't obvious from the code itself — it does not return a findings report for code it just wrote.

If you want an existing piece of code both built on and then audited, ask for the review separately once the code exists — the two modes are deliberately not merged into one output.

---

## Operating modes

| Mode | Triggered by | Output |
|------|-------------|--------|
| Review | "review this", "assess", "what's wrong with" | Structured findings with severity and evidence |
| Scorecard | "scorecard", "grade this", "how healthy is" | Capability grades A–F with executive summary |
| Assessment | "is this ready", "should we deploy", "assess the risk" | Formal GO / GO WITH CONDITIONS / NO GO decision |
| Advisory | "explain", "which is better", "trade-offs between" | Context-aware architectural guidance |
| Build | "implement", "create", "write", "add", "generate" | Working code, compliant by construction, with rule IDs noted only where non-obvious |

---

## What it evaluates

The framework applies rules across 11 capability domains:

| Domain | Examples |
|--------|---------|
| Architecture | Dependency direction, layering violations, business logic in wrong layer |
| Database | N+1 queries, missing indexes, unbounded result sets, transaction scope |
| Performance | Sync-over-async, `Task.Run` wrapping I/O, missing `CancellationToken` |
| HTTP Clients | `new HttpClient()`, missing timeouts, no retry or circuit breaker |
| ASP.NET Core | Service lifetime mismatches, missing exception handler, Options Pattern |
| Observability | String interpolation in logs, missing correlation IDs, PII in logs |
| Messaging | Non-idempotent consumers, missing Outbox Pattern, business logic in consumers |
| Security | Secrets in config, missing `[Authorize]`, unparameterized queries |
| Cloud | Missing health checks, hardcoded infrastructure, no graceful shutdown |
| Testing | Missing coverage on critical paths, test coupling to implementation |
| Anti-patterns | `.Result`/`.Wait()`, Ambient Context, God Class, Temporal Coupling |

---

## Framework structure

```
prompts/        System prompts for each platform
docs/           EAF rule catalog and domain reference
reviews/        16 domain-specific review templates (pre-filled examples)
scorecards/     16 scorecard templates
assessments/    10 assessment templates (production, security, scalability, etc.)
certifications/ 5 formal certification documents
playbooks/      16 step-by-step review execution guides
templates/      Blank starters for each document type
framework/      Authoritative framework specification and task board
```

---

## Technology scope

Designed for:

- .NET 8 / 9 / 10 and ASP.NET Core
- Hexagonal Architecture and DDD
- EF Core, Dapper, PostgreSQL, SQL Server
- MassTransit, RabbitMQ, Azure Service Bus
- Docker, Kubernetes
- CQRS and Event-Driven Architecture

---

## Design principles

- **Evidence over opinion.** Every finding cites observable code, not assumptions.
- **No dogma.** EF Core, CQRS, microservices, and Repository Pattern are context-dependent — never universally recommended.
- **Simplicity wins.** Complexity must be justified by a measurable problem.
- **Smallest safe improvement.** Incremental changes over rewrites.
- **Understand before judging.** Business context determines the right decision.
- **Compliant by construction.** In Build Mode, the same rule catalog is applied while writing code, not just while reviewing it — the goal is fewer findings later, not a bigger report now.
