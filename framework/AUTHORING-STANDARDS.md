# Authoring Standards

> This document defines the writing standards for every artifact produced within the Engineering Assessment Framework (EAF).

Its purpose is to ensure that all documentation maintains a consistent voice, structure, terminology, and level of quality, regardless of whether it is authored by a human engineer or an AI assistant.

---

# Writing Philosophy

Documentation is an engineering artifact.

Every document should:

- Communicate clearly.
- Remain objective.
- Be easy to review.
- Be easy to maintain.
- Support engineering decisions.

Good documentation reduces ambiguity.

---

# Writing Principles

## Be Objective

Write factual statements.

Avoid opinions.

Prefer:

> The system lacks automated rollback procedures.

Avoid:

> The rollback process is poor.

---

## Be Evidence-Based

Recommendations should always originate from evidence.

Never speculate.

Never assume.

Never exaggerate.

---

## Be Actionable

Recommendations should describe what should be improved.

Avoid vague recommendations.

Prefer:

> Implement centralized log retention.

Instead of:

> Improve logging.

---

## Be Concise

Avoid unnecessary paragraphs.

Every sentence should add value.

---

## Be Consistent

Use the same terminology throughout the framework.

Never invent alternative names for the same concept.

---

## Be Vendor Neutral

Avoid references to products unless the document explicitly requires them.

Prefer:

Cloud Provider

instead of:

AWS

Azure

Google Cloud

---

# Writing Style

Documents should use:

- Professional language.
- Engineering terminology.
- Executive-friendly wording.
- Neutral tone.

Avoid:

Marketing language.

Sales language.

Emotional language.

Personal opinions.

---

# Document Structure

Every document should follow the canonical section order defined for its artifact type.

Do not rearrange sections.

Do not rename canonical sections.

---

# Section Guidelines

## Purpose

Always begin by explaining why the document exists.

Do not explain how to use it.

---

## Executive Sections

Executive sections summarize.

They never introduce new engineering evidence.

---

## Findings

Findings describe observable engineering conditions.

Findings should never prescribe solutions.

---

## Recommendations

Recommendations should:

Be specific.

Be measurable.

Be achievable.

Be prioritized whenever possible.

---

## Risks

Risks describe potential engineering or business impact.

Avoid describing implementation details.

---

## Future Enhancements

Always conclude with future improvements.

Future Enhancements should never affect the current assessment.

---

# Tables

Prefer tables when comparing information.

Use tables for:

Capabilities

Risks

Recommendations

Decision summaries

Priorities

Avoid tables for long explanations.

---

# Lists

Prefer bullet lists when:

Listing observations.

Listing recommendations.

Listing assumptions.

Listing engineering domains.

Avoid nested lists deeper than two levels.

---

# Terminology

Always use the official framework vocabulary.

Examples:

Engineering Capability

Engineering Domain

Finding

Evidence

Recommendation

Assessment

Certification

Avoid synonyms that create ambiguity.

---

# Writing for Different Audiences

## Reviews

Audience:

Engineers

Architects

Technical Leads

Writing style:

Technical

Detailed

Evidence-driven

---

## Scorecards

Audience:

Engineering Managers

Architects

Technical Leadership

Writing style:

Analytical

Summarized

Comparative

---

## Assessments

Audience:

Executives

CTOs

Governance Boards

Engineering Directors

Writing style:

Decision-oriented

Risk-oriented

Business-oriented

---

## Certifications

Audience:

Governance

Compliance

Audit

Executive Leadership

Writing style:

Formal

Concise

Declarative

---

# Markdown Standards

Use:

Level 1 heading only once.

Level 2 headings for major sections.

Level 3 headings only when necessary.

Prefer tables over deeply nested lists.

Leave a blank line between sections.

Wrap code inside fenced code blocks.

---

# Language Standards

Use active voice whenever possible.

Prefer:

"The platform supports automated recovery."

Instead of:

"Automated recovery is supported by the platform."

---

# Anti-Patterns

Avoid:

Repeating information.

Duplicating previous layers.

Mixing responsibilities.

Overly long paragraphs.

Subjective wording.

Technology bias.

Vendor bias.

Implementation details inside executive artifacts.

---

# AI Authoring Rules

When generating new documents:

Read the framework documentation first.

Respect document responsibilities.

Do not invent new sections.

Do not rename canonical sections.

Maintain terminology.

Maintain formatting.

Maintain writing style.

When uncertain, prefer consistency over creativity.

---

# Quality Checklist

Before completing a document, verify:

✓ The document has a clear purpose.

✓ The audience is appropriate.

✓ The terminology is consistent.

✓ The writing is objective.

✓ Recommendations are actionable.

✓ Evidence supports conclusions.

✓ Responsibilities are not duplicated.

✓ Formatting follows framework standards.

✓ Future Enhancements are included.

---

# Definition of Excellence

Excellent documentation is:

Clear.

Objective.

Consistent.

Actionable.

Maintainable.

Traceable.

Vendor Neutral.

Executive Friendly.

Engineering Focused.

These standards define the expected quality level for every artifact contained within the Engineering Assessment Framework repository.