---
description: Break a sub-story into actionable tasks
---

## User Input

```text
$ARGUMENTS
```

User input: story number (e.g., "1" or "01") or story name.

## Outline

1. **Identify target story**:
   - Parse user input for story number/name
   - Find epic from most recent or specified
   - Locate story in `.stories/epics/[epic]/stories/[NN]-[name]/`

2. **Load context**:
   - Read epic's `plan.md` for tech stack and architecture
   - Read story's acceptance criteria from plan.md
   - Read `.stories/context.md` (if brownfield)
   - Read `impact.md` (if exists)

3. **Generate tasks**:

   **Task format** (REQUIRED):
   ```
   - [ ] [TNN] [P?] Description | file: path/to/file
   ```
   
   - `[TNN]`: Task ID (T01, T02, T03...)
   - `[P]`: Parallel marker (can run with other [P] tasks)
   - `file:`: Target file path

4. **Task categories**:

   a. **Setup tasks** (if first story):
      - Project initialization
      - Dependencies installation
      - Configuration files

   b. **Model/Schema tasks**:
      - Database models
      - Type definitions
      - Validation schemas

   c. **Service/Logic tasks**:
      - Business logic
      - Data processing
      - External integrations

   d. **API/Controller tasks**:
      - Endpoints
      - Request handlers
      - Middleware

   e. **UI tasks** (if applicable):
      - Components
      - Pages/Views
      - Styling

   f. **Test tasks** (if requested):
      - Unit tests
      - Integration tests

5. **Generate `tasks.md`**:

```markdown
# Tasks: Story [NN] - [Name]

**Epic**: [epic-name]
**Story**: [story-name]
**Created**: [DATE]

## Acceptance Criteria
- [ ] [From plan.md]
- [ ] [From plan.md]

## Tasks

### Setup
- [ ] [T01] Initialize story structure | file: [path]

### Models
- [ ] [T02] [P] Create [Model] schema | file: src/models/[name].ts
- [ ] [T03] [P] Create [Model] types | file: src/types/[name].ts

### Services
- [ ] [T04] Implement [Service] | file: src/services/[name].ts
  - Depends on: T02, T03

### API
- [ ] [T05] [P] Create [endpoint] route | file: src/routes/[name].ts
- [ ] [T06] [P] Create [endpoint] controller | file: src/controllers/[name].ts
  - Depends on: T04

### UI (if applicable)
- [ ] [T07] Create [Component] | file: src/components/[name].tsx
  - Depends on: T05, T06

### Tests (if requested)
- [ ] [T08] [P] Unit tests for [Service] | file: tests/[name].test.ts
- [ ] [T09] Integration test for [endpoint] | file: tests/integration/[name].test.ts

## Execution Order

```
T01 (Setup)
 │
 ├── T02 [P] ──┐
 │             ├── T04 ── T05 [P] ──┐
 └── T03 [P] ──┘         T06 [P] ──┼── T07
                                   │
                         T08 [P] ──┘
                         T09
```

## Parallel Opportunities
- T02, T03 can run together
- T05, T06 can run together
- T08 can run with UI tasks

## Estimated Effort
- Total tasks: [N]
- Parallel batches: [N]
- Estimated time: [X hours/days]

---
*Next: Run `/sk.implement [story-number]` to execute*
```

6. **Report**:
   - Tasks created
   - Parallel opportunities
   - Execution order
   - Suggest: `/sk.implement [story-number]`

## Key Rules

- Every task must have a file path
- Tasks affecting same file must be sequential
- Mark parallelizable tasks with [P]
- Keep tasks atomic (1 clear outcome)
- Include dependencies explicitly
