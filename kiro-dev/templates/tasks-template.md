# Tasks Template

**Epic**: [epic-name]
**Story**: [NN] - [story-name]
**Created**: [DATE]
**Status**: Pending | In Progress | Done

## Acceptance Criteria

- [ ] [Criterion from plan.md]
- [ ] [Criterion from plan.md]

## Tasks

### Setup
- [ ] [T01] [Description] | file: [path]

### Models / Types
- [ ] [T02] [P] [Description] | file: [path]
- [ ] [T03] [P] [Description] | file: [path]

### Services / Logic
- [ ] [T04] [Description] | file: [path]
  - Depends on: T02, T03

### API / Controllers
- [ ] [T05] [P] [Description] | file: [path]
- [ ] [T06] [P] [Description] | file: [path]
  - Depends on: T04

### UI / Components
- [ ] [T07] [Description] | file: [path]
  - Depends on: T05, T06

### Tests
- [ ] [T08] [P] [Description] | file: [path]
- [ ] [T09] [Description] | file: [path]

## Execution Order

```
T01
 │
 ├── T02 [P] ──┐
 │             ├── T04 ── T05 [P] ──┐
 └── T03 [P] ──┘         T06 [P] ──┼── T07
                                   │
                         T08 [P] ──┘
                         T09
```

## Task Format Reference

```
- [ ] [TNN] [P?] Description | file: path/to/file
```

- `[TNN]`: Sequential task ID (T01, T02...)
- `[P]`: Optional - marks task as parallelizable
- `file:`: Required - target file path

## Parallel Opportunities

- [List tasks that can run together]

## Estimated Effort

- Total tasks: [N]
- Parallel batches: [N]
- Estimated time: [X hours/days]

## Completion

**Completed**: [DATE or -]
**Tasks**: [X/Y]
**Acceptance**: [X/Y criteria met]

---

*Created by `/sk.breakdown` - Next: `/sk.implement [story-number]`*
