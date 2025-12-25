# Technical Plan Template

**Epic**: [Link to story.md]
**Created**: [DATE]
**Status**: Draft | Approved | In Progress | Done

## Tech Stack

| Layer | Technology | Version | Rationale |
|-------|------------|---------|-----------|
| Language | | | |
| Framework | | | |
| Database | | | |
| Testing | | | |
| Build | | | |

## Architecture Overview

```
[ASCII diagram or description]
```

## Sub-Stories

### Story 1: [Name]

**Goal**: [What this delivers]
**Priority**: P1 | P2 | P3
**Depends on**: None | Story N

**Acceptance Criteria**:
- [ ] [Criterion 1]
- [ ] [Criterion 2]

**Components**:
- [Component/file 1]
- [Component/file 2]

---

### Story 2: [Name]

**Goal**: [What this delivers]
**Priority**: P1 | P2 | P3
**Depends on**: Story 1

**Acceptance Criteria**:
- [ ] [Criterion 1]

**Components**:
- [Component/file 1]

---

## Dependency Graph

```
Story 1 (Foundation)
    │
    ├── Story 2 [P]
    │
    └── Story 3 [P]
            │
            └── Story 4
```

## File Structure

```
src/
├── models/
├── services/
├── controllers/
└── ...
```

## Integration Points

- [How this connects to existing systems]
- [External APIs/services]

## Testing Strategy

| Type | Tool | Coverage Target |
|------|------|-----------------|
| Unit | | |
| Integration | | |
| E2E | | |

## Risks & Mitigations

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| | Low/Med/High | Low/Med/High | |

## Timeline Estimate

| Story | Effort | Dependencies |
|-------|--------|--------------|
| Story 1 | X days | None |
| Story 2 | X days | Story 1 |

---

*Created by `/sk.plan` - Next: `/sk.breakdown 1`*
