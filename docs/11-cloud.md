
# Cloud Rules

> *Cloud is an operating model, not merely a hosting location.*

---

# Purpose

This document defines engineering rules for designing, deploying and operating cloud-native .NET applications.

The objective is to build systems that are resilient, scalable, observable, secure and cost-efficient regardless of the chosen cloud provider.

These rules apply equally to Azure, AWS, Google Cloud and private Kubernetes environments.

Rule IDs and descriptions in this document must always match `docs/00-rule-catalog.md` exactly — if a number here does not match the catalog, the catalog wins and this file has drifted.

---

# Cloud Principles

- Design for failure.
- Automate everything.
- Infrastructure is code.
- Applications must be stateless whenever possible.
- Elasticity should be intentional.
- Security begins with identity.
- Cost is an architectural concern.

---

# Rule CLOUD-001 — Applications Are Stateless

**Severity:** Critical

Keep application instances disposable.

Persist state in external systems such as:

- Databases
- Object storage
- Distributed cache
- Message brokers

Stateless services scale more easily.

---

# Rule CLOUD-002 — Configuration Comes From the Environment

Do not embed environment-specific configuration in code.

Use:

- Environment variables
- Secret stores
- Configuration services

Configuration should change without recompilation.

---

# Rule CLOUD-003 — Design for Horizontal Scalability

Prefer scaling out before scaling up.

Applications should avoid relying on local memory or local files.

---

# Rule CLOUD-004 — Health Checks Are Mandatory

Implement liveness, readiness, and startup probes.

Health endpoints should accurately represent service state — not just "the process is running."

---

# Rule CLOUD-005 — Design for Resiliency

Assume instances fail, networks fail, dependencies become unavailable, and storage may become temporarily inaccessible. Applications should degrade gracefully instead of failing completely.

Use redundancy where business continuity requires it:

- Multiple instances
- Availability zones
- Replicated databases
- Multi-region deployments (when justified)

Related Rules: HTTP-002, MSG-004.

---

# Additional Engineering Guidance

The following guidance is established practice but is not a numbered rule in `docs/00-rule-catalog.md` — do not cite it with a rule ID.

## Infrastructure Is Reproducible and Deployments Are Automated

Prefer Infrastructure as Code (Terraform, Bicep, CloudFormation, Pulumi) over manual production configuration, and automate deployments with CI/CD, GitOps, automated rollback, and deployment validation.

## Containers Must Be Immutable

Containers should be built once and promoted across environments. Avoid modifying running containers.

## Secrets Must Never Be Stored in Images

Container images must not contain passwords, API keys, certificates, or tokens. Retrieve secrets securely at runtime. See SEC-004.

## Observe Everything

Cloud-native applications must expose logs, metrics, and traces. See the Observability domain.

## Cost Is an Architectural Concern

Review compute utilization, storage growth, network traffic, and idle resources. Optimize based on measurable business value.

## Use Managed Services Intentionally

Managed services reduce operational overhead but are not automatically the correct choice — evaluate cost, vendor lock-in, operational complexity, and team expertise.

## Security Follows Identity

Prefer identity-based authentication between services (Managed Identity, IAM Roles, Workload Identity) to reduce reliance on long-lived secrets. See the Security domain.

## Cloud Portability Is a Business Decision

Portability has a cost. Do not pursue multi-cloud strategies without measurable business justification — optimize for business value, not architectural purity.

---

# Common Cloud Smells

- Stateful containers
- Manual deployments
- Hardcoded configuration
- Secrets inside images
- Single instance production services
- Missing health probes
- No observability
- No autoscaling strategy
- Ignoring cloud costs

---

# Cloud Review Checklist

- Is the application stateless?
- Is infrastructure reproducible?
- Is configuration externalized?
- Are containers immutable?
- Are health probes implemented?
- Is observability available?
- Is scaling strategy appropriate?
- Are secrets protected?
- Are deployments automated?
- Are cloud costs reviewed?

---

# Recommended Stack

- Docker
- Kubernetes
- Azure App Service
- Azure Kubernetes Service (AKS)
- Amazon ECS / EKS
- Google Kubernetes Engine (GKE)
- Terraform
- Pulumi
- GitHub Actions
- Azure DevOps
- OpenTelemetry
- Prometheus
- Grafana

---

# References

- Microsoft Cloud Design Patterns
- Azure Architecture Center
- AWS Well-Architected Framework
- Google Cloud Architecture Framework
- Kubernetes Documentation
- The Twelve-Factor App
