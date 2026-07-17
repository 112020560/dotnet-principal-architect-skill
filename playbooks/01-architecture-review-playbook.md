# Architecture Review Playbook

> Step-by-step guidance for executing an Architecture Compliance Review.

---

## Purpose

This playbook provides repeatable execution guidance for conducting an Architecture Compliance Review using the Engineering Assessment Framework.

It answers: How should this review be executed?

---

## Audience

- Software Architects
- Principal Engineers
- Technical Leads

---

## Prerequisites

- Access to the source repository.
- Access to architecture documentation if available.
- Familiarity with the Architecture Compliance Review checklist (`reviews/01-architecture-review.md`).
- Familiarity with the Engineering Rule Catalog (`docs/00-rule-catalog.md`), specifically ARCH rules.

---

## When to Execute

- Before major releases.
- When onboarding a new system for assessment.
- After significant architectural changes.
- As part of a production readiness process.
- On a recurring governance schedule.

---

## Estimated Duration

| System Size | Estimated Duration |
|-------------|-------------------|
| Small | 2–4 hours |
| Medium | 4–8 hours |
| Large | 1–2 days |

---

## Preparation

Before starting the review:

1. Read `docs/03-architecture.md` to refresh architectural standards.
2. Read `docs/00-rule-catalog.md` — ARCH section.
3. Open `reviews/01-architecture-review.md` as the working document.
4. Request or locate: solution structure, project references, startup configuration, dependency injection registration.
5. Identify the declared architecture style (Hexagonal, Clean, Layered, Modular Monolith, Microservices).
6. Clarify the business domain and deployment model.

---

## Execution Steps

### Step 1 — Understand the Architecture

- Identify all projects and their declared responsibilities.
- Map the layer structure: Domain, Application, Infrastructure, Presentation.
- Identify shared libraries, cross-cutting concerns, and external dependencies.
- Note any deviations from the declared architecture style.

### Step 2 — Evaluate Dependency Direction

- Check that all project references point inward toward the Domain.
- Identify any Infrastructure or Presentation projects referenced by the Domain.
- Look for circular references between projects.

Key files: `.csproj` files, solution structure, DI registration.

Rule references: ARCH-008, ARCH-009, ARCH-010.

### Step 3 — Evaluate Domain Isolation

- Verify that the Domain layer contains no infrastructure concerns (EF Core DbContext, HttpClient, file I/O).
- Verify that business rules are not located in Controllers, Middleware, or Background Services.
- Check that Domain Services operate on Domain Models, not DTOs or infrastructure types.

Rule references: ARCH-001, ARCH-002, ARCH-003, ARCH-004.

### Step 4 — Evaluate Application Layer

- Verify that Commands and Queries have single responsibilities.
- Confirm that orchestration logic lives in the Application layer, not the Domain or Infrastructure.
- Check that the Application layer does not depend directly on infrastructure implementations.

Rule references: ARCH-006, ARCH-007.

### Step 5 — Evaluate Infrastructure

- Confirm that Infrastructure implements only interfaces defined in Domain or Application.
- Verify that persistence logic is isolated behind Repositories or Ports.
- Check that no business logic exists in Infrastructure classes.

Rule references: ARCH-010, ARCH-011, ARCH-012.

### Step 6 — Evaluate Modularity and Boundaries

- Identify bounded contexts or modules and verify their independence.
- Check for shared state or direct cross-module dependencies that violate boundaries.
- Identify God Services or oversized classes.

Rule references: ARCH-005, ANTI-002.

### Step 7 — Document Findings

- Record each finding in the review checklist with status, evidence, and applicable rule.
- Assign severity: Critical, High, Medium, Low, Informational.
- Document positive findings.

---

## Evidence Collection Guide

| Evidence Type | Where to Find |
|---------------|--------------|
| Project dependencies | `.csproj` files |
| DI registrations | `Program.cs`, extension methods |
| Domain model | `Domain/` or `Core/` project |
| Infrastructure implementations | `Infrastructure/` project |
| Business logic location | Handlers, Services, Domain entities |
| Architecture style declaration | README, ADRs, documentation |

---

## Common Findings

- Infrastructure types (EF Core entities, DbContext) imported into the Domain.
- Business rules located in Controllers or Middleware.
- Application layer directly instantiating Infrastructure classes.
- God Services with multiple unrelated responsibilities.
- Circular project references.
- Missing abstraction between Application and Infrastructure.

---

## Red Flags

The following patterns indicate Critical or High severity findings:

- Domain project references Infrastructure project.
- Business rules scattered across multiple layers.
- No discernible separation between Domain and Infrastructure.
- Entire application in a single project with no architectural boundaries.

---

## Output

Upon completion, the reviewer produces:

1. A completed `reviews/01-architecture-review.md` with all checklist items evaluated.
2. An Executive Summary describing overall architectural quality.
3. A Findings Summary by severity.
4. Prioritized recommendations.

---

## Quality Checklist

Before closing the review, verify:

- ☐ All checklist items have a status (✅, ⚠️, ❌, N/A).
- ☐ Every ❌ or ⚠️ has observable evidence.
- ☐ Every finding references an applicable ARCH or ANTI rule.
- ☐ Severity is assigned and reflects business impact.
- ☐ Positive findings are documented.
- ☐ Executive Summary is complete.

---

## Related Documents

- reviews/01-architecture-review.md
- scorecards/01-architecture-scorecard.md
- docs/03-architecture.md
- docs/00-rule-catalog.md
- docs/13-anti-patterns.md

---

## Future Enhancements

Future versions of this playbook may include:

- Automated dependency graph analysis tools.
- Architecture fitness function integration.
- Visual architecture mapping templates.
- Remote review execution guidance.
