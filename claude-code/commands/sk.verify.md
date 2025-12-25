---
description: Clarify and verify user story requirements through structured questions
---

## User Input

```text
$ARGUMENTS
```

## Outline

1. **Load current epic**:
   - If user specifies epic: use that
   - Else: find most recent epic in `.stories/epics/`
   - Read `story.md`

2. **Extract open questions**:
   - Find all `[NEEDS CLARIFICATION: ...]` markers
   - Identify implicit ambiguities:
     - Vague scope boundaries
     - Undefined user types
     - Missing edge cases
     - Unclear success criteria

3. **Generate verification questions** (max 7):

```markdown
## Verification: [Epic Name]

### Q1: [Topic]
**Context**: [Quote from story.md]
**Question**: [Specific question]

| Option | Answer | Implications |
|--------|--------|--------------|
| A | [Answer 1] | [Impact] |
| B | [Answer 2] | [Impact] |
| C | [Answer 3] | [Impact] |
| Custom | Your answer | Specify details |

---

### Q2: [Topic]
...

---

**Your responses**: (e.g., "Q1: A, Q2: B, Q3: Custom - [details]")
```

4. **Wait for user responses**

5. **Update `story.md`**:
   - Replace `[NEEDS CLARIFICATION]` with answers
   - Add clarifications to new section:

```markdown
## Clarifications

| Question | Decision | Rationale |
|----------|----------|-----------|
| [Q1] | [Answer] | [Why] |
| [Q2] | [Answer] | [Why] |
```

6. **Create `verify.md`** in epic folder:
   - Full Q&A transcript
   - Timestamp
   - Any remaining open items

7. **Validate completeness**:
   - All `[NEEDS CLARIFICATION]` resolved?
   - Acceptance criteria testable?
   - Scope clearly bounded?

8. **Report**:
   - Questions answered
   - Story.md updated
   - Readiness for next step
   - Suggest: `/sk.impact` (brownfield) or `/sk.plan` (greenfield)

## Key Rules

- Questions should be answerable with options when possible
- Prioritize: Scope > Security > UX > Technical
- Don't ask about implementation details
- Maximum 3 iterations of clarification
