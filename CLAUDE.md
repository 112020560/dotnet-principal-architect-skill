# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repository Is

The **Engineering Assessment Framework (EAF)** — a vendor-neutral, technology-agnostic framework for evaluating software systems, measuring engineering maturity, and supporting executive decision-making. It contains no application code.

The current implementation is focused on .NET, but the framework architecture is designed to be technology-agnostic.

**Always read `framework/` documents before doing any work in this repository.**

---

## Authoritative Framework Documents

All framework rules live in `framework/`. Read them in this order before contributing:

| File | Purpose |
|------|---------|
| `framework/PROJECT.md` | Vision, objectives, and repo structure |
| `framework/ENGINEERING-ASSESSMENT-FRAMEWORK.md` | Core architecture and layer definitions |
| `framework/ENGINEERING-GUIDELINES.md` | Mandatory engineering and writing conventions |
| `framework/AUTHORING-STANDARDS.md` | Writing style, terminology, Markdown standards |
| `framework/AGENTS.md` | AI contributor workflow |
| `framework/TASKS.md` | **Current implementation status and next task** |

---

## Framework Architecture

The framework follows a strict 4-layer progressive lifecycle. Each layer consumes the previous one — never bypass or duplicate layers:

```
Engineering Reviews      → What did we find?
        ↓
Engineering Scorecards   → How healthy is this engineering domain?
        ↓
Executive Assessments    → What decision should be made?
        ↓
Engineering Certifications → Has the decision been formally approved?
```

Each artifact has **single responsibility**. Do not merge responsibilities between layers.

---

## Repository Structure

```
framework/        Authoritative framework documents (source of truth)
reviews/          Engineering review checklists (16 domains)
scorecards/       Domain scorecard templates (16 domains)
assessments/      Executive assessments — IN PROGRESS
certifications/   Formal certifications — NOT STARTED
playbooks/        Implementation guidance — NOT STARTED
templates/        Reusable templates — NOT STARTED
docs/             .NET-specific engineering standards and rule catalog
```

---

## Current Implementation Status

See `framework/TASKS.md` for the live task board. As of the last update:

| Phase | Status | Progress |
|-------|--------|----------|
| Reviews | Complete | 16 / 16 |
| Scorecards | Complete | 16 / 16 |
| Assessments | In Progress | 0 / 10 |
| Certifications | Not Started | 0 / 5 |
| Playbooks | Not Started | 0 / 16 |
| Templates | Not Started | 0 / 5 |

**Current task:** `assessments/01-production-readiness-assessment.md` (file exists but is empty).

---

## AI Contributor Workflow

Per `framework/AGENTS.md`:

1. Read `framework/PROJECT.md` and `framework/TASKS.md` first.
2. Identify the **Current Task** in `TASKS.md`.
3. Verify its dependencies are complete.
4. Analyze existing artifacts in the relevant layer before creating new ones.
5. Produce the artifact. Validate against framework standards.
6. Mark the task complete in `TASKS.md` and move the next item to **Current Task**.
7. Continue to the next task without waiting for confirmation unless information is missing.

Only stop when: required information is missing, a framework-level architectural decision is needed, or the current milestone is complete.

---

## Key Conventions

**Naming:** `NN-domain-artifact.md` (e.g., `01-architecture-review.md`, `01-production-readiness-assessment.md`)

**Canonical terminology** — always use these, never synonyms:

| Use | Avoid |
|-----|-------|
| Finding | Issue |
| Recommendation | Suggestion |
| Risk | Problem |
| Evidence | Opinion |
| Engineering Capability | Area |
| Assessment | Evaluation Report |
| Certification | Approval |

**Every document must include:**
- A `Purpose` section
- A `Future Enhancements` section at the end
- Vendor-neutral language (prefer "cloud provider" over "AWS/Azure")
- Evidence-based conclusions only — never assumptions

**Assessments** must always end with a formal decision: `GO`, `GO WITH CONDITIONS`, `CONDITIONAL GO`, `NO GO`, or `REASSESS REQUIRED`.

---

## .NET Engineering Standards (docs/)

The `docs/` folder contains the .NET-specific engineering rules that feed into the review checklists. The authoritative rule catalog is `docs/00-rule-catalog.md`. Rule IDs follow the format `<CATEGORY>-<NUMBER>` (e.g., `ARCH-001`, `PERF-007`) and are permanent — never reuse or invent them.
