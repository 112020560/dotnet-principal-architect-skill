# Cloud Infrastructure Review Playbook

> Step-by-step guidance for executing a Cloud Infrastructure Compliance Review.

---

## Purpose

This playbook provides repeatable execution guidance for conducting a Cloud Infrastructure Compliance Review using the Engineering Assessment Framework.

It answers: How should this review be executed?

---

## Audience

- Software Architects
- Platform Engineers
- SRE Engineers
- DevOps Engineers

---

## Prerequisites

- Access to the source repository.
- Access to infrastructure-as-code, Kubernetes manifests, or deployment configuration.
- Familiarity with `reviews/09-cloud-review.md`.
- Familiarity with CLOUD rules in `docs/00-rule-catalog.md`.

---

## When to Execute

- Before cloud deployment or migration.
- When scaling or resilience issues are reported.
- As part of a production readiness process.
- When infrastructure configuration changes significantly.

---

## Estimated Duration

| System Size | Estimated Duration |
|-------------|-------------------|
| Small | 1–2 hours |
| Medium | 2–4 hours |
| Large | 4–8 hours |

---

## Preparation

1. Read `docs/11-cloud.md`.
2. Read `docs/00-rule-catalog.md` — CLOUD section.
3. Open `reviews/09-cloud-review.md` as the working document.
4. Locate: Kubernetes manifests, Helm charts, Dockerfile, infrastructure-as-code (Terraform, Bicep), and deployment scripts.
5. Identify the target deployment environment: Kubernetes, AKS, EKS, GKE, App Service, or other.

---

## Execution Steps

### Step 1 — Evaluate Application Statelessness

- Verify that no local state is stored in application memory between requests.
- Check for in-process caching that would not survive pod restarts.
- Verify that session state is externalized (Redis, distributed cache).
- Check that file uploads are stored in external storage, not the local filesystem.

Rule references: CLOUD-001.

### Step 2 — Evaluate Configuration Management

- Verify that all configuration comes from environment variables, Kubernetes ConfigMaps, or a secrets management service.
- Check for hardcoded configuration values in the container image or source code.
- Verify that connection strings and secrets are sourced from Kubernetes Secrets or a vault solution.

Rule references: CLOUD-002.

### Step 3 — Evaluate Horizontal Scalability

- Verify that the application can run as multiple replicas without coordination issues.
- Check that no singleton state or in-memory locking would break with multiple instances.
- Verify that the container image is stateless and reproducible.

Rule references: CLOUD-003.

### Step 4 — Evaluate Health Checks

- Verify that liveness and readiness probes are configured in Kubernetes manifests.
- Check that health check endpoints correctly reflect the application's ability to serve traffic.
- Verify that readiness probes check critical dependencies (database connectivity, cache availability).

Rule references: CLOUD-004.

### Step 5 — Evaluate Resilience Design

- Verify that the application handles pod restarts and transient failures gracefully.
- Check that retry policies are configured for connections to external dependencies.
- Verify that the application starts quickly and shuts down gracefully (handles SIGTERM).

Rule references: CLOUD-005.

### Step 6 — Evaluate Resource Configuration

- Check that CPU and memory requests and limits are defined in Kubernetes manifests.
- Verify that resource limits prevent a single pod from starving the node.
- Check that pod disruption budgets are defined for critical services.

### Step 7 — Evaluate Infrastructure as Code

- Verify that infrastructure is defined as code and version-controlled.
- Check that infrastructure changes are deployed through the CI/CD pipeline, not manually.

### Step 8 — Document Findings

- Record each finding with evidence, applicable rule, and severity.

---

## Evidence Collection Guide

| Evidence Type | Where to Find |
|---------------|--------------|
| Statelessness | Application code, in-process caches, file system usage |
| Configuration | `appsettings.json`, environment variable usage, Kubernetes manifests |
| Health checks | `AddHealthChecks`, Kubernetes `livenessProbe`, `readinessProbe` |
| Resource limits | Kubernetes `resources.requests`, `resources.limits` |
| Graceful shutdown | `IHostApplicationLifetime`, `StopAsync`, SIGTERM handling |
| Infrastructure as code | Terraform, Bicep, Helm charts, Kubernetes manifests |

---

## Common Findings

- In-process `IMemoryCache` used for data that must survive pod restarts.
- Readiness probe configured as liveness probe — always passes even when dependencies are down.
- No resource requests or limits defined — pods can consume unbounded resources.
- Configuration hardcoded in the container image via `ENV` in the Dockerfile.
- Graceful shutdown not implemented — active requests are dropped on pod termination.
- Infrastructure deployed manually without version control.

---

## Red Flags

- Application writes to the local filesystem for persistent data.
- `ASPNETCORE_ConnectionStrings__Default` hardcoded in the Dockerfile.
- Kubernetes readiness probe pointing to `/` — always succeeds even when the database is unreachable.
- No liveness or readiness probes defined.
- Single replica deployment for a production service with no pod disruption budget.

---

## Output

Upon completion, the reviewer produces:

1. A completed `reviews/09-cloud-review.md`.
2. An Executive Summary describing cloud infrastructure health.
3. Prioritized recommendations.

---

## Quality Checklist

- ☐ Statelessness is explicitly verified — not assumed.
- ☐ Health check accuracy is evaluated, not just presence.
- ☐ Resource limits are confirmed.
- ☐ Every finding references a CLOUD rule.
- ☐ Positive findings are documented.
- ☐ Executive Summary is complete.

---

## Related Documents

- reviews/09-cloud-review.md
- scorecards/09-cloud-scorecard.md
- docs/11-cloud.md
- docs/00-rule-catalog.md

---

## Future Enhancements

Future versions of this playbook may include:

- Kubernetes security context review guidance.
- Network policy review checklist.
- FinOps and resource optimization guidance.
- Multi-region deployment review.
