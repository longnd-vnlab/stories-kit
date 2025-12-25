#!/bin/bash
# Stories Kit Installer
# Usage: ./install.sh /path/to/project

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${1:-.}"

# Resolve absolute path
TARGET_DIR="$(cd "$TARGET_DIR" 2>/dev/null && pwd)" || {
    echo -e "${RED}Error: Directory '$1' does not exist${NC}"
    exit 1
}

echo -e "${BLUE}🚀 Stories Kit Installer${NC}"
echo -e "Target: ${GREEN}$TARGET_DIR${NC}"
echo ""

# Detect project type
detect_project() {
    if [ -f "$TARGET_DIR/package.json" ]; then
        echo "nodejs"
    elif [ -f "$TARGET_DIR/requirements.txt" ] || [ -f "$TARGET_DIR/pyproject.toml" ]; then
        echo "python"
    elif [ -f "$TARGET_DIR/go.mod" ]; then
        echo "go"
    elif [ -f "$TARGET_DIR/Cargo.toml" ]; then
        echo "rust"
    elif [ -f "$TARGET_DIR/pom.xml" ] || [ -f "$TARGET_DIR/build.gradle" ]; then
        echo "java"
    elif [ -f "$TARGET_DIR/*.csproj" ] 2>/dev/null; then
        echo "dotnet"
    else
        echo "unknown"
    fi
}

PROJECT_TYPE=$(detect_project)
echo -e "Detected project type: ${YELLOW}$PROJECT_TYPE${NC}"

# Check if brownfield (existing code)
IS_BROWNFIELD=false
if [ -d "$TARGET_DIR/src" ] || [ -d "$TARGET_DIR/lib" ] || [ -d "$TARGET_DIR/app" ]; then
    IS_BROWNFIELD=true
    echo -e "Project mode: ${YELLOW}Brownfield (existing codebase)${NC}"
else
    echo -e "Project mode: ${YELLOW}Greenfield (new project)${NC}"
fi

# Create directory structure
echo -e "\n${BLUE}Creating Stories Kit structure...${NC}"

mkdir -p "$TARGET_DIR/.stories/templates"
mkdir -p "$TARGET_DIR/.stories/epics"
mkdir -p "$TARGET_DIR/.claude/commands"

# Copy templates
cp -r "$SCRIPT_DIR/templates/"* "$TARGET_DIR/.stories/templates/"

# Copy commands
cp -r "$SCRIPT_DIR/commands/"* "$TARGET_DIR/.claude/commands/"

# Create principles.md
cat > "$TARGET_DIR/.stories/principles.md" << 'EOF'
# Project Principles

## Code Quality
- [ ] Follow existing conventions
- [ ] Write tests for new features
- [ ] Document public APIs

## Architecture
- [ ] Keep components loosely coupled
- [ ] Prefer composition over inheritance
- [ ] Single responsibility principle

## Performance
- [ ] No premature optimization
- [ ] Profile before optimizing
- [ ] Consider scalability

## Security
- [ ] Validate all inputs
- [ ] No secrets in code
- [ ] Principle of least privilege

---
*Customize these principles for your project*
EOF

# Create context.md for brownfield
if [ "$IS_BROWNFIELD" = true ]; then
    cat > "$TARGET_DIR/.stories/context.md" << EOF
# Project Context

**Generated**: $(date +%Y-%m-%d)
**Type**: $PROJECT_TYPE

## Structure
\`\`\`
$(cd "$TARGET_DIR" && find . -type d -maxdepth 2 | grep -v '.git' | grep -v 'node_modules' | grep -v '__pycache__' | head -20)
\`\`\`

## Tech Stack
- **Type**: $PROJECT_TYPE
- **Dependencies**: *Run /sk.context to analyze*

## Conventions
- *Run /sk.context to detect patterns*

## Integration Points
- *Run /sk.context to identify*

---
*This file is auto-updated by /sk.context*
EOF
fi

# Update .gitignore
if [ -f "$TARGET_DIR/.gitignore" ]; then
    if ! grep -q ".stories/epics" "$TARGET_DIR/.gitignore"; then
        echo -e "\n# Stories Kit\n.stories/epics/*/verify.md" >> "$TARGET_DIR/.gitignore"
    fi
fi

echo -e "${GREEN}✅ Stories Kit installed successfully!${NC}"
echo ""
echo -e "${BLUE}Next steps:${NC}"
if [ "$IS_BROWNFIELD" = true ]; then
    echo "  1. Run Claude Code in your project"
    echo "  2. Use /sk.context to analyze codebase"
    echo "  3. Use /sk.story to create your first epic"
else
    echo "  1. Run Claude Code in your project"
    echo "  2. Use /sk.story to create your first epic"
fi
echo ""
echo -e "${YELLOW}Available commands:${NC}"
echo "  /sk.context   - Analyze existing codebase"
echo "  /sk.story     - Create new epic/user story"
echo "  /sk.verify    - Clarify requirements"
echo "  /sk.impact    - Assess impact (brownfield)"
echo "  /sk.plan      - Create technical plan"
echo "  /sk.breakdown - Break into tasks"
echo "  /sk.implement - Execute tasks"
