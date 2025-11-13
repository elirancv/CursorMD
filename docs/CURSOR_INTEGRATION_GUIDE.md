# Cursor Integration Guide

Short guide for users working with the Project Documentation Architect inside Cursor IDE.

## Overview

This guide explains how to use the Project Documentation Architect system within Cursor IDE, including how to request documents, refine outputs, switch modes, and understand how `.mdc` rules work.

## Quick Start

### 1. Installation

**Already Installed?** Check if you have:
```
your-project/
├── .cursor/
│   └── rules/          # 12 .mdc files
└── docs/
    └── knowledge-base/  # Knowledge base files
```

**Not Installed?** See `docs/INSTALL.md` for installation instructions.

### 2. Verify It's Working

Open Cursor IDE and ask:
```
"Create VISION.md for my project"
```

If the system responds with a document summary and asks for approval, it's working!

## How to Request Documents

### Basic Request

**Simple Request:**
```
"Create VISION.md for my project"
```

**With Context:**
```
"Create PRD_MVP.md for my SaaS project - Task Management for small teams, 
using Node.js and MongoDB, MVP goal is to validate the idea"
```

### Request Multiple Documents

**Sequential (Recommended):**
```
"Create VISION.md"
[Review and approve]
"Now create PRD_MVP.md"
[Review and approve]
"Now create ARCHITECTURE_OVERVIEW.md"
```

**Batch Request:**
```
"Generate core documentation for my project: [description]"
```

The system will suggest a roadmap and generate documents one by one.

### Request Specific Document Types

**All 42 Types Supported:**
- Vision & Strategy (8 types)
- Product Requirements (6 types)
- Architecture & Design (13 types)
- Execution & Pipelines (5 types)
- Engineering (10 types)
- And more...

**Example:**
```
"Create TECH_SPEC_MVP.md"
"Generate DEPLOYMENT_RUNBOOK.md"
"Create BUSINESS_MODEL.md"
"Create SYSTEM_DIAGRAMS.md with architecture diagrams"
```

## How to Refine Documents

### Update Existing Document

**Simple Update:**
```
"Update PRD_MVP.md - add new feature: real-time collaboration"
```

**Update Multiple Sections:**
```
"Update ARCHITECTURE_OVERVIEW.md:
- Add caching layer section
- Update database schema
- Add new microservice"
```

### Complete Incomplete Sections

**Fill [TBD] Markers:**
```
"Complete the [TBD: authentication method] section in TECH_SPEC_MVP.md"
```

**Add Missing Information:**
```
"Add user authentication details to PRD_MVP.md"
```

### Improve Document Quality

**Request Improvements:**
```
"Improve the clarity of VISION.md"
"Make ARCHITECTURE_OVERVIEW.md more detailed"
"Add examples to PRD_MVP.md"
```

## How to Switch Modes

### Project Goal Modes

The system adapts documentation based on your project goal:

**🔵 Production Stability:**
```
"Create DEPLOYMENT_RUNBOOK.md for production system"
```
→ Focus: runbooks, monitoring, security

**🟢 MVP Fast:**
```
"Create PRD_MVP.md for MVP project"
```
→ Focus: lean docs, quick start

**🟡 Research:**
```
"Create ARCHITECTURE_OVERVIEW.md for research project"
```
→ Focus: hypotheses, findings, experiments

**🟣 Dev Tooling:**
```
"Create README.md for CLI tool"
```
→ Focus: excellent README, API reference, examples

**⚪ Balanced:**
```
"Create full documentation suite"
```
→ Focus: comprehensive documentation

### Explicit Mode Selection

**Specify Mode:**
```
"Create PRD_MVP.md - use MVP mode"
"Generate ARCHITECTURE_OVERVIEW.md - production depth"
"Create VISION.md - research mode"
```

## How .mdc Rules Work

### What Are .mdc Files?

**Location:** `.cursor/rules/*.mdc`

**Purpose:** Modular rule files that configure Cursor AI behavior.

**Files:**
1. `core-identity.mdc` - Defines role and principles
2. `workflow.mdc` - Step-by-step process
3. `file-organization.mdc` - File placement rules (CRITICAL)
4. `document-types.mdc` - Document catalog
5. `knowledge-base.mdc` - Knowledge base reference
6. And 7 more...

### How Cursor Reads Rules

**Automatic Detection:**
- Cursor IDE automatically reads all `.mdc` files in `.cursor/rules/`
- Rules are applied as context for AI assistant
- No configuration needed

**Rule Priority:**
1. System instructions (in `.mdc` files)
2. Knowledge base files (reference materials)
3. User context (project-specific)

### Customizing Rules

**Edit Rule Files:**
```bash
# Edit a rule file
code .cursor/rules/workflow.mdc

# Add custom rules
code .cursor/rules/custom-rules.mdc
```

**Best Practices:**
- Keep rules focused (one topic per file)
- Under 500 lines per file
- Test changes before committing

## Common Workflows

### New Project Kickoff

**Step 1: Vision**
```
"Create VISION.md for my project: [description]"
```

**Step 2: Requirements**
```
"Create PRD_MVP.md based on the VISION.md"
```

**Step 3: Architecture**
```
"Create ARCHITECTURE_OVERVIEW.md for this project"
"Create SYSTEM_DIAGRAMS.md with architecture diagrams"
```

**Step 4: Technical Spec**
```
"Create TECH_SPEC_MVP.md"
```

**Step 5: Pipeline**
```
"Create PIPELINE_MVP.md"
```

### Adding a Feature

**Step 1: Update PRD**
```
"Update PRD_MVP.md - add feature: [feature description]"
```

**Step 2: Update Architecture**
```
"Update ARCHITECTURE_OVERVIEW.md - add [component] for [feature]"
```

**Step 3: Update Tech Spec**
```
"Update TECH_SPEC_MVP.md - add technical details for [feature]"
```

### Documentation Refresh

**Step 1: Evaluate**
```
"Evaluate this project and create PROJECT_EVALUATION.md"
```

**Step 2: Identify Gaps**
Review PROJECT_EVALUATION.md to see what's missing.

**Step 3: Fill Gaps**
```
"Create [missing document type].md"
```

## Tips and Tricks

### Getting Better Results

1. **Provide Context:** Always include project context
2. **Be Specific:** Specify document type and requirements
3. **Iterate:** Review and refine documents
4. **Use Examples:** Reference existing documents

### Handling Errors

**File Creation Denied:**
- Check if path is correct (docs/ for most files)
- Verify file doesn't already exist
- Review file organization rules

**Missing Information:**
- System will use `[TBD: ...]` markers
- Fill in later or provide information
- Request completion: "Complete [section] in [document]"

**Wrong Document Type:**
- System will suggest correct type
- Check document catalog: "What document types are available?"

### Best Practices

1. **One Document at a Time:** Generate sequentially for best quality
2. **Review Before Approving:** Always review summaries
3. **Iterate:** Refine documents based on feedback
4. **Stay Consistent:** Use consistent terminology

## Troubleshooting

### Rules Not Working

**Check:**
1. `.cursor/rules/` directory exists
2. All 12 `.mdc` files present
3. Cursor IDE restarted after installation

**Fix:**
```bash
# Reinstall rules
./scripts/install.sh /path/to/project
```

### Knowledge Base Not Found

**Check:**
1. `docs/knowledge-base/` directory exists
2. Files present: `documentation_architect_reference.md`, `project_evaluation_reference.md`

**Fix:**
```bash
# Copy knowledge base files
cp -r docs/knowledge-base/ /path/to/project/docs/
```

### Documents Not Generating

**Check:**
1. Project context provided
2. Document type is valid
3. File path is correct

**Fix:**
- Provide more context
- Use explicit document type names
- Check file organization rules

## Advanced Usage

### Custom Document Types

**Create Custom Template:**
1. Edit `docs/knowledge-base/documentation_architect_reference.md`
2. Add your custom document type
3. Update `document-types.mdc` if needed

### Batch Operations

**Generate Multiple Documents:**
```
"Generate these documents for my project:
1. VISION.md
2. PRD_MVP.md
3. ARCHITECTURE_OVERVIEW.md"
```

System will create a roadmap and generate sequentially.

### Integration with Other Tools

**Export Documents:**
- Documents are standard Markdown
- Can be converted to PDF, HTML, etc.
- Compatible with documentation generators

**Version Control:**
- All documents are version-controlled
- Track changes over time
- Collaborate with team

---

**See Also:**
- `docs/INSTALL.md` - Installation guide
- `docs/BEST_PRACTICES.md` - Best practices
- `docs/FAQ.md` - Frequently asked questions
- `docs/TROUBLESHOOTING.md` - Troubleshooting guide

