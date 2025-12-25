---
description: Assess impact of new feature on existing codebase (Brownfield projects)
---

## User Input

```text
$ARGUMENTS
```

## Outline

1. **Load context**:
   - Read `.stories/context.md` (run `/sk.context` if missing)
   - Read current epic's `story.md`
   - Read `.stories/principles.md`

2. **Analyze impact areas**:

   a. **Files to modify**:
      - Match story requirements to existing files
      - Identify: models, services, controllers, UI components
      - List specific file paths

   b. **Files to create**:
      - New components needed
      - Follow existing naming conventions
      - Suggest locations based on project structure

   c. **Dependencies**:
      - New packages needed?
      - Version conflicts?
      - Security implications?

   d. **Database changes**:
      - New tables/collections?
      - Schema migrations needed?
      - Data backfill required?

   e. **API changes**:
      - New endpoints?
      - Breaking changes to existing?
      - Versioning needed?

3. **Risk assessment**:

| Risk | Level | Mitigation |
|------|-------|------------|
| Breaking changes | High/Med/Low | [Strategy] |
| Data migration | High/Med/Low | [Strategy] |
| Performance | High/Med/Low | [Strategy] |
| Security | High/Med/Low | [Strategy] |

4. **Generate `impact.md`**:

```markdown
# Impact Analysis: [Epic Name]

**Date**: [DATE]
**Epic**: [Link to story.md]

## Summary
[1-2 sentences overview]

## Files Affected

### Modify
| File | Changes | Risk |
|------|---------|------|
| [path] | [description] | Low/Med/High |

### Create
| File | Purpose |
|------|---------|
| [path] | [description] |

## Database Changes
- [ ] Migration needed: [Yes/No]
- [ ] Tables affected: [list]
- [ ] Backfill required: [Yes/No]

## API Changes
- [ ] New endpoints: [list]
- [ ] Modified endpoints: [list]
- [ ] Breaking changes: [Yes/No]

## Dependencies
| Package | Version | Reason |
|---------|---------|--------|
| [name] | [version] | [why needed] |

## Risk Matrix

| Area | Risk | Impact | Mitigation |
|------|------|--------|------------|
| [area] | High/Med/Low | [description] | [strategy] |

## Recommendations
1. [Recommendation 1]
2. [Recommendation 2]

## Checklist Before Implementation
- [ ] Database backup plan ready
- [ ] Rollback strategy defined
- [ ] Feature flag considered
- [ ] Affected tests identified

---
*Next: Run `/sk.plan` to create technical plan*
```

5. **Report**:
   - Impact summary
   - High-risk areas
   - Recommendations
   - Suggest: `/sk.plan`

## Key Rules

- Be conservative with risk assessment
- Always suggest rollback strategy for high-risk changes
- Consider feature flags for risky features
- Flag any breaking changes prominently
