# Principal .NET Architect Skill

An Engineering Assessment Framework (EAF) that installs a Principal .NET Architect role into your AI coding assistant. The assistant evaluates architecture, performance, security, and operational readiness — it does not generate or rewrite application code.

---

## What it does

Once installed in a project, your AI assistant operates as a Principal .NET Architect. It:

- Reviews code and identifies findings with severity, evidence, and business impact
- Produces engineering scorecards by capability domain (Architecture, Security, Performance, etc.)
- Issues formal production readiness decisions: GO, GO WITH CONDITIONS, or NO GO
- Answers architectural questions with trade-offs, not dogma

All findings reference permanent rule identifiers from the EAF Rule Catalog (e.g., `ARCH-003`, `PERF-004`, `SEC-007`). Rules are never invented.

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

After installing, open the project in your AI assistant and ask:

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

The assistant selects the appropriate operating mode based on your request.

---

## Operating modes

| Mode | Triggered by | Output |
|------|-------------|--------|
| Review | "review this", "assess", "what's wrong with" | Structured findings with severity and evidence |
| Scorecard | "scorecard", "grade this", "how healthy is" | Capability grades A–F with executive summary |
| Assessment | "is this ready", "should we deploy", "assess the risk" | Formal GO / GO WITH CONDITIONS / NO GO decision |
| Advisory | "explain", "which is better", "trade-offs between" | Context-aware architectural guidance |

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
