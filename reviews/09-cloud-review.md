# Cloud & Infrastructure Compliance Review

> Evaluate the cloud-native readiness of a software solution against the Principal .NET Architect Engineering Standard.

---

# Purpose

This review evaluates how well a software solution is designed, deployed, and operated as a cloud-native system — statelessness, configuration management, scalability, health, and resiliency.

Its objectives are to:

- Verify compliance with the Engineering Standard.
- Evaluate statelessness and configuration management.
- Assess horizontal scalability and elasticity.
- Review health check and resiliency design.
- Evaluate infrastructure automation and reproducibility.
- Assess operational cost awareness.
- Capture engineering decisions and trade-offs.

This review verifies compliance.

It does not redefine engineering rules.

All referenced rules are defined in:

> docs/00-rule-catalog.md

---

# Review Scope

This review evaluates:

- Statelessness
- Configuration Management
- Horizontal Scalability
- Health Checks
- Resiliency
- Infrastructure as Code
- Container Practices
- Secrets in Deployment
- Cost Awareness
- Cloud Portability

This review applies equally to Azure, AWS, Google Cloud, and private Kubernetes environments — it is vendor-neutral by design.

---

# Review Metadata

| Field | Value |
|---------|-------|
| Project | |
| Repository | |
| Branch | |
| Commit | |
| Reviewer | |
| Review Date | |
| Cloud Provider(s) | |
| Review Scope | |

---

# Executive Summary

Summarize the overall cloud-native maturity of the solution.

Include:

- Main strengths.
- Main weaknesses.
- Highest operational risks.
- Cost concerns.
- Recommended priorities.

---

# Compliance Legend

| Compliance | Meaning |
|------------|---------|
| ✅ Compliant | Fully complies with the Engineering Standard. |
| ⚠️ Partially Compliant | Mostly compliant but improvements are recommended. |
| ❌ Non-Compliant | Violates the Engineering Standard. |
| ➖ Not Applicable | Rule does not apply to the reviewed solution. |

---

# Cloud Compliance Review

| Compliance | Rule | Evidence | Notes |
|------------|------|----------|-------|
| | CLOUD-001 | | |
| | CLOUD-002 | | |
| | CLOUD-003 | | |
| | CLOUD-004 | | |
| | CLOUD-005 | | |

---

# Engineering Review Questions

These questions capture engineering judgment.

They complement the compliance review by documenting the reasoning behind engineering decisions.

Answers do not affect the Compliance Score.

---

## Answer Legend

| Value | Meaning |
|--------|---------|
| Yes | Implemented |
| No | Not Implemented |
| Partial | Partially Implemented |
| Unknown | Unable to Determine |
| N/A | Not Applicable |

---

# Statelessness

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Can any instance be terminated without data loss? | | | |
| Is session state stored externally (cache, database)? | | | |
| Are local files avoided as the source of truth? | | | |
| Can the application scale out without sticky sessions? | | | |

---

# Configuration Management

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Is configuration externalized from code? | | | |
| Can configuration change without recompilation? | | | |
| Is configuration validated at startup? | | | |
| Are per-environment settings isolated? | | | |

---

# Horizontal Scalability

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Does the service scale out rather than only up? | | | |
| Is autoscaling configured based on real signals (CPU, queue depth, latency)? | | | |
| Are shared in-memory caches avoided as a scaling blocker? | | | |
| Has the service been load-tested at target scale? | | | |

---

# Health Checks & Resiliency

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Are liveness and readiness probes separated? | | | |
| Do health checks reflect real dependency health? | | | |
| Does the application degrade gracefully on dependency failure? | | | |
| Is redundancy used where business continuity requires it? | | | |

---

# Infrastructure & Deployment

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Is infrastructure defined as code? | | | |
| Are deployments automated and repeatable? | | | |
| Are containers immutable once built? | | | |
| Can a deployment be rolled back automatically? | | | |

---

# Secrets & Identity in Deployment

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Are secrets absent from container images? | | | |
| Is identity-based authentication used between services? | | | |
| Are long-lived credentials minimized? | | | |

---

# Cost Awareness

| Question | Answer | Why? | Notes |
|----------|--------|------|-------|
| Is compute utilization reviewed regularly? | | | |
| Are idle or oversized resources identified? | | | |
| Is storage growth monitored? | | | |
| Are managed services evaluated for cost, not just convenience? | | | |

---

# Production Evidence

## Scaling

| Evidence | Available | Source | Notes |
|----------|-----------|--------|-------|
| Autoscaling Events | | | |
| Instance Count Over Time | | | |
| CPU/Memory Utilization | | | |

---

## Reliability

| Evidence | Available | Source | Notes |
|----------|-----------|--------|-------|
| Health Check Failures | | | |
| Pod/Instance Restarts | | | |
| Deployment Rollback History | | | |

---

## Cost

| Evidence | Available | Source | Notes |
|----------|-----------|--------|-------|
| Cost Dashboards | | | |
| Idle Resource Reports | | | |

---

# Cloud Maturity

| Capability | Level |
|------------|------:|
| Statelessness | |
| Configuration Management | |
| Scalability | |
| Resiliency | |
| Infrastructure Automation | |
| Cost Management | |

---

## Overall Maturity

- ☐ Level 1 – Manual Deployments, Stateful Instances
- ☐ Level 2 – Automated Deployments
- ☐ Level 3 – Infrastructure as Code
- ☐ Level 4 – Elastic, Self-Healing
- ☐ Level 5 – Fully Cloud-Native, Cost-Optimized

---

# Cloud Smells

| Detected | Anti-Pattern | Impact | Evidence | Recommendation |
|----------|--------------|--------|----------|----------------|
| ☐ | Stateful Containers | | | |
| ☐ | Manual Production Deployments | | | |
| ☐ | Hardcoded Configuration | | | |
| ☐ | Secrets Inside Images | | | |
| ☐ | Single Instance Production Services | | | |
| ☐ | Missing Health Probes | | | |
| ☐ | No Autoscaling Strategy | | | |
| ☐ | Ignoring Cloud Costs | | | |

---

# Positive Findings

Document engineering decisions that improve cloud-native maturity.

Examples:

- Fully automated, reproducible deployments.
- Clear separation of liveness and readiness.
- Demonstrated graceful degradation under dependency failure.
- Cost reviewed as part of architectural decisions.

---

# Risks

| Risk | Business Impact | Recommendation |
|------|-----------------|----------------|
| | | |
| | | |

---

# Top Recommendations

| Priority | Recommendation | Expected Benefit |
|----------|----------------|------------------|
| 1 | | |
| 2 | | |
| 3 | | |

---

# Cloud Compliance Score

| Area | Compliance |
|------|-----------:|
| Statelessness | |
| Configuration Management | |
| Scalability | |
| Health & Resiliency | |
| Infrastructure Automation | |
| Cost Awareness | |

---

## Overall Compliance

Cloud Compliance

__________ %

### Engineering Assessment

- ☐ Excellent (95–100%)
- ☐ Very Good (85–94%)
- ☐ Good (75–84%)
- ☐ Needs Improvement (60–74%)
- ☐ Critical (<60%)

---

# Compliance Summary

| Metric | Value |
|--------|------:|
| Rules Evaluated | |
| Compliant | |
| Partially Compliant | |
| Non-Compliant | |
| Not Applicable | |

---

# Review Confidence

| Area | Confidence | Evidence |
|------|------------|----------|
| Source Code | | |
| Infrastructure Definitions | | |
| Runtime Behavior | | |
| Production Telemetry | | |
| Cost Reports | | |

---

## Overall Confidence

☐ High

☐ Medium

☐ Low

---

# Related Engineering Rules

## Cloud

- CLOUD-001 → CLOUD-005

---

# Related Documentation

- docs/00-rule-catalog.md
- docs/11-cloud.md
- docs/08-observability.md
- docs/13-anti-patterns.md
- docs/14-code-review-style.md

---

# Final Assessment

Provide a concise conclusion covering:

- Cloud-native maturity.
- Scalability and resiliency.
- Infrastructure automation.
- Cost posture.
- Highest-value improvements.

The objective is to ensure the solution can scale, recover, and operate cost-effectively regardless of the chosen cloud provider.
