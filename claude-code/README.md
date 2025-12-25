# 🚀 Stories Kit

**Story-Driven Development** - Phát triển phần mềm theo hướng user story với cấu trúc phân cấp rõ ràng.

## Triết lý

```
Epic (User Story lớn)
├── Verify (Làm rõ requirements)
├── Impact (Đánh giá ảnh hưởng - Brownfield)
├── Plan (Kế hoạch kỹ thuật)
└── Stories (Sub-stories)
    ├── Story 1
    │   ├── Task 1.1
    │   └── Task 1.2
    └── Story 2
        └── ...
```

## Cài đặt

```bash
# Clone và chạy installer
git clone <repo-url> stories-kit
cd stories-kit
./install.sh /path/to/your/project
```

## Slash Commands

| Command | Mô tả |
|---------|-------|
| `/sk.context` | Phân tích codebase hiện tại (Brownfield) |
| `/sk.story` | Tạo user story / epic mới |
| `/sk.verify` | Làm rõ requirements, đặt câu hỏi |
| `/sk.impact` | Đánh giá ảnh hưởng lên codebase (Brownfield) |
| `/sk.plan` | Lập kế hoạch kỹ thuật + chia sub-stories |
| `/sk.breakdown` | Chia sub-story thành tasks |
| `/sk.implement` | Thực thi tasks |

## Flow

### Greenfield (Dự án mới)
```
/sk.story → /sk.verify → /sk.plan → /sk.breakdown → /sk.implement
```

### Brownfield (Dự án đang chạy)
```
/sk.context → /sk.story → /sk.verify → /sk.impact → /sk.plan → /sk.breakdown → /sk.implement
```

## Cấu trúc thư mục

```
.stories/
├── context.md              # Bản đồ dự án (Brownfield)
├── principles.md           # Nguyên tắc coding
├── templates/
│   ├── story-template.md
│   ├── plan-template.md
│   └── tasks-template.md
└── epics/
    └── 001-feature-name/
        ├── story.md        # Epic description
        ├── verify.md       # Clarifications
        ├── impact.md       # Impact analysis
        ├── plan.md         # Technical plan
        └── stories/
            ├── 01-sub-story/
            │   └── tasks.md
            └── 02-sub-story/
                └── tasks.md
```

## License

MIT
