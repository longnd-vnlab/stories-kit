---
description: Create a new user story (epic) from natural language description
---

## User Input

```text
$ARGUMENTS
```

You **MUST** use the user input as the feature description.

## Outline

1. **Parse feature description**:
   - Extract key concepts: actors, actions, goals, constraints
   - Generate short name (2-4 words, kebab-case)
   - Example: "user authentication with OAuth" → "oauth-user-auth"

2. **Determine epic number**:
   - Check `.stories/epics/` for existing epics
   - Find highest number N, use N+1
   - Format: `001-short-name`, `002-short-name`

3. **Create epic directory**:
   ```
   .stories/epics/[NNN]-[short-name]/
   ├── story.md
   └── stories/
   ```

4. **Generate `story.md`** using template:

```markdown
# Epic: [Title]

**ID**: [NNN]-[short-name]
**Created**: [DATE]
**Status**: Draft

## Vision
[1-2 sentences: What and Why]

## User Story
As a [actor],
I want to [action],
So that [benefit].

## Acceptance Criteria
- [ ] [Criterion 1]
- [ ] [Criterion 2]
- [ ] [Criterion 3]

## Scope

### In Scope
- [Feature 1]
- [Feature 2]

### Out of Scope
- [Excluded 1]
- [Excluded 2]

## Success Metrics
- [Measurable outcome 1]
- [Measurable outcome 2]

## Open Questions
- [NEEDS CLARIFICATION: Question 1]
- [NEEDS CLARIFICATION: Question 2]

---
*Next: Run `/sk.verify` to clarify open questions*
```

5. **Report**:
   - Epic path created
   - Summary of extracted requirements
   - Number of open questions
   - Suggest next step: `/sk.verify`

## Key Rules

- Focus on WHAT and WHY, not HOW
- Maximum 5 `[NEEDS CLARIFICATION]` markers
- Keep scope bounded and realistic
- Success metrics must be measurable
