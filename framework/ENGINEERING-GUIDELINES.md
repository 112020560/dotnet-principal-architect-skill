# Engineering Guidelines

> This document defines the engineering standards, authoring rules, and architectural conventions that govern every artifact within the Engineering Assessment Framework (EAF).

The purpose of these guidelines is to ensure consistency, maintainability, repeatability, and high-quality outputs regardless of whether documents are produced by engineers or AI assistants.

---

# Guiding Principles

Every artifact produced within the Engineering Assessment Framework shall follow these engineering principles.

## Single Responsibility

Every document has exactly one responsibility.

A document must never duplicate the responsibilities of another document.

| Artifact | Responsibility |
|----------|----------------|
| Review | Produce engineering evidence |
| Scorecard | Summarize engineering evidence |
| Assessment | Support executive decisions |
| Certification | Formalize engineering decisions |

---

## Evidence-Driven Engineering

Every conclusion must be supported by engineering evidence.

Recommendations shall never be based on assumptions or opinions.

Engineering evidence should always be traceable.

---

## Vendor Neutrality

The framework must remain vendor-neutral.

Avoid references to:

- Cloud vendors
- Programming languages
- Frameworks
- Commercial tools
- Specific products

unless the document explicitly requires technology-specific examples.

---

## Technology Agnostic

The framework evaluates engineering practices rather than technology choices.

Engineering quality must never depend on a specific technology stack.

---

## Executive Orientation

Engineering artifacts should progressively increase their executive value.

Technical details decrease as the framework progresses.

Decision-making value increases.

---

# Document Responsibilities

## Reviews

Reviews inspect software systems.

Reviews generate engineering evidence.

Reviews identify:

- Findings
- Risks
- Observations
- Recommendations

Reviews never:

- Assign maturity levels
- Produce executive decisions
- Certify software

---

## Scorecards

Scorecards consume Reviews.

Scorecards summarize engineering health.

Scorecards evaluate engineering capabilities.

Scorecards provide:

- Executive Summary
- Capability Summary
- Maturity
- Confidence
- Technical Debt
- Executive Dashboard
- Executive Matrix

Scorecards never:

- Perform new inspections
- Duplicate review findings
- Produce deployment decisions

---

## Assessments

Assessments consume one or more Scorecards.

Assessments answer executive questions.

Assessments transform engineering evidence into business decisions.

Assessments always conclude with a decision.

Examples:

- GO
- GO WITH CONDITIONS
- CONDITIONAL GO
- NO GO
- REASSESS REQUIRED

Assessments never:

- Recalculate scores
- Reevaluate engineering capabilities
- Produce technical findings

---

## Certifications

Certifications consume Assessments.

Certifications formally recognize engineering compliance.

Certifications never:

- Perform analysis
- Produce recommendations
- Reevaluate engineering evidence

---

# Writing Standards

Every document shall:

- Begin with a Purpose section.
- Use consistent terminology.
- Follow the canonical section order.
- Maintain a professional tone.
- Use concise language.
- Avoid marketing terminology.
- Avoid subjective language.
- Prefer measurable engineering statements.
- Use Markdown formatting.
- Be easy to read by both engineers and executives.

---

# Naming Conventions

Document names shall follow:

```
NN-domain-artifact.md
```

Examples:

```
01-architecture-review.md

01-architecture-scorecard.md

01-production-readiness-assessment.md

01-production-certification.md
```

---

# Canonical Terminology

Always use the following terms consistently.

| Preferred | Avoid |
|------------|------|
| Engineering Capability | Area |
| Engineering Domain | Category |
| Finding | Issue |
| Recommendation | Suggestion |
| Risk | Problem |
| Evidence | Opinion |
| Assessment | Evaluation Report |
| Certification | Approval |

---

# Traceability

Every layer shall reference outputs from previous layers.

```
Review

↓

Scorecard

↓

Assessment

↓

Certification
```

Information shall always flow forward.

Artifacts shall never bypass previous layers.

---

# Consistency Rules

All documents must:

Maintain consistent terminology.

Maintain consistent section names.

Maintain consistent formatting.

Maintain consistent writing style.

Consistency is preferred over originality.

---

# Future Enhancements

Every document should conclude with a **Future Enhancements** section.

This section identifies opportunities for future evolution without affecting the current scope.

---

# AI Authoring Guidelines

AI assistants contributing to this framework shall:

Read the framework documentation before generating new artifacts.

Respect the responsibilities of each document type.

Never invent new document structures without explicit approval.

Never duplicate information already available in previous layers.

Prefer clarity over verbosity.

Preserve consistency across the entire repository.

Treat the Engineering Assessment Framework as the authoritative source of truth.

---

# Quality Checklist

Before publishing any artifact, verify:

- The document follows its assigned responsibility.
- No responsibilities overlap with other artifacts.
- The terminology is consistent.
- The writing style matches the framework.
- The document remains vendor-neutral.
- The structure follows the canonical format.
- Every recommendation is actionable.
- Every conclusion is evidence-based.
- The document increases value over the previous layer.

---

# Engineering Philosophy

The Engineering Assessment Framework is built on a simple progression.

```
Evidence

↓

Knowledge

↓

Decision

↓

Certification
```

Every artifact must contribute to this progression.

No artifact should interrupt, duplicate, or weaken this engineering lifecycle.

These guidelines are mandatory for every document produced within the framework and represent the engineering standards that govern the repository.