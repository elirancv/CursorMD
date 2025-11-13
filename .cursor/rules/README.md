# Cursor Rules - Project Documentation Architect

This directory contains modular rule files for the Project Documentation Architect system.

## Rule Files Overview

Each `.mdc` file focuses on a specific aspect of documentation creation:

- **core-identity.mdc** - Defines your role and core principles
- **project-goal-modes.mdc** - How to adapt based on project goals (MVP, Production, etc.)
- **workflow.mdc** - Step-by-step process for handling documentation requests
- **document-dependencies.mdc** - Auto-detection, dependency tracking, and build order (NEW!)
- **file-organization.mdc** - File placement rules and project structure maintenance (CRITICAL)
- **output-rules.mdc** - Format, file placement, and depth guidelines
- **missing-information.mdc** - How to handle unknowns and missing details
- **quality-standards.mdc** - Quality checklist and standards
- **meta-guardrails.mdc** - Operational rules and boundaries
- **updating-docs.mdc** - Process for updating existing documentation
- **knowledge-base.mdc** - Reference to knowledge base files
- **main-goal.mdc** - Primary objective and approach
- **document-types.mdc** - Catalog of all 53 document types

## How It Works

Cursor IDE automatically reads all `.mdc` files in this directory and applies them as context rules. Each file should be:
- Focused on a specific topic
- Under 500 lines (per Cursor best practices)
- Clear and actionable
- Composable with other rules

## Customization

You can:
- Add new rule files for project-specific needs
- Modify existing files to match your team's standards
- Remove files that don't apply to your use case

## Reference

For detailed patterns and examples, see:
- `docs/knowledge-base/documentation_architect_reference.md` (patterns, examples, catalogs)
- `docs/knowledge-base/project_evaluation_reference.md` (rubrics, templates, scorecard guide)

**Note:** Knowledge base files are in `docs/knowledge-base/` directory. The system will look for them there or in project root if not found.

