#!/bin/bash
# Stories Kit Installer for Kiro Dev
# Usage: ./install.sh /path/to/project

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${1:-.}"

TARGET_DIR="$(cd "$TARGET_DIR" 2>/dev/null && pwd)" || {
    echo "Error: Directory '$1' does not exist"
    exit 1
}

echo "🚀 Stories Kit Installer (Kiro Dev)"
echo "Target: $TARGET_DIR"

# Create structure
mkdir -p "$TARGET_DIR/.stories/templates"
mkdir -p "$TARGET_DIR/.stories/epics"
mkdir -p "$TARGET_DIR/.kiro/docs"

# Copy templates
cp -r "$SCRIPT_DIR/templates/"* "$TARGET_DIR/.stories/templates/"

# Create steering file for Kiro Dev
cat > "$TARGET_DIR/.kiro/steering.md" << 'EOF'
# Stories Kit - Story-Driven Development

## Workflow Commands
When user mentions these keywords, execute the corresponding workflow:

### sk.story
Create a new epic/user story:
1. Ask for epic name and description
2. Create folder: `.stories/epics/<epic-name>/`
3. Create `story.md` using template from `.stories/templates/story-template.md`

### sk.verify
Clarify requirements:
1. Read the current epic's `story.md`
2. Ask clarifying questions about requirements
3. Save Q&A to `verify.md` in the epic folder

### sk.impact
Analyze impact on existing codebase:
1. Analyze which files/modules will be affected
2. Identify dependencies and risks
3. Save analysis to `impact.md` in the epic folder

### sk.plan
Create technical plan:
1. Read story.md and verify.md
2. Create technical approach with sub-stories
3. Save to `plan.md` using `.stories/templates/plan-template.md`

### sk.breakdown
Break sub-story into tasks:
1. Select a sub-story from plan.md
2. Create detailed tasks with acceptance criteria
3. Save to `stories/<sub-story>/tasks.md`

### sk.implement
Execute tasks:
1. Read current tasks.md
2. Implement one task at a time
3. Mark completed tasks with [x]

## Project Structure
```
.stories/
├── templates/
├── principles.md
└── epics/
    └── <epic-name>/
        ├── story.md
        ├── verify.md
        ├── impact.md
        ├── plan.md
        └── stories/
            └── <sub-story>/
                └── tasks.md
```
EOF

# Create principles.md
cat > "$TARGET_DIR/.stories/principles.md" << 'EOF'
# Project Principles

## Code Quality
- Follow existing conventions
- Write tests for new features
- Document public APIs

## Architecture
- Keep components loosely coupled
- Single responsibility principle
EOF

echo "✅ Stories Kit installed for Kiro Dev!"
echo ""
echo "Usage in Kiro Dev:"
echo "  Just type these in chat:"
echo "    sk.story     - Create epic/story"
echo "    sk.verify    - Clarify requirements"
echo "    sk.impact    - Assess impact"
echo "    sk.plan      - Technical plan"
echo "    sk.breakdown - Break into tasks"
echo "    sk.implement - Execute tasks"
