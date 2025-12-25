# 🚀 Stories Kit

Story-Driven Development toolkit for AI coding assistants.

## Variants

| Folder | For | Install |
|--------|-----|---------|
| `claude-code/` | Claude Code | Slash commands (`/sk.story`, `/sk.plan`, etc.) |
| `kiro-dev/` | Kiro Dev | Steering file (type `sk.story`, `sk.plan` in chat) |

## Installation

### Claude Code
```bash
cd claude-code
./install.sh /path/to/your/project
```

### Kiro Dev
```bash
cd kiro-dev
./install.sh /path/to/your/project
```

## Workflow

```
sk.story → sk.verify → sk.impact → sk.plan → sk.breakdown → sk.implement
```

| Command | Description |
|---------|-------------|
| `sk.story` | Create epic/user story |
| `sk.verify` | Clarify requirements |
| `sk.impact` | Analyze codebase impact |
| `sk.plan` | Create technical plan |
| `sk.breakdown` | Break into tasks |
| `sk.implement` | Execute tasks |

## License

MIT
