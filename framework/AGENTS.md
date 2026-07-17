# AGENTS.md

# AI Contributor Guide

This document defines how AI assistants should contribute to the Engineering Assessment Framework (EAF).

The goal is to ensure that every contribution is consistent, predictable, and aligned with the architecture and philosophy of the framework.

---

# Before You Start

Always read the following documents before making any contribution:

1. `PROJECT.md`
2. `ENGINEERING-ASSESSMENT-FRAMEWORK.md`
3. `ENGINEERING-GUIDELINES.md`
4. `AUTHORING-STANDARDS.md`
5. `TASKS.md`

These documents define the project's vision, architecture, writing standards, engineering principles, and current implementation status.

---

# Core Responsibilities

AI contributors are expected to:

- Preserve the architecture of the framework.
- Maintain consistent terminology.
- Respect the responsibility of every artifact.
- Produce publication-ready documentation.
- Build incrementally on existing work.
- Keep the framework vendor neutral.
- Keep the framework technology agnostic.
- Avoid duplication across artifacts.

---

# Artifact Responsibilities

Each artifact has a single responsibility.

## Reviews

Produce engineering evidence.

Answer:

> What did we find?

---

## Scorecards

Summarize engineering capabilities.

Answer:

> How healthy is this engineering domain?

---

## Assessments

Transform engineering evidence into executive decisions.

Answer:

> What decision should be made?

---

## Certifications

Formally recognize that predefined engineering criteria have been satisfied.

Answer:

> Has the organization approved this outcome?

---

## Playbooks

Provide repeatable implementation guidance.

Answer:

> How should this process be executed?

---

# General Rules

Always:

- Preserve existing document structures.
- Follow repository naming conventions.
- Reuse existing terminology.
- Maintain writing consistency.
- Keep documents concise and professional.
- Write for engineering audiences.

Never:

- Invent new framework concepts.
- Rename established sections.
- Merge responsibilities between artifacts.
- Duplicate information already documented elsewhere.
- Introduce vendor-specific recommendations unless explicitly requested.

---

# Autonomous Workflow

The Engineering Assessment Framework is designed to be developed incrementally.

AI contributors should work autonomously by following the workflow below rather than waiting for confirmation after every completed document.

## Execution Workflow

For every task:

1. Read `PROJECT.md` to understand the purpose of the framework.
2. Read `TASKS.md` and identify the **Current Task**.
3. Review the required dependencies listed for the task.
4. Analyze existing framework artifacts before creating new ones.
5. Produce the requested artifact.
6. Validate the artifact against the framework standards.
7. Update `TASKS.md` by marking the completed task.
8. Move the next pending task into **Current Task**.
9. Continue working until the current milestone is completed.

---

# Dependency Rules

The framework follows a strict dependency chain.

```
Software System
        ↓
Engineering Reviews
        ↓
Engineering Scorecards
        ↓
Executive Assessments
        ↓
Engineering Certifications
        ↓
Engineering Governance
```

Every artifact consumes information produced by the previous stage.

For example:

- Reviews produce engineering findings.
- Scorecards summarize Review evidence.
- Assessments consume Scorecards to support executive decisions.
- Certifications formalize completed Assessments.

Never generate conclusions without supporting evidence from previous artifacts.

---

# Validation Checklist

Before marking any task as complete, verify that:

- The document follows the standard structure.
- Responsibilities are respected.
- Existing terminology is preserved.
- No information is duplicated.
- Dependencies have been correctly consumed.
- The document is internally consistent.
- The document is publication-ready.

---

# Stop Conditions

Only stop working when:

- Required information is missing.
- A framework-level architectural decision is required.
- Human input is explicitly necessary.
- The current milestone has been completed.

Otherwise, continue executing the next task automatically.

---

# Definition of Success

A successful contribution:

- Strengthens the Engineering Assessment Framework.
- Preserves consistency across the repository.
- Respects the responsibility of every artifact.
- Builds upon existing work instead of replacing it.
- Produces documentation that is immediately publishable.

The objective is not to generate isolated Markdown documents.

The objective is to incrementally build a complete, coherent, and maintainable Engineering Assessment Framework that can be used by engineering teams and executive leadership to evaluate software systems consistently.