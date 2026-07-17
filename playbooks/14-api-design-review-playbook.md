# API Design Review Playbook

> Step-by-step guidance for executing an API Design Compliance Review.

---

## Purpose

This playbook provides repeatable execution guidance for conducting an API Design Compliance Review using the Engineering Assessment Framework.

It answers: How should this review be executed?

---

## Audience

- Software Architects
- Principal Engineers
- Technical Leads
- API Owners

---

## Prerequisites

- Access to the source repository.
- Access to API documentation or OpenAPI specification if available.
- Familiarity with `reviews/14-api-design-review.md`.
- Familiarity with HTTP and API rules in `docs/00-rule-catalog.md`.

---

## When to Execute

- Before publishing a new public or internal API.
- When API consumers report inconsistency or confusion.
- Before major API version changes.
- As part of a production readiness process.

---

## Estimated Duration

| System Size | Estimated Duration |
|-------------|-------------------|
| Small | 1–2 hours |
| Medium | 2–4 hours |
| Large | 4–6 hours |

---

## Preparation

1. Read `docs/06-http.md` — API sections.
2. Read `docs/07-aspnet-core.md`.
3. Read `docs/00-rule-catalog.md` — API and HTTP sections.
4. Open `reviews/14-api-design-review.md` as the working document.
5. Locate the API controllers or Minimal API endpoint definitions.
6. Collect the OpenAPI specification if available.

---

## Execution Steps

### Step 1 — Evaluate REST Semantics

- Verify that HTTP methods are used correctly for their intended semantics.
- Check that GET operations are idempotent and have no side effects.
- Verify that POST is used for resource creation, PUT/PATCH for updates, DELETE for removal.
- Identify operations using POST for all actions regardless of semantics.

Rule references: HTTP-006.

### Step 2 — Evaluate Resource Naming and URL Structure

- Verify that resource names are nouns, not verbs: `/orders` not `/getOrders`.
- Check that resource names are consistent (plural vs. singular applied uniformly).
- Verify that URL hierarchies reflect resource relationships: `/customers/{id}/orders`.
- Check for overly deep URL nesting (more than 3 levels).

### Step 3 — Evaluate HTTP Status Codes

- Verify that status codes accurately reflect the operation outcome.
- Check for returning 200 for all responses including errors.
- Verify: 201 for resource creation, 204 for no-content responses, 400 for validation failures, 401 for authentication failures, 403 for authorization failures, 404 for not found, 409 for conflicts.

### Step 4 — Evaluate Request and Response Design

- Verify that request and response DTOs are purpose-designed for their operation.
- Check for the same DTO being reused across create, update, and query operations with different optional fields.
- Verify that response payloads do not include sensitive internal data.
- Check that large list responses are paginated.

Rule references: HTTP-011.

### Step 5 — Evaluate Error Responses

- Verify that all error responses follow RFC 9457 Problem Details.
- Check that error responses include a meaningful `detail` field.
- Verify that a `traceId` or `correlationId` is included in error responses.

Rule references: HTTP-007, API-005.

### Step 6 — Evaluate API Versioning

- Verify that a versioning strategy is defined and documented.
- Check that breaking changes require a new API version.
- Verify that deprecated API versions have a documented sunset plan.

Rule references: HTTP-012.

### Step 7 — Evaluate Request Validation

- Verify that all required fields are enforced and return 400 with details on failure.
- Check that field constraints (length, format, range) are validated at the API boundary.
- Verify that invalid input never reaches domain logic.

Rule references: HTTP-008, API-003.

### Step 8 — Evaluate Consistency

- Verify that naming conventions, date formats, and pagination patterns are consistent across all endpoints.
- Check that similar operations follow the same pattern (e.g., all list endpoints support the same filter parameters).

### Step 9 — Document Findings

- Record each finding with evidence, applicable rule, and severity.

---

## Evidence Collection Guide

| Evidence Type | Where to Find |
|---------------|--------------|
| Endpoint definitions | Controller actions or Minimal API routes |
| HTTP method usage | Route attributes (`[HttpGet]`, `[HttpPost]`) |
| Status code usage | Return statements, `Results.*` calls |
| Request/response DTOs | `Requests/`, `Responses/`, `Dtos/` folders |
| Error handling | Exception handlers, Problem Details implementation |
| API versioning | `ApiVersion` attributes, URL segments, headers |
| OpenAPI spec | `swagger.json`, Swashbuckle or NSwag output |

---

## Common Findings

- `POST /api/getOrders` — verb used in URL instead of noun with correct HTTP method.
- All operations return 200, even validation failures and not-found errors.
- Same DTO used for create and update with all fields optional — no enforcement of required fields.
- List endpoints return all records without pagination.
- Error responses return plain strings instead of Problem Details.
- No API versioning — breaking changes deployed to existing consumers.

---

## Red Flags

- `POST /execute`, `POST /process`, `GET /doSomething` — verb-based URLs.
- 200 returned with an error message in the body.
- No pagination on list endpoints with potentially large result sets.
- API contracts contain internal domain identifiers (database IDs) without abstraction.

---

## Output

Upon completion, the reviewer produces:

1. A completed `reviews/14-api-design-review.md`.
2. An Executive Summary describing API design quality and consistency.
3. Prioritized recommendations.

---

## Quality Checklist

- ☐ All endpoints are evaluated for HTTP method correctness.
- ☐ Status code usage is verified across success and failure paths.
- ☐ Error responses follow Problem Details.
- ☐ Pagination is confirmed on list endpoints.
- ☐ API versioning strategy is documented.
- ☐ Every finding references an HTTP or API rule.
- ☐ Positive findings are documented.
- ☐ Executive Summary is complete.

---

## Related Documents

- reviews/14-api-design-review.md
- scorecards/14-api-design-scorecard.md
- docs/06-http.md
- docs/07-aspnet-core.md
- docs/00-rule-catalog.md

---

## Future Enhancements

Future versions of this playbook may include:

- OpenAPI specification validation guidance.
- API contract testing review.
- GraphQL API design review checklist.
- Backward compatibility verification guidance.
