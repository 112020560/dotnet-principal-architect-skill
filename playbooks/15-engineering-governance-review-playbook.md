# Engineering Governance Review Playbook

> Step-by-step guidance for executing an Engineering Governance Compliance Review.

---

## Purpose

This playbook provides repeatable execution guidance for conducting an Engineering Governance Compliance Review using the Engineering Assessment Framework.

It answers: How should this review be executed?

---

## Audience

- Software Architects
- Engineering Managers
- Principal Engineers
- CTO and Technical Directors

---

## Prerequisites

- Access to the source repository and its documentation.
- Access to ADR records, engineering standards, and internal wikis.
- Familiarity with `reviews/15-engineering-governance-review.md`.

---

## When to Execute

- Annually as part of an engineering excellence program.
- When engineering quality is declining despite no obvious technical cause.
- When onboarding a new team or organization for assessment.
- After significant team growth or reorganization.

---

## Estimated Duration

| Scope | Estimated Duration |
|-------|-------------------|
| Single team | 2–4 hours |
| Multiple teams | 4–8 hours |
| Organization | 1–2 days |

---

## Preparation

1. Open `reviews/15-engineering-governance-review.md` as the working document.
2. Request access to: engineering standards documentation, ADR history, code review records, deployment history.
3. Identify the key stakeholders: engineering manager, technical lead, product owner.
4. Prepare a list of questions for any interviews or discussions needed.

---

## Execution Steps

### Step 1 — Evaluate Engineering Standards Adoption

- Verify that engineering standards are documented and accessible to the team.
- Check that standards are referenced in code reviews and design discussions.
- Identify whether standards are aspirational or actively enforced.
- Verify that new engineers are introduced to standards during onboarding.

### Step 2 — Evaluate Architecture Governance

- Check for the presence and recency of Architecture Decision Records (ADRs).
- Verify that significant architectural decisions are documented with context and rationale.
- Identify key architectural decisions that lack documentation.
- Check that ADRs are reviewed and updated as the architecture evolves.

### Step 3 — Evaluate Engineering Review Practices

- Verify that code reviews are consistently performed before merging.
- Check that code review feedback is constructive, evidence-based, and references standards.
- Identify whether code reviews focus on engineering quality or style preferences.
- Verify that architecture reviews are performed before major changes.

### Step 4 — Evaluate Technical Debt Governance

- Check whether technical debt is tracked (backlog items, technical debt register).
- Verify that technical debt is periodically reviewed and prioritized.
- Identify whether unplanned technical debt is accepted without documentation.

### Step 5 — Evaluate Knowledge Management

- Verify that architecture, domain, and operational knowledge is documented.
- Check that documentation is current and reflects the actual system state.
- Identify key-person dependencies — areas where a single engineer holds critical knowledge.
- Verify that onboarding documentation exists and is effective.

### Step 6 — Evaluate Engineering Consistency

- Assess whether engineering patterns are applied consistently across teams and modules.
- Check for significant inconsistencies in architecture, naming, or technology choices within the same system.
- Identify whether inconsistencies are intentional (justified decisions) or uncontrolled drift.

### Step 7 — Evaluate Technology Lifecycle Management

- Identify any end-of-life or unsupported technologies in use.
- Check that technology upgrade plans exist for components approaching end of support.
- Verify that dependency versions are maintained and security patches applied.

### Step 8 — Evaluate Continuous Improvement

- Check for evidence of retrospectives or engineering improvement processes.
- Verify that past findings from reviews have been addressed.
- Identify whether engineering quality metrics are tracked over time.

### Step 9 — Document Findings

- Record each finding with evidence, business impact, and severity.
- Frame findings in terms of organizational risk, not individual performance.

---

## Evidence Collection Guide

| Evidence Type | Where to Find |
|---------------|--------------|
| Engineering standards | Internal wiki, repository `docs/` folder, CLAUDE.md |
| ADR records | `docs/adr/`, `architecture/decisions/` |
| Code review records | Pull request history in the repository |
| Technical debt | Issue tracker labels, backlog items |
| Onboarding documentation | Internal wiki, README files |
| Dependency versions | `.csproj` files, `packages.lock.json`, Dependabot config |
| Review findings history | Previous assessment reports |

---

## Common Findings

- Engineering standards exist but are not referenced during code reviews.
- No ADRs — architectural decisions made verbally with no record.
- Technical debt acknowledged but not tracked or prioritized.
- Key architectural knowledge held by one engineer with no documentation.
- Dependencies not updated in 12+ months — security patches missed.
- Code reviews focus on formatting and naming rather than architectural concerns.

---

## Red Flags

- No engineering standards documentation.
- No ADR history despite multiple years of architectural decisions.
- Critical system knowledge held entirely by one person with no succession plan.
- No process for reviewing or acting on technical debt.
- Dependencies with known critical CVEs left unpatched.

---

## Output

Upon completion, the reviewer produces:

1. A completed `reviews/15-engineering-governance-review.md`.
2. An Executive Summary describing governance maturity.
3. Prioritized recommendations framed as organizational improvements.

---

## Quality Checklist

- ☐ ADR coverage is explicitly evaluated.
- ☐ Key-person dependency risk is identified.
- ☐ Technology lifecycle status is verified.
- ☐ Technical debt governance is assessed.
- ☐ Findings are framed as organizational risks, not individual blame.
- ☐ Positive findings are documented.
- ☐ Executive Summary is complete.

---

## Related Documents

- reviews/15-engineering-governance-review.md
- scorecards/15-engineering-governance-scorecard.md
- assessments/02-engineering-maturity-assessment.md

---

## Future Enhancements

Future versions of this playbook may include:

- Engineering maturity self-assessment survey template.
- ADR template and governance guidance.
- Technical debt register template.
- Engineering KPI definition guidance.
