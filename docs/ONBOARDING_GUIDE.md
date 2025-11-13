# Onboarding Guide

Guide for new developers joining a project using the Project Documentation Architect system.

## Overview

This guide helps new team members understand how the Project Documentation Architect system works, where documentation lives, and how to generate and update documents effectively.

## Welcome!

You're joining a project that uses **CursorMD - Project Documentation Architect**, a system that helps create professional, project-specific documentation using AI assistance in Cursor IDE.

## Understanding the System

### What Is It?

The Project Documentation Architect is a set of rules and knowledge bases that configure Cursor IDE's AI assistant to:
- Generate professional documentation
- Maintain consistent structure and quality
- Adapt to project goals (MVP, Production, etc.)
- Follow best practices automatically

### How It Works

**Rule Files:** 12 modular `.mdc` files in `.cursor/rules/` configure the AI
**Knowledge Base:** Reference files with templates for 42 document types
**AI Assistant:** Cursor IDE uses these rules to generate documentation

**You Don't Need To:**
- Write documentation from scratch
- Remember all document structures
- Worry about consistency
- Figure out what to document

**You Just Need To:**
- Ask Cursor to create documents
- Provide project context
- Review and refine outputs

## Project Structure

### Where Documentation Lives

**Documentation Directory:** `docs/`

```
docs/
├── VISION.md                    # Project vision
├── PRD_MVP.md                   # Product requirements
├── ARCHITECTURE_OVERVIEW.md      # System architecture
├── TECH_SPEC_MVP.md             # Technical specification
├── PIPELINE_MVP.md              # Execution pipeline
└── ... (other documents)
```

**Root Directory (Limited):**
```
README.md                         # Project overview
PROJECT_EVALUATION.md            # Project assessment
CONTRIBUTING.md                  # Contribution guidelines
```

### Rule Files Location

**Rules:** `.cursor/rules/`

```
.cursor/
└── rules/
    ├── core-identity.mdc        # System identity
    ├── workflow.mdc             # Workflow process
    ├── file-organization.mdc    # File placement rules
    ├── document-types.mdc       # Document catalog
    └── ... (8 more files)
```

**Knowledge Base:** `docs/knowledge-base/`

```
docs/
└── knowledge-base/
    ├── documentation_architect_reference.md  # Document templates
    └── project_evaluation_reference.md        # Evaluation rubrics
```

## How Rules Work

### Rule Files Explained

**Each `.mdc` file focuses on one aspect:**

1. **core-identity.mdc** - What the system is and its role
2. **workflow.mdc** - Step-by-step process for requests
3. **file-organization.mdc** - Where files go (CRITICAL!)
4. **document-types.mdc** - List of 42 document types
5. **knowledge-base.mdc** - Reference to knowledge base
6. **project-goal-modes.mdc** - MVP vs Production modes
7. **output-rules.mdc** - Format and depth guidelines
8. **quality-standards.mdc** - Quality criteria
9. **missing-information.mdc** - How to handle unknowns
10. **meta-guardrails.mdc** - Operational boundaries
11. **updating-docs.mdc** - How to update documents
12. **main-goal.mdc** - Primary objective

**You Don't Need To:**
- Edit rule files (usually)
- Understand all rules
- Modify the system

**You Just Need To:**
- Know they exist
- Trust they work
- Use the system

## Generating Documents

### Your First Document

**Step 1: Open Cursor IDE**

**Step 2: Ask for a Document**
```
"Create VISION.md for my project"
```

**Step 3: Provide Context (if asked)**
```
"My project is a task management SaaS for small teams, 
using Node.js and MongoDB, MVP goal is to validate the idea"
```

**Step 4: Review Summary**
- System shows document summary
- Review the content
- Check if it's what you need

**Step 5: Approve or Refine**
- Approve: "Yes, create it"
- Refine: "Add more details about [topic]"
- Decline: "No, I'll do it manually"

### Common Document Requests

**Vision & Strategy:**
```
"Create VISION.md"
"Generate PRODUCT_OVERVIEW.md"
"Create MARKET_ANALYSIS.md"
```

**Product Requirements:**
```
"Create PRD_MVP.md"
"Generate USER_STORIES.md"
"Create ACCEPTANCE_CRITERIA.md"
```

**Architecture:**
```
"Create ARCHITECTURE_OVERVIEW.md"
"Create SYSTEM_DIAGRAMS.md with architecture diagrams"
"Generate TECH_SPEC_MVP.md"
"Create DATA_MODEL.md"
```

**See `docs/DOCUMENT_COVERAGE.md` for all 42 types.**

### Providing Context

**Good Context Includes:**
- Project name and description
- Project stage (idea/in-development/live)
- Goal mode (MVP/Production/Research/Dev-Tooling/Balanced)
- Technology stack
- Key features or requirements

**Example:**
```
"Create PRD_MVP.md for my SaaS project:
- Name: TaskMaster
- Description: Task management for small teams
- Stage: in-development
- Goal: MVP (validate idea)
- Tech: Node.js, MongoDB, React
- Key features: Tasks, Teams, Real-time updates"
```

## Updating Documents

### Simple Updates

**Update Existing Section:**
```
"Update PRD_MVP.md - change feature X to feature Y"
```

**Add New Section:**
```
"Update ARCHITECTURE_OVERVIEW.md - add caching layer section"
```

**Complete Missing Information:**
```
"Complete the [TBD: authentication method] section in TECH_SPEC_MVP.md"
```

### Major Updates

**Refactor Document:**
```
"Update VISION.md with new vision statement: [new vision]"
```

**Restructure:**
```
"Reorganize PRD_MVP.md - move features section before user stories"
```

## Project Goal Modes

### Understanding Modes

The system adapts documentation based on project goal:

**🔵 Production Stability**
- Focus: Runbooks, monitoring, security
- Depth: Deep operational documentation
- Use when: System is live, need reliability

**🟢 MVP Fast**
- Focus: Lean docs, quick start
- Depth: Essentials only
- Use when: Validating idea, shipping fast

**🟡 Research**
- Focus: Hypotheses, experiments, findings
- Depth: Light, learning-focused
- Use when: Research project, PoC

**🟣 Dev Tooling**
- Focus: Excellent README, API reference
- Depth: Comprehensive developer experience
- Use when: Building SDK, library, CLI

**⚪ Balanced**
- Focus: Full documentation suite
- Depth: Comprehensive but balanced
- Use when: Standard product development

### Specifying Mode

**Explicit:**
```
"Create PRD_MVP.md - use MVP mode"
```

**Implicit:**
```
"Create PRD_MVP.md for MVP project"
```

System infers mode from context.

## Best Practices

### For New Team Members

1. **Start Simple:** Begin with basic documents (VISION, PRD)
2. **Provide Context:** Always include project context
3. **Review Outputs:** Always review before approving
4. **Iterate:** Refine documents based on feedback
5. **Ask Questions:** Don't hesitate to ask team members

### Document Generation

1. **One at a Time:** Generate documents sequentially
2. **Build on Previous:** Reference previous documents
3. **Stay Consistent:** Use consistent terminology
4. **Fill Gaps:** Complete [TBD] markers

### Collaboration

1. **Share Context:** Share project context with team
2. **Review Together:** Review documents as a team
3. **Maintain Standards:** Follow team conventions
4. **Update Regularly:** Keep docs up-to-date

## Common Workflows

### New Feature Development

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

**Step 4: Update Tests**
```
"Update TEST_PLAN.md - add tests for [feature]"
```

### Project Kickoff

**Step 1: Vision**
```
"Create VISION.md"
```

**Step 2: Requirements**
```
"Create PRD_MVP.md"
```

**Step 3: Architecture**
```
"Create ARCHITECTURE_OVERVIEW.md"
```

**Step 4: Technical Spec**
```
"Create TECH_SPEC_MVP.md"
```

**Step 5: Pipeline**
```
"Create PIPELINE_MVP.md"
```

## Troubleshooting

### Documents Not Generating

**Check:**
1. Is Cursor IDE open?
2. Are rule files installed? (`.cursor/rules/` exists?)
3. Is project context provided?

**Fix:**
- Provide more context
- Check installation: `docs/INSTALL.md`
- Restart Cursor IDE

### Wrong File Location

**Issue:** File created in wrong location.

**Fix:**
- System should suggest correct location
- Follow file organization rules
- See `docs/FILE_CREATION_VALIDATION.md`

### Missing Information

**Issue:** Document has `[TBD: ...]` markers.

**Fix:**
- Provide missing information
- Request completion: "Complete [section] in [document]"
- Fill manually if needed

## Getting Help

### Resources

- **README.md** - Project overview
- **docs/FAQ.md** - Frequently asked questions
- **docs/BEST_PRACTICES.md** - Best practices
- **docs/TROUBLESHOOTING.md** - Troubleshooting guide
- **docs/CURSOR_INTEGRATION_GUIDE.md** - Integration guide

### Team Members

- Ask team members for help
- Review existing documents for examples
- Check team conventions

## Next Steps

### Immediate Actions

1. ✅ Read this guide
2. ✅ Understand project structure
3. ✅ Try generating your first document
4. ✅ Review existing documents

### Learning Path

1. **Week 1:** Generate basic documents (VISION, PRD)
2. **Week 2:** Learn to update documents
3. **Week 3:** Explore all document types
4. **Week 4:** Master advanced features

### Contribution

Once comfortable:
- Help improve documentation
- Share best practices
- Contribute to knowledge base
- Help onboard others

---

**Welcome to the team! You're ready to create professional documentation.**

**See Also:**
- `docs/CURSOR_INTEGRATION_GUIDE.md` - Detailed integration guide
- `docs/BEST_PRACTICES.md` - Best practices
- `docs/ARCHITECTURE_DIAGRAMS_GUIDE.md` - Architecture diagrams guide
- `docs/MAINTENANCE_PLAN.md` - Maintenance procedures

