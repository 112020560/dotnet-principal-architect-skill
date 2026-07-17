# AGENTS.md

# Engineering Assessment Framework (EAF)

This repository contains the Engineering Assessment Framework (EAF), a vendor-neutral framework for reviewing software systems, assessing engineering maturity, supporting executive decision-making, and certifying production readiness.

This document defines how AI assistants must contribute to the project.

These instructions are mandatory.

---

# Your Role

You are not creating documentation.

You are contributing to an engineering framework.

Every modification must preserve the architecture, philosophy, and consistency of the framework.

Never optimize for speed.

Always optimize for consistency.

---

# Before Writing Anything

Before creating or modifying any document you MUST understand the framework.

Read the following documents in this exact order.

1. framework/ENGINEERING-ASSESSMENT-FRAMEWORK.md
2. framework/ENGINEERING-GUIDELINES.md
3. framework/AUTHORING-STANDARDS.md

Only after understanding those documents should you continue.

---

# Then Read

If writing a Review

Read previous Reviews.

If writing a Scorecard

Read:

The corresponding Review.

Existing Scorecards.

If writing an Assessment

Read:

All referenced Scorecards.

If writing a Certification

Read:

The corresponding Assessment.

Never skip previous layers.

---

# Framework Architecture

The framework always follows this lifecycle.

Software System

↓

Reviews

↓

Scorecards

↓

Assessments

↓

Certifications

Every artifact consumes outputs from previous layers.

No artifact performs work already completed.

---

# Responsibilities

Reviews

Produce engineering evidence.

Scorecards

Summarize engineering evidence.

Assessments

Transform evidence into executive decisions.

Certifications

Formalize executive decisions.

These responsibilities must never overlap.

---

# Never Do These Things

Never invent a new document structure.

Never rename canonical sections.

Never duplicate information.

Never introduce vendor bias.

Never introduce technology bias.

Never change terminology.

Never change numbering conventions.

Never remove Future Enhancements.

Never merge responsibilities.

---

# Canonical Vocabulary

Always use these terms.

Engineering Domain

Engineering Capability

Evidence

Finding

Recommendation

Risk

Assessment

Certification

Avoid synonyms.

Consistency is more important than variety.

---

# Writing Style

Write like an experienced software architect.

Be objective.

Be concise.

Be professional.

Avoid marketing language.

Avoid emotional language.

Avoid subjective opinions.

Use engineering language.

---

# Reviews

Reviews answer

"What did we find?"

Reviews never score.

Reviews never certify.

Reviews never make executive decisions.

---

# Scorecards

Scorecards answer

"How healthy is this engineering domain?"

Scorecards summarize.

Scorecards never inspect systems.

---

# Assessments

Assessments answer

"What decision should be made?"

Assessments never inspect systems.

Assessments never calculate maturity.

Assessments always finish with a decision.

---

# Certifications

Certifications answer

"Has the organization formally approved this?"

Certifications are declarations.

Not analyses.

---

# Every Recommendation Must

Be actionable.

Be measurable.

Be evidence-driven.

Be realistic.

Support engineering improvement.

---

# Every Finding Must

Describe reality.

Be objective.

Be verifiable.

Avoid assumptions.

---

# Every Assessment Must

Contain an executive question.

Contain a final decision.

Explain why that decision was reached.

Identify remaining risks.

Identify outstanding actions.

---

# Every Certification Must

Reference the corresponding Assessment.

Declare certification status.

Declare certification scope.

Declare validity.

Never analyze.

---

# Repository Philosophy

This repository values:

Consistency over creativity.

Engineering over marketing.

Evidence over opinion.

Decisions over observations.

Traceability over assumptions.

---

# If You Are Unsure

Do not invent.

Look at existing artifacts.

Maintain consistency.

Follow the framework.

When in doubt, preserve the architecture instead of creating something new.

---

# Goal

Your objective is not to write documentation.

Your objective is to expand the Engineering Assessment Framework without changing its philosophy, architecture, or engineering standards.

Every contribution should feel as if it had been written by the original framework authors.