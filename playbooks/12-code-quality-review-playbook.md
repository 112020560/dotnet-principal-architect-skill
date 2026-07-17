# Code Quality Review Playbook

> Step-by-step guidance for executing a Code Quality Compliance Review.

---

## Purpose

This playbook provides repeatable execution guidance for conducting a Code Quality Compliance Review using the Engineering Assessment Framework.

It answers: How should this review be executed?

---

## Audience

- Software Architects
- Principal Engineers
- Technical Leads

---

## Prerequisites

- Access to the source repository.
- Familiarity with `reviews/12-code-quality-review.md`.
- Familiarity with ANTI rules in `docs/00-rule-catalog.md` related to code quality.

---

## When to Execute

- When onboarding a new system for assessment.
- When defect rates or maintenance costs are elevated.
- As part of a production readiness process.
- On a recurring governance schedule.

---

## Estimated Duration

| System Size | Estimated Duration |
|-------------|-------------------|
| Small | 1–2 hours |
| Medium | 2–4 hours |
| Large | 4–8 hours |

---

## Preparation

1. Read `docs/14-code-review-style.md`.
2. Read `docs/13-anti-patterns.md`.
3. Open `reviews/12-code-quality-review.md` as the working document.
4. Identify the highest-traffic or most business-critical modules to prioritize.
5. If available, locate static analysis reports or IDE warnings.

---

## Execution Steps

### Step 1 — Evaluate Naming and Readability

- Review a representative sample of classes, methods, and variables.
- Verify that names describe intent, not implementation.
- Check for abbreviations, acronyms, or single-letter names outside of loops.
- Verify that boolean names express a condition: `isActive`, `hasPermission`.

### Step 2 — Evaluate Method and Class Size

- Identify methods exceeding 30–40 lines as candidates for review.
- Identify classes with more than 300–400 lines or more than 10 public methods.
- Check for classes with multiple unrelated responsibilities (God Classes).

Rule references: ANTI-002.

### Step 3 — Evaluate Code Duplication

- Identify repeated logic blocks across the codebase.
- Check for copy-pasted validation, mapping, or business rules in multiple locations.
- Verify that shared logic is extracted into appropriate shared components.

### Step 4 — Evaluate Cyclomatic Complexity

- Identify methods with deeply nested conditionals (`if/else` nesting more than 3 levels).
- Check for switch statements handling more than 5–7 cases without polymorphism.
- Verify that complex conditional logic is not repeated across multiple classes.

### Step 5 — Evaluate Abstraction Quality

- Check for leaky abstractions — interfaces that expose implementation details.
- Identify premature abstractions — abstractions with only one implementation and no expected growth.
- Verify that interfaces define behavior, not just wrap classes.

Rule references: ANTI-013.

### Step 6 — Evaluate Dead Code and Technical Debt

- Identify commented-out code blocks that have not been removed.
- Check for `TODO` and `FIXME` comments in critical paths.
- Identify unused classes, methods, or parameters.

### Step 7 — Evaluate Consistency

- Verify that coding patterns are consistent across the codebase.
- Check for inconsistent naming conventions, file organization, or structural patterns.
- Identify areas where different team members have applied different conventions for the same problem.

### Step 8 — Evaluate DTO Design

- Check for DTO explosion — excessive number of DTOs for the same concept.
- Verify that DTOs are purpose-designed, not reused across unrelated contexts.
- Check for domain models returned directly from API endpoints.

Rule references: ANTI-014.

### Step 9 — Document Findings

- Record each finding with evidence (file, class, or method name), applicable concern, and severity.
- Group findings by category for clarity.

---

## Evidence Collection Guide

| Evidence Type | Where to Find |
|---------------|--------------|
| Large classes | Any class file, sorted by line count |
| Duplicated logic | Search for similar patterns across Services and Handlers |
| Naming issues | Variable and method names in business-critical paths |
| Dead code | Commented-out blocks, unused variables |
| TODO comments | Search for `// TODO`, `// FIXME`, `// HACK` |
| DTO explosion | DTOs folder or request/response types |

---

## Common Findings

- God Services with 500+ lines handling unrelated responsibilities.
- Business validation logic duplicated in multiple handlers.
- DTOs reused across create, update, and query operations despite different shapes.
- Methods with 5+ nested `if/else` blocks.
- Commented-out code blocks left in critical paths.
- Inconsistent naming: `GetUser`, `FetchUser`, `RetrieveUser` for equivalent operations.

---

## Red Flags

- A single service class handling authentication, authorization, database access, and email sending.
- Business rules duplicated verbatim in 3+ locations.
- Entire modules of commented-out code with no explanation.
- Test class names that do not indicate what is being tested.

---

## Output

Upon completion, the reviewer produces:

1. A completed `reviews/12-code-quality-review.md`.
2. An Executive Summary describing code quality health.
3. Prioritized recommendations grouped by category.

---

## Quality Checklist

- ☐ A representative sample of the most critical modules is reviewed.
- ☐ God Classes and God Services are explicitly searched.
- ☐ Code duplication is explicitly evaluated.
- ☐ Every finding references an ANTI rule or code quality standard.
- ☐ Positive findings are documented.
- ☐ Executive Summary is complete.

---

## Related Documents

- reviews/12-code-quality-review.md
- scorecards/12-code-quality-scorecard.md
- docs/13-anti-patterns.md
- docs/14-code-review-style.md
- docs/00-rule-catalog.md

---

## Future Enhancements

Future versions of this playbook may include:

- Static analysis tool configuration guidance (SonarQube, Roslyn analyzers).
- Cognitive complexity measurement guidance.
- Technical debt quantification methodology.
- Code review comment quality standards.
