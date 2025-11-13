# Maintenance Plan

How to maintain rule files and knowledge base over time in the Project Documentation Architect system.

## Overview

This document outlines the maintenance procedures for CursorMD, including versioning, deprecating and adding rules, updating knowledge base, and keeping the system current and effective.

## Maintenance Philosophy

### Principles

1. **Stability First:** Don't break existing functionality
2. **Backward Compatibility:** Maintain compatibility when possible
3. **Clear Versioning:** Version all changes
4. **Documentation:** Document all changes
5. **Testing:** Test changes before deployment

### Maintenance Schedule

**Regular Maintenance:**
- **Weekly:** Review usage and feedback
- **Monthly:** Update knowledge base with learnings
- **Quarterly:** Review and update rules
- **Annually:** Major version review

**Ad-Hoc Maintenance:**
- Fix bugs immediately
- Add features as needed
- Update for new document types
- Respond to user feedback

## Versioning

### Version Format

**Format:** `{major}.{minor}.{patch}`

**Examples:**
- `1.0.0` - Initial release
- `1.1.0` - New features (backward compatible)
- `1.1.1` - Bug fixes
- `2.0.0` - Breaking changes

### Versioning Rules

**Major Version (Breaking Changes):**
- Incompatible API changes
- Major rule structure changes
- Knowledge base format changes
- Removal of features

**Minor Version (New Features):**
- New document types
- New rule files
- Enhanced functionality
- Backward compatible changes

**Patch Version (Bug Fixes):**
- Bug fixes
- Typo corrections
- Minor improvements
- Documentation updates

### Versioning Implementation

**Version File:** `VERSION` or `package.json`

```json
{
  "version": "1.2.3",
  "cursorMD": {
    "rulesVersion": "1.2.0",
    "knowledgeBaseVersion": "1.1.0"
  }
}
```

**Rule File Versioning:**
```markdown
# File: .cursor/rules/core-identity.mdc

<!-- Version: 1.2.0 -->
<!-- Last Updated: 2025-01-XX -->

# Core Identity
...
```

**Knowledge Base Versioning:**
```markdown
# Documentation Architect Reference

**Version:** 1.1.0
**Last Updated:** 2025-01-XX
**Compatible Rules:** 1.2.0+

...
```

## Deprecating Rules

### Deprecation Process

**Step 1: Announce Deprecation**
```markdown
# File: .cursor/rules/deprecated-rule.mdc

> **⚠️ DEPRECATED:** This rule is deprecated as of version 1.2.0
> **Removal:** Will be removed in version 2.0.0
> **Migration:** See MIGRATION_GUIDE.md

# Deprecated Rule
...
```

**Step 2: Provide Migration Path**
```markdown
# Migration Guide

## Deprecated Rule: old-rule.mdc

**Deprecated:** Version 1.2.0
**Removed:** Version 2.0.0

### Migration Steps

1. Update references to new-rule.mdc
2. Update knowledge base references
3. Test with new rule
4. Remove old rule file

### Breaking Changes

- [List breaking changes]
- [Provide workarounds]
```

**Step 3: Support Period**
- **Deprecation Period:** 6 months minimum
- **Support:** Maintain compatibility during period
- **Documentation:** Update all documentation
- **Communication:** Notify users

**Step 4: Removal**
- Remove after support period
- Update version to major
- Update documentation
- Provide final migration guide

### Deprecation Examples

**Deprecating a Rule File:**
```bash
# 1. Mark as deprecated
echo "> **⚠️ DEPRECATED:** ..." >> .cursor/rules/old-rule.mdc

# 2. Create migration guide
# 3. Update references
# 4. Remove after 6 months
```

**Deprecating a Document Type:**
```markdown
# In documentation_architect_reference.md

## OLD_DOCUMENT_TYPE.md

> **⚠️ DEPRECATED:** Use NEW_DOCUMENT_TYPE.md instead

[Keep structure for reference but mark deprecated]
```

## Adding New Rules

### Rule Addition Process

**Step 1: Design**
- Identify need for new rule
- Design rule structure
- Plan integration points
- Document purpose

**Step 2: Implementation**
```typescript
// Create new rule file
// File: .cursor/rules/new-rule.mdc

# New Rule

## Purpose
[Clear purpose statement]

## Rules
[Rule definitions]

## Integration
[How it integrates with other rules]
```

**Step 3: Testing**
- Test with existing rules
- Verify no conflicts
- Test document generation
- Validate behavior

**Step 4: Documentation**
- Update README.md
- Update rule catalog
- Add examples
- Document integration

**Step 5: Release**
- Increment minor version
- Update CHANGELOG.md
- Announce new feature
- Provide migration guide if needed

### Rule File Guidelines

**Structure:**
- Focused on one topic
- Under 500 lines
- Clear sections
- Examples included

**Naming:**
- Descriptive name
- kebab-case
- `.mdc` extension
- Matches purpose

**Content:**
- Clear purpose
- Specific rules
- Examples
- Integration notes

## Updating Knowledge Base

### Knowledge Base Update Process

**Step 1: Identify Updates**
- New document types
- Improved templates
- Better examples
- User feedback

**Step 2: Update Content**
```markdown
# In documentation_architect_reference.md

## NEW_DOCUMENT_TYPE.md

**Purpose:** [Purpose]

**Structure:**
- Section 1
- Section 2
- Section 3

**Example:**
[Example content]
```

**Step 3: Version Update**
- Increment knowledge base version
- Update compatibility notes
- Document changes

**Step 4: Testing**
- Test with all rule files
- Verify document generation
- Check examples
- Validate structure

**Step 5: Release**
- Update version
- Update CHANGELOG.md
- Announce changes
- Provide migration guide

### Knowledge Base Maintenance

**Regular Updates:**
- Add new document types
- Improve existing templates
- Add examples
- Update best practices

**Quality Improvements:**
- Fix typos
- Improve clarity
- Add details
- Enhance examples

**User Feedback Integration:**
- Incorporate suggestions
- Fix reported issues
- Add requested features
- Improve usability

## Rule File Maintenance

### Regular Maintenance Tasks

**Weekly:**
- Review error logs
- Check user feedback
- Monitor performance
- Fix critical bugs

**Monthly:**
- Review rule effectiveness
- Update examples
- Improve clarity
- Optimize performance

**Quarterly:**
- Major rule review
- Structure optimization
- Integration improvements
- Documentation updates

### Rule File Updates

**Bug Fixes:**
```markdown
# Fix bug in workflow.mdc

<!-- Version: 1.2.1 -->
<!-- Fix: Corrected file path validation -->

# Workflow
[Updated content]
```

**Enhancements:**
```markdown
# Enhance file-organization.mdc

<!-- Version: 1.3.0 -->
<!-- Enhancement: Added new directory support -->

# File Organization
[Enhanced content]
```

**Refactoring:**
```markdown
# Refactor quality-standards.mdc

<!-- Version: 1.4.0 -->
<!-- Refactor: Improved structure and clarity -->

# Quality Standards
[Refactored content]
```

## Change Management

### Change Process

**Step 1: Propose Change**
- Document proposed change
- Explain rationale
- Identify impacts
- Plan implementation

**Step 2: Review**
- Team review
- Impact analysis
- Compatibility check
- Approval

**Step 3: Implement**
- Make changes
- Update version
- Update documentation
- Test thoroughly

**Step 4: Release**
- Update CHANGELOG.md
- Announce changes
- Provide migration guide
- Monitor feedback

### Change Documentation

**CHANGELOG.md Format:**
```markdown
# Changelog

## [1.2.0] - 2025-01-XX

### Added
- New rule: custom-rules.mdc
- New document type: CUSTOM_DOC.md

### Changed
- Enhanced file-organization.mdc
- Improved error messages

### Deprecated
- old-rule.mdc (removed in 2.0.0)

### Fixed
- Bug in workflow.mdc
- Typo in quality-standards.mdc

### Security
- Fixed path traversal vulnerability
```

## Testing Changes

### Testing Strategy

**Unit Testing:**
- Test individual rules
- Validate rule logic
- Check rule syntax
- Verify rule structure

**Integration Testing:**
- Test rule interactions
- Verify knowledge base integration
- Check document generation
- Validate file creation

**Regression Testing:**
- Test existing functionality
- Verify backward compatibility
- Check migration paths
- Validate examples

### Test Scenarios

**Rule File Changes:**
1. Test document generation
2. Verify file placement
3. Check error handling
4. Validate quality standards

**Knowledge Base Changes:**
1. Test all document types
2. Verify templates
3. Check examples
4. Validate structures

## Rollback Procedures

### Rollback Process

**Step 1: Identify Issue**
- Document problem
- Assess impact
- Determine rollback need

**Step 2: Rollback**
```bash
# Revert to previous version
git checkout v1.1.0

# Restore files
cp -r .cursor/rules/v1.1.0/* .cursor/rules/
cp docs/knowledge-base/v1.1.0/* docs/knowledge-base/
```

**Step 3: Verify**
- Test functionality
- Verify stability
- Check compatibility
- Monitor errors

**Step 4: Communicate**
- Announce rollback
- Explain reason
- Provide timeline
- Update status

## Best Practices

### Maintenance Best Practices

1. **Version Everything:** Version all changes
2. **Document Changes:** Document all modifications
3. **Test Thoroughly:** Test before release
4. **Maintain Compatibility:** Preserve backward compatibility
5. **Communicate Clearly:** Keep users informed

### Rule File Best Practices

1. **Keep Focused:** One topic per file
2. **Stay Under Limit:** Under 500 lines
3. **Document Purpose:** Clear purpose statements
4. **Provide Examples:** Include examples
5. **Test Integration:** Test with other rules

### Knowledge Base Best Practices

1. **Keep Updated:** Regular updates
2. **Maintain Quality:** High quality standards
3. **Provide Examples:** Include examples
4. **Stay Consistent:** Consistent structure
5. **Version Changes:** Version all updates

---

**See Also:**
- `CHANGELOG.md` - Version history
- `docs/ONBOARDING_GUIDE.md` - Onboarding guide
- `docs/API_CONTRACT.md` - API versioning

