# DevOps & CI/CD Review Playbook

> Step-by-step guidance for executing a DevOps and CI/CD Compliance Review.

---

## Purpose

This playbook provides repeatable execution guidance for conducting a DevOps and CI/CD Compliance Review using the Engineering Assessment Framework.

It answers: How should this review be executed?

---

## Audience

- Software Architects
- Platform Engineers
- DevOps Engineers
- Technical Leads

---

## Prerequisites

- Access to the CI/CD pipeline configuration (GitHub Actions, Azure DevOps, GitLab CI, or equivalent).
- Access to the source repository.
- Familiarity with `reviews/10-devops-cicd-review.md`.

---

## When to Execute

- Before production deployment of a new system.
- When deployment failures or instability are reported.
- As part of a production readiness process.
- When the CI/CD pipeline is significantly changed.

---

## Estimated Duration

| System Size | Estimated Duration |
|-------------|-------------------|
| Small | 1–2 hours |
| Medium | 2–4 hours |
| Large | 4–6 hours |

---

## Preparation

1. Open `reviews/10-devops-cicd-review.md` as the working document.
2. Locate all pipeline definition files (`.github/workflows/`, `azure-pipelines.yml`, `.gitlab-ci.yml`).
3. Identify: build pipeline, test pipeline, deployment pipeline, environment promotion strategy.
4. Request deployment history or recent pipeline run results if available.

---

## Execution Steps

### Step 1 — Evaluate Build Pipeline

- Verify that the build is automated and triggered on every push or pull request.
- Check that the build compiles from a clean state without manual steps.
- Verify that build artifacts are versioned and immutable.
- Check that the build stage does not deploy.

### Step 2 — Evaluate Test Automation

- Verify that unit and integration tests run automatically in the pipeline.
- Check that test failures block the build — failed tests cannot be bypassed.
- Verify that test results are reported and visible in the pipeline output.
- Check that the pipeline does not proceed to deployment when tests fail.

### Step 3 — Evaluate Deployment Automation

- Verify that deployments to all environments (staging, production) are automated.
- Check that no manual steps are required for a standard deployment.
- Verify that deployment scripts are version-controlled alongside application code.
- Check that environment-specific configuration is injected at deployment time, not baked into artifacts.

### Step 4 — Evaluate Environment Promotion

- Verify that changes flow through a defined promotion path (dev → staging → production).
- Check that production deployments require approval or gating criteria.
- Verify that environment parity is maintained — staging uses the same artifact as production.

### Step 5 — Evaluate Rollback Capability

- Verify that a rollback procedure is defined and documented.
- Check that rolling back to a previous version can be executed without a new build.
- Verify that database migration rollback is addressed in the deployment process.

### Step 6 — Evaluate Security in the Pipeline

- Check that secrets and credentials are stored in the pipeline secrets store, not in pipeline YAML files.
- Verify that dependency scanning (SAST, SCA) is part of the pipeline.
- Check that container images are scanned for vulnerabilities before deployment.

### Step 7 — Evaluate Observability of the Pipeline

- Verify that pipeline failures generate notifications to the responsible team.
- Check that deployment events are logged and traceable.
- Verify that deployment history is available for audit.

### Step 8 — Document Findings

- Record each finding with evidence (pipeline file, step name), applicable concern, and severity.

---

## Evidence Collection Guide

| Evidence Type | Where to Find |
|---------------|--------------|
| Build pipeline | `.github/workflows/`, `azure-pipelines.yml` |
| Test execution | Test step in pipeline, test result artifacts |
| Deployment automation | Deploy jobs, scripts, Helm upgrade commands |
| Secrets management | Repository secrets, pipeline variable groups |
| Rollback procedure | Runbooks, pipeline rollback jobs, documentation |
| Security scanning | Dependency review actions, container scan steps |

---

## Common Findings

- Tests run in the pipeline but failures do not block deployment.
- Production deployment has no approval gate.
- Secrets stored as plain text in pipeline YAML files.
- Rollback requires a new manual build instead of re-deploying a previous artifact.
- No environment promotion — code deploys directly from feature branch to production.
- Deployment configuration (connection strings, endpoints) baked into the artifact.

---

## Red Flags

- Pipeline contains `continue-on-error: true` on test steps.
- AWS access keys or database passwords committed to pipeline YAML.
- No staging environment — code goes directly from development to production.
- No documented rollback procedure.
- Manual steps required for every production deployment.

---

## Output

Upon completion, the reviewer produces:

1. A completed `reviews/10-devops-cicd-review.md`.
2. An Executive Summary describing pipeline maturity and deployment reliability.
3. Prioritized recommendations.

---

## Quality Checklist

- ☐ Every environment has an automated deployment path.
- ☐ Test failure blocking is explicitly verified.
- ☐ Secrets handling in the pipeline is reviewed.
- ☐ Rollback capability is confirmed.
- ☐ Positive findings are documented.
- ☐ Executive Summary is complete.

---

## Related Documents

- reviews/10-devops-cicd-review.md
- scorecards/10-devops-cicd-scorecard.md

---

## Future Enhancements

Future versions of this playbook may include:

- DORA metrics measurement guidance.
- GitOps review checklist.
- Supply chain security (SLSA) review guidance.
- Feature flag deployment review.
