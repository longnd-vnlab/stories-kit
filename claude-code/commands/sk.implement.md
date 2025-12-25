---
description: Execute tasks for a sub-story
---

## User Input

```text
$ARGUMENTS
```

User input: story number or "all" for entire epic.

## Outline

1. **Identify target**:
   - Parse story number from input
   - If "all": execute all stories in dependency order
   - Locate `tasks.md` in story directory

2. **Pre-flight checks**:

   a. **Verify prerequisites**:
      - All dependent stories completed?
      - Required files exist?
      - Dependencies installed?

   b. **Check principles**:
      - Read `.stories/principles.md`
      - Will apply during implementation

   c. **Brownfield checks** (if context.md exists):
      - Conventions to follow
      - Files to be careful with
      - Integration points

3. **Execute tasks**:

   **For each task in order**:
   
   a. Check dependencies satisfied
   
   b. If `[P]` marked and no file conflicts:
      - Can batch with other [P] tasks
   
   c. Implement the task:
      - Create/modify file at specified path
      - Follow project conventions
      - Apply principles
   
   d. Mark task complete:
      - Change `- [ ]` to `- [x]`
      - Add completion timestamp as comment
   
   e. Report progress:
      ```
      ✅ [T01] Created project structure
      ✅ [T02] [P] Created User model
      ✅ [T03] [P] Created User types
      🔄 [T04] Implementing UserService...
      ```

4. **Error handling**:
   - If task fails: STOP, report error, suggest fix
   - For [P] tasks: continue others, report failed ones
   - Never skip non-[P] tasks

5. **Post-task validation**:
   - Syntax check (if applicable)
   - Import/dependency check
   - Run tests (if exist and requested)

6. **Story completion**:

   When all tasks done:
   
   a. Validate acceptance criteria:
      - Check each criterion in tasks.md
      - Mark as met or not met
   
   b. Update story status:
      ```markdown
      ## Completion
      **Completed**: [DATE]
      **All tasks**: ✅
      **Acceptance criteria**: [X/Y met]
      ```
   
   c. Report summary:
      ```
      ✅ Story [NN] Complete!
      
      Tasks: 9/9 completed
      Acceptance: 3/3 criteria met
      Files created: 5
      Files modified: 2
      
      Next: /sk.breakdown [next-story] or /sk.implement [next-story]
      ```

7. **Epic completion** (if all stories done):
   - Update epic's story.md status
   - Generate completion report
   - Suggest cleanup/documentation tasks

## Progress File

Create/update `.stories/epics/[epic]/progress.md`:

```markdown
# Progress: [Epic Name]

## Stories

| Story | Status | Tasks | Completed |
|-------|--------|-------|-----------|
| 01-setup | ✅ Done | 5/5 | 2024-01-15 |
| 02-models | 🔄 In Progress | 3/7 | - |
| 03-api | ⏳ Pending | 0/6 | - |

## Timeline
- Started: [DATE]
- Current: Story 02
- Estimated completion: [DATE]

## Blockers
- [None / List blockers]
```

## Key Rules

- Never skip tasks (except [P] on failure)
- Always mark completed tasks in tasks.md
- Validate after each task
- Follow project conventions strictly
- Report progress clearly
- Stop on critical errors
