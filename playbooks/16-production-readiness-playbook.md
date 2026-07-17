# Production Readiness Playbook

> Step-by-step guidance for executing a full Production Readiness process using the Engineering Assessment Framework.

---

## Purpose

This playbook provides repeatable execution guidance for conducting a complete Production Readiness process, from engineering reviews through to the formal production deployment decision.

It answers: How should the full production readiness process be executed?

This playbook is the master coordination guide. It orchestrates all domain reviews, scorecards, the production readiness assessment, and the production certification into a coherent, end-to-end process.

---

## Audience

- Software Architects
- Engineering Managers
- Release Managers
- Technical Leads
- SRE and Platform Engineers

---

## Prerequisites

- A software system ready for production readiness evaluation.
- Access to the source repository.
- Access to infrastructure configuration and deployment pipeline.
- A designated Lead Reviewer.
- A designated Release Manager.
- Commitment from stakeholders to address blocking findings.

---

## When to Execute

- Before the first production deployment of a new system.
- Before a major version release.
- After significant architectural or infrastructure changes.
- When a system is being moved between environments (staging → production).

---

## Estimated Duration

| System Size | Estimated Duration |
|-------------|-------------------|
| Small | 1–2 days |
| Medium | 3–5 days |
| Large | 1–2 weeks |

Duration depends on team responsiveness to findings and complexity of remediation.

---

## Preparation

1. Read `framework/ENGINEERING-ASSESSMENT-FRAMEWORK.md`.
2. Read `reviews/16-production-readiness.md` to understand the full scope.
3. Assign a reviewer or review team to each domain.
4. Confirm access to: source code, infrastructure config, CI/CD pipelines, observability dashboards.
5. Set a target release date and work backwards to define the review schedule.

---

## Phase 1 — Domain Reviews

Execute all applicable domain reviews.

Prioritize in this order based on production risk:

| Priority | Review | Playbook |
|----------|--------|---------|
| 1 | Security | playbooks/08-security-review-playbook.md |
| 2 | Architecture | playbooks/01-architecture-review-playbook.md |
| 3 | Database | playbooks/02-database-review-playbook.md |
| 4 | Observability | playbooks/06-observability-review-playbook.md |
| 5 | DevOps & CI/CD | playbooks/10-devops-review-playbook.md |
| 6 | Cloud Infrastructure | playbooks/09-cloud-review-playbook.md |
| 7 | Performance | playbooks/03-performance-review-playbook.md |
| 8 | Platform (ASP.NET Core) | playbooks/05-platform-review-playbook.md |
| 9 | Testing | playbooks/11-testing-review-playbook.md |
| 10 | HTTP | playbooks/04-http-review-playbook.md |
| 11 | Messaging | playbooks/07-messaging-review-playbook.md |
| 12 | API Design | playbooks/14-api-design-review-playbook.md |
| 13 | Domain & DDD | playbooks/13-domain-ddd-review-playbook.md |
| 14 | Code Quality | playbooks/12-code-quality-review-playbook.md |
| 15 | Engineering Governance | playbooks/15-engineering-governance-review-playbook.md |

Not all domain reviews are required for every release. Scope the reviews based on what has changed.

**Output:** Completed review checklists in `reviews/`.

---

## Phase 2 — Scorecard Completion

For each completed domain review, complete the corresponding scorecard.

Scorecards consolidate review evidence into capability grades.

**Output:** Completed scorecards in `scorecards/`.

---

## Phase 3 — Address Blockers

Before proceeding to the Production Readiness Assessment:

1. Compile all Critical and High severity findings from all reviews.
2. Determine which findings are release blockers.
3. Present blockers to the engineering team and release manager.
4. Allow engineering team to remediate blockers or formally accept residual risk.
5. Document risk acceptance decisions with the responsible owner.

Do not proceed to Phase 4 while unresolved Critical findings exist unless formally accepted.

---

## Phase 4 — Production Readiness Assessment

Execute the Production Readiness Assessment.

Reference: `assessments/01-production-readiness-assessment.md`

The assessment consolidates all scorecard evidence and produces the formal deployment decision.

Steps within the assessment:

1. Complete the Capability Summary from scorecard grades.
2. Evaluate each Production Gate using scorecard evidence.
3. Document all remaining release blockers and conditions.
4. Assess overall production confidence.
5. Issue the formal decision: GO, GO WITH CONDITIONS, DEFER RELEASE, or NO-GO.

**Output:** Completed production readiness assessment with a formal decision.

---

## Phase 5 — Approval and Certification

If the Production Readiness Assessment concludes with GO or GO WITH CONDITIONS:

1. Obtain approvals from all required stakeholders (engineering, security, QA, operations, release manager, product owner).
2. Complete the Production Certification.

Reference: `certifications/01-production-certification.md`

**Output:** Signed Production Certification.

---

## Phase 6 — Release Execution

After certification:

1. Execute the automated deployment pipeline.
2. Monitor observability dashboards for the first 30–60 minutes post-deployment.
3. Verify that all health checks pass.
4. Confirm that key business metrics and error rates are within expected ranges.
5. Keep rollback capability on standby for the first 24 hours.

---

## Release Gate Summary

| Gate | Satisfied When |
|------|---------------|
| All applicable domain reviews completed | All checklist items evaluated |
| All Critical findings resolved or accepted | No unresolved Critical blockers |
| All production readiness gates passed | Assessment gates all PASS |
| Formal decision issued | GO or GO WITH CONDITIONS |
| All approvals obtained | Approval matrix complete |
| Production Certification issued | Certification signed |

---

## Scope Guidance

Not every review is required for every release.

| Change Type | Recommended Reviews |
|-------------|---------------------|
| Infrastructure change only | Cloud, DevOps, Observability |
| Database schema change | Database, Performance |
| New API endpoint | API Design, Security, HTTP |
| New authentication mechanism | Security, Platform |
| Full release | All applicable reviews |

---

## Escalation Path

If a Critical finding cannot be remediated before the release date:

1. The Lead Reviewer escalates to the Engineering Manager.
2. The Engineering Manager and Product Owner jointly decide to delay the release or formally accept the risk.
3. The risk acceptance is documented in the Production Readiness Assessment.
4. Risk acceptance above a defined severity threshold requires CTO sign-off.

---

## Output

Upon completion of the process, the following artifacts are produced:

- Completed domain review checklists.
- Completed domain scorecards.
- Completed Production Readiness Assessment with formal decision.
- Signed Production Certification (if GO or GO WITH CONDITIONS).

---

## Quality Checklist

- ☐ All in-scope domain reviews are completed.
- ☐ All Critical and High findings are addressed or formally accepted.
- ☐ All production readiness gates are evaluated.
- ☐ Formal decision is documented with rationale.
- ☐ All required approvals are obtained.
- ☐ Production Certification is signed.
- ☐ Rollback procedure is confirmed before release execution.

---

## Related Documents

- reviews/16-production-readiness.md
- assessments/01-production-readiness-assessment.md
- certifications/01-production-certification.md
- scorecards/17-engineering-scorecard.md
- framework/ENGINEERING-ASSESSMENT-FRAMEWORK.md

---

## Future Enhancements

Future versions of this playbook may include:

- Automated review scope detection based on git diff.
- Progressive delivery and canary release guidance.
- Post-release review process.
- Continuous production certification with SLO-based validity.
- Integration with project management tools for finding tracking.
