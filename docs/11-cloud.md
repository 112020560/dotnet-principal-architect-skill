
# Cloud Rules

> *Cloud is an operating model, not merely a hosting location.*

---

# Purpose

This document defines engineering rules for designing, deploying and operating cloud-native .NET applications.

The objective is to build systems that are resilient, scalable, observable, secure and cost-efficient regardless of the chosen cloud provider.

These rules apply equally to Azure, AWS, Google Cloud and private Kubernetes environments.

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

# Rule CLOUD-001 — Design for Failure

**Severity:** Critical

Assume that:

- Instances fail
- Networks fail
- Dependencies become unavailable
- Storage may become temporarily inaccessible

Applications should degrade gracefully.

---

# Rule CLOUD-002 — Applications Should Be Stateless

Keep application instances disposable.

Persist state in external systems such as:

- Databases
- Object storage
- Distributed cache
- Message brokers

Stateless services scale more easily.

---

# Rule CLOUD-003 — Infrastructure Must Be Reproducible

Prefer Infrastructure as Code.

Examples:

- Terraform
- Bicep
- CloudFormation
- Pulumi

Avoid manual production configuration.

---

# Rule CLOUD-004 — Configuration Must Be Externalized

Do not embed environment-specific configuration in code.

Use:

- Environment variables
- Secret stores
- Configuration services

Configuration should change without recompilation.

---

# Rule CLOUD-005 — Containers Must Be Immutable

Containers should be built once and promoted across environments.

Avoid modifying running containers.

---

# Rule CLOUD-006 — Health Probes Are Operational Contracts

Implement:

- Liveness
- Readiness
- Startup probes

Health endpoints should accurately represent service state.

---

# Rule CLOUD-007 — Horizontal Scaling Is Preferred

Prefer scaling out before scaling up.

Applications should avoid relying on local memory or local files.

---

# Rule CLOUD-008 — Secrets Must Never Be Stored in Images

Container images must not contain:

- Passwords
- API keys
- Certificates
- Tokens

Retrieve secrets securely at runtime.

---

# Rule CLOUD-009 — Observe Everything

Cloud-native applications must expose:

- Logs
- Metrics
- Traces

Observability is required for operating distributed systems.

---

# Rule CLOUD-010 — Cost Is an Architectural Concern

Review:

- Compute utilization
- Storage growth
- Network traffic
- Idle resources

Optimize based on measurable business value.

---

# Rule CLOUD-011 — Resilience Requires Redundancy

Use redundancy where business continuity requires it.

Examples:

- Multiple instances
- Availability zones
- Replicated databases
- Multi-region deployments (when justified)

---

# Rule CLOUD-012 — Use Managed Services Intentionally

Managed services reduce operational overhead.

Evaluate:

- Cost
- Vendor lock-in
- Operational complexity
- Team expertise

Managed services are not automatically the correct choice.

---

# Rule CLOUD-013 — Deployments Must Be Automated

Every deployment should be repeatable.

Prefer:

- CI/CD
- GitOps
- Automated rollback
- Deployment validation

Avoid manual production deployments.

---

# Rule CLOUD-014 — Security Follows Identity

Prefer identity-based authentication between services.

Examples:

- Managed Identity
- IAM Roles
- Workload Identity

Reduce reliance on long-lived secrets.

---

# Rule CLOUD-015 — Cloud Portability Is a Business Decision

Portability has a cost.

Do not pursue multi-cloud strategies without measurable business justification.

Optimize for business value, not architectural purity.

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
