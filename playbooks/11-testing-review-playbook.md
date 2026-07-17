# Testing Review Playbook

> Step-by-step guidance for executing a Testing Compliance Review.

---

## Purpose

This playbook provides repeatable execution guidance for conducting a Testing Compliance Review using the Engineering Assessment Framework.

It answers: How should this review be executed?

---

## Audience

- Software Architects
- Principal Engineers
- Technical Leads
- QA Engineers

---

## Prerequisites

- Access to the source repository, including test projects.
- Familiarity with `reviews/11-testing-review.md`.
- Familiarity with TEST rules in `docs/00-rule-catalog.md`.

---

## When to Execute

- When onboarding a new system for assessment.
- When defect rates are elevated.
- Before major releases.
- As part of a production readiness process.

---

## Estimated Duration

| System Size | Estimated Duration |
|-------------|-------------------|
| Small | 1–2 hours |
| Medium | 2–4 hours |
| Large | 4–8 hours |

---

## Preparation

1. Read `docs/12-testing.md`.
2. Read `docs/00-rule-catalog.md` — TEST section.
3. Open `reviews/11-testing-review.md` as the working document.
4. Locate all test projects and identify their categories (unit, integration, end-to-end).
5. Run tests locally or review recent CI test results.

---

## Execution Steps

### Step 1 — Evaluate Testing Strategy Balance

- Identify the distribution of tests: unit, integration, end-to-end.
- Assess whether the strategy is appropriate for the system's architecture and risk profile.
- Verify that integration tests cover the most critical business flows.

Rule references: TEST-001, TEST-003.

### Step 2 — Evaluate Behavioral Testing

- Review a sample of unit tests to verify they test behavior, not implementation.
- Check for tests that assert on private methods or internal state.
- Verify that tests would survive a refactoring of the code they test.

Rule references: TEST-002.

### Step 3 — Evaluate Mock Usage

- Verify that mocks are used only for true external dependencies (HTTP APIs, message brokers, external storage).
- Identify tests that mock the database when Testcontainers or an in-memory provider would be more appropriate.
- Check for excessive mocking that makes tests fragile and disconnected from behavior.

Rule references: TEST-004.

### Step 4 — Evaluate Infrastructure Testing

- Verify that Testcontainers or equivalent is used for integration tests involving a real database or message broker.
- Check that integration tests do not rely on a specific shared environment.

Rule references: TEST-005.

### Step 5 — Evaluate Test Determinism and Independence

- Run the test suite multiple times and verify that results are consistent.
- Check for tests that depend on execution order.
- Verify that tests do not share mutable state.
- Check for time-dependent tests using `DateTime.Now` without abstraction.

Rule references: TEST-006, TEST-007.

### Step 6 — Evaluate Test Structure

- Review a sample of tests for Arrange-Act-Assert structure.
- Verify that test names describe the scenario and expected outcome.
- Check for overly complex test setup that obscures the intent.

Rule references: TEST-008.

### Step 7 — Evaluate Failure Scenario Coverage

- Identify critical business flows and verify that failure paths are tested.
- Check for tests covering invalid inputs, boundary conditions, and error handling.

Rule references: TEST-010.

### Step 8 — Evaluate Coverage as a Signal

- If code coverage is measured, use it to identify completely untested areas, not as a target.
- Identify high-risk code with zero test coverage.
- Do not recommend increasing coverage percentage without evaluating test quality.

Rule references: TEST-009.

### Step 9 — Document Findings

- Record each finding with evidence, applicable rule, and severity.

---

## Evidence Collection Guide

| Evidence Type | Where to Find |
|---------------|--------------|
| Test project structure | Solution structure, test project names |
| Unit tests | `*Tests` projects, test files |
| Integration tests | `IntegrationTests`, Testcontainers usage |
| Mock usage | `Moq`, `NSubstitute`, `FakeItEasy` |
| Test names | Method names in test classes |
| Coverage report | CI pipeline coverage step or `dotnet test --collect:` |

---

## Common Findings

- Tests that mock the database instead of using Testcontainers.
- Test names that describe the method being called, not the behavior being tested.
- No integration tests covering the database or message broker.
- Tests that break when the internal implementation changes but behavior is unchanged.
- Only happy path tested — no failure or error scenarios.
- Tests sharing state through static fields or test class constructors.

---

## Red Flags

- No test projects in the solution.
- Test suite passes only when run in a specific order.
- All tests mock every dependency including the database.
- Critical business operations (payment, order placement) have no tests.

---

## Output

Upon completion, the reviewer produces:

1. A completed `reviews/11-testing-review.md`.
2. An Executive Summary describing testing strategy quality.
3. Prioritized recommendations identifying the highest-risk gaps.

---

## Quality Checklist

- ☐ Testing strategy balance is evaluated — not just presence.
- ☐ Mock usage is explicitly evaluated for appropriateness.
- ☐ Test determinism is verified.
- ☐ Failure scenarios are checked.
- ☐ Every finding references a TEST rule.
- ☐ Positive findings are documented.
- ☐ Executive Summary is complete.

---

## Related Documents

- reviews/11-testing-review.md
- scorecards/11-testing-scorecard.md
- docs/12-testing.md
- docs/00-rule-catalog.md

---

## Future Enhancements

Future versions of this playbook may include:

- Testcontainers setup guidance for .NET.
- Mutation testing introduction guidance.
- Contract testing review checklist.
- Test performance (execution time) review.
