
# Testing Rules

> *The purpose of testing is not to increase coverage. The purpose of testing is to increase confidence.*

---

# Purpose

This document defines engineering rules for designing, implementing and reviewing automated tests in modern .NET applications.

Testing is an engineering practice that enables teams to evolve software safely while reducing production risk.

Rule IDs and descriptions in this document must always match `docs/00-rule-catalog.md` exactly — if a number here does not match the catalog, the catalog wins and this file has drifted.

---

# Testing Principles

- Test behavior, not implementation.
- Prefer confidence over coverage.
- Keep tests deterministic.
- Fast feedback is a competitive advantage.
- Integration tests provide the highest business value.
- A test that flakes is a defect.

---

# Rule TEST-001 — Build a Balanced Test Strategy

**Severity:** Critical

Use an appropriate mix of:

- Unit Tests
- Integration Tests
- Contract Tests
- End-to-End Tests

Do not rely exclusively on one category.

---

# Rule TEST-002 — Test Behavior Rather Than Implementation

Tests should validate observable business outcomes.

Avoid verifying private implementation details.

Refactoring should rarely break tests.

---

# Rule TEST-003 — Prefer Integration Tests for Business Flows

Integration tests validate:

- HTTP APIs
- Databases
- Messaging
- Authentication
- Serialization

They usually provide more confidence than isolated unit tests.

---

# Rule TEST-004 — Mock Only True External Dependencies

Good candidates:

- Payment gateways
- Email providers
- SMS providers
- Third-party APIs

Avoid mocking your own repositories, domain services or business rules unless isolation is required.

---

# Rule TEST-005 — Prefer Testcontainers for Infrastructure Tests

Whenever practical, run:

- PostgreSQL
- SQL Server
- Redis
- RabbitMQ
- Kafka

inside disposable containers.

Production-like environments improve confidence.

---

# Rule TEST-006 — Tests Must Be Deterministic

Tests should produce the same result regardless of:

- Time
- Machine
- Execution order
- Environment

Eliminate flaky tests immediately.

---

# Rule TEST-007 — Tests Must Be Independent

Each test should prepare and clean up its own state.

Avoid hidden dependencies between tests.

---

# Rule TEST-008 — Follow Arrange-Act-Assert

Prefer the AAA structure.

Readable tests are easier to maintain.

---

# Rule TEST-009 — Coverage Is a Metric, Not a Goal

High coverage does not imply high quality.

Low coverage does not necessarily indicate poor quality.

Evaluate critical business flows, risk, and confidence before pursuing coverage percentages.

---

# Rule TEST-010 — Validate Failure Scenarios

Validate:

- Validation failures
- Timeouts
- Retries
- Authorization failures
- Dependency failures

Happy-path testing alone is insufficient.

---

# Additional Engineering Guidance

The following guidance is established practice but is not a numbered rule in `docs/00-rule-catalog.md` — do not cite it with a rule ID.

## Contract Tests Protect Integrations

For distributed systems, consider contract testing to verify requests, responses, and message contracts, preventing accidental breaking changes. Related to TEST-003.

## Builders Improve Readability

Prefer Test Data Builders, Object Mothers (when appropriate), or AutoFixture over large object initialization blocks in every test.

## Assertions Should Explain Intent

Prefer expressive assertion libraries (FluentAssertions, Shouldly) that communicate expected behavior.

## Background Services Require Dedicated Tests

Validate startup, cancellation, retry behavior, message handling, and scheduling — hosted services are production code. See API-009.

## Tests Are Part of the Architecture

Testing strategy should evolve with the architecture. Review tests with the same rigor as production code.

---

# Common Testing Smells

- Flaky tests
- Excessive mocking
- Sleep() in tests
- Shared mutable state
- Giant fixtures
- Coverage obsession
- Tests coupled to implementation
- Slow feedback
- Missing integration tests

---

# Testing Review Checklist

- Is the strategy balanced?
- Are behaviors tested?
- Are integration tests present?
- Are mocks justified?
- Are containers used where valuable?
- Are tests deterministic?
- Is AAA respected?
- Are failure paths covered?
- Is coverage interpreted correctly?
- Can developers trust the suite?

---

# Recommended Stack

- xUnit
- NUnit
- MSTest
- FluentAssertions
- Testcontainers for .NET
- WireMock.NET
- Respawn
- WebApplicationFactory
- AutoFixture
- BenchmarkDotNet (performance validation)

---

# References

- Microsoft Testing Documentation
- Martin Fowler – Test Pyramid
- Kent Beck – Test-Driven Development
- Testcontainers Documentation
- WireMock.NET Documentation
- FluentAssertions Documentation
