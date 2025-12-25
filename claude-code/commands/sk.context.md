---
description: Analyze existing codebase to understand structure, conventions, and integration points (Brownfield projects)
---

## User Input

```text
$ARGUMENTS
```

## Outline

1. **Scan project structure**:
   - List directories (max depth 3, exclude node_modules, .git, __pycache__, venv)
   - Identify main source directories (src/, lib/, app/, etc.)
   - Count files by extension

2. **Detect tech stack**:
   - Package files: package.json, requirements.txt, go.mod, Cargo.toml, pom.xml, *.csproj
   - Extract dependencies and versions
   - Identify frameworks (React, Django, Express, etc.)

3. **Analyze conventions**:
   - Naming patterns (camelCase, snake_case, kebab-case)
   - File organization (by feature, by type, by layer)
   - Test patterns (location, naming, framework)
   - Import/export patterns

4. **Identify integration points**:
   - API endpoints (routes, controllers)
   - Database models/schemas
   - External services (env vars, config files)
   - Shared utilities/helpers

5. **Update `.stories/context.md`** with findings:

```markdown
# Project Context

**Updated**: [DATE]
**Type**: [detected type]

## Tech Stack
- **Language**: [language + version]
- **Framework**: [framework + version]
- **Database**: [if detected]
- **Key Dependencies**: [list top 10]

## Structure
[directory tree]

## Conventions
- **Naming**: [pattern]
- **Organization**: [pattern]
- **Testing**: [framework, location]

## Integration Points
- **APIs**: [list endpoints/routes files]
- **Models**: [list model files]
- **Config**: [list config files]

## Notes
[any special observations]
```

6. **Report summary** to user with key findings.

## Key Rules

- Non-destructive: Only read, never modify existing code
- Focus on patterns, not implementation details
- Flag inconsistencies found in codebase
