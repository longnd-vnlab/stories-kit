---
description: Create technical implementation plan and break epic into sub-stories
---

## User Input

```text
$ARGUMENTS
```

User input contains tech stack preferences or constraints.

## Outline

1. **Load context**:
   - Read epic's `story.md` and `verify.md`
   - Read `.stories/context.md` (if brownfield)
   - Read `.stories/principles.md`
   - Read `impact.md` (if exists)

2. **Determine constraints**:
   - **Brownfield**: MUST use existing tech stack from context.md
   - **Greenfield**: Use user's tech preferences from input
   - Apply principles.md guidelines

3. **Research phase** (if needed):
   - Identify unknowns in tech choices
   - Research best practices for chosen stack
   - Document decisions with rationale

4. **Break into sub-stories**:
   - Analyze acceptance criteria from story.md
   - Group related functionality
   - Each sub-story should be:
     - Independently testable
     - Deliverable in 1-3 days
     - Has clear acceptance criteria

5. **Generate `plan.md`**:

```markdown
# Technical Plan: [Epic Name]

**Date**: [DATE]
**Epic**: [Link to story.md]

## Tech Stack

| Layer | Technology | Version | Rationale |
|-------|------------|---------|-----------|
| Frontend | [tech] | [ver] | [why] |
| Backend | [tech] | [ver] | [why] |
| Database | [tech] | [ver] | [why] |
| Testing | [tech] | [ver] | [why] |

## Architecture Overview
[Brief description or ASCII diagram]

## Sub-Stories

### Story 1: [Name]
**Goal**: [What this delivers]
**Acceptance**: 
- [ ] [Criterion 1]
- [ ] [Criterion 2]

**Components**:
- [Component 1]
- [Component 2]

---

### Story 2: [Name]
**Goal**: [What this delivers]
**Depends on**: Story 1
**Acceptance**:
- [ ] [Criterion 1]

**Components**:
- [Component 1]

---

## Dependency Graph

```
Story 1 (Foundation)
    │
    ├── Story 2 (can parallel)
    │
    └── Story 3 (can parallel)
            │
            └── Story 4 (depends on 2,3)
```

## File Structure

```
[proposed new files/folders]
```

## Integration Points
- [How this connects to existing code]

## Testing Strategy
- Unit: [approach]
- Integration: [approach]
- E2E: [approach if needed]

## Risks & Mitigations
| Risk | Mitigation |
|------|------------|
| [risk] | [strategy] |

---
*Next: Run `/sk.breakdown [story-number]` for each sub-story*
```

6. **Create sub-story directories**:
   ```
   .stories/epics/[epic]/stories/
   ├── 01-[story-name]/
   ├── 02-[story-name]/
   └── 03-[story-name]/
   ```

7. **Report**:
   - Plan created
   - Number of sub-stories
   - Dependency graph
   - Suggest: `/sk.breakdown 1` to start with first story

## Key Rules

- Brownfield: Never suggest changing existing tech stack
- Each sub-story must be independently testable
- Respect dependency order
- Keep sub-stories small (1-3 days work)
