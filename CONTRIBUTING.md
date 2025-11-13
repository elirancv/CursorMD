# Contributing to CursorMD

Thank you for your interest in contributing to the Project Documentation Architect system! This document provides guidelines for contributing.

## How to Contribute

### Reporting Issues

If you find a bug or have a suggestion:

1. **Check existing issues** - Make sure the issue hasn't been reported
2. **Create a new issue** - Use the appropriate template
3. **Provide details** - Include steps to reproduce, expected vs actual behavior
4. **Be specific** - Include examples, screenshots, or code snippets

### Suggesting Enhancements

Have an idea for improvement?

1. **Check existing discussions** - See if it's already being discussed
2. **Create a discussion** - Start a conversation about your idea
3. **Provide context** - Explain the problem and your proposed solution
4. **Be open to feedback** - Collaborate on the best approach

### Contributing Code

Want to add features or fix bugs?

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/amazing-feature`)
3. **Make your changes**
4. **Follow coding standards** (see below)
5. **Add tests** if applicable
6. **Update documentation** as needed
7. **Commit your changes** (`git commit -m 'Add amazing feature'`)
8. **Push to your branch** (`git push origin feature/amazing-feature`)
9. **Open a Pull Request**

## Development Setup

### Prerequisites

- Git
- Text editor or IDE
- Markdown viewer (optional)

### Setup Steps

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourorg/cursormd.git
   cd cursormd
   ```

2. **Create a branch:**
   ```bash
   git checkout -b your-feature-branch
   ```

3. **Make your changes:**
   - Edit files as needed
   - Follow the project structure
   - Maintain consistency

4. **Test your changes:**
   - Review your changes
   - Test with sample documents
   - Validate against checklists

5. **Commit and push:**
   ```bash
   git add .
   git commit -m "Description of changes"
   git push origin your-feature-branch
   ```

## Coding Standards

### File Structure

- **Rules:** `.cursor/rules/*.mdc` - Modular rule files
- **Knowledge Base:** Root level markdown files
- **Examples:** `examples/` directory
- **Tests:** `tests/` directory
- **Documentation:** `docs/` directory

### Markdown Formatting

- Use proper heading hierarchy (H1 → H2 → H3)
- Format code blocks with language tags
- Use tables for structured data
- Keep lines under 100 characters when possible
- Use consistent list formatting

### Naming Conventions

- **Files:** kebab-case (`document-types.mdc`)
- **Headings:** Title Case for H1, Sentence case for H2+
- **Code:** Follow language-specific conventions

### Documentation Standards

- **Clear and concise** - Get to the point
- **Well-structured** - Use headings and lists
- **Examples included** - Show, don't just tell
- **Consistent** - Follow existing patterns

## Adding New Document Types

### Process

1. **Add to catalog:**
   - Update `documentation_architect_reference.md`
   - Add structure definition
   - Include purpose and sections

2. **Add to rule file:**
   - Update `.cursor/rules/document-types.mdc`
   - Add to appropriate category
   - Include in catalog list

3. **Create example:**
   - Add example to `examples/` directory
   - Follow existing example structure
   - Make it comprehensive

4. **Update documentation:**
   - Update `DOCUMENT_COVERAGE.md`
   - Add to README if significant
   - Update CHANGELOG.md

### Example Structure

```markdown
#### NEW_DOCUMENT_TYPE.md
**Purpose:** Brief description of purpose

**Structure:**
- Section 1: Description
- Section 2: Description
- Section 3: Description
```

## Adding Examples

### Guidelines

- **Complete examples** - Show full document structure
- **Realistic content** - Use believable project details
- **Well-formatted** - Follow Markdown best practices
- **Comprehensive** - Include all required sections

### Process

1. **Choose example project:**
   - Use consistent fictional project
   - Make it realistic
   - Include relevant details

2. **Create example file:**
   - Place in appropriate `examples/` subdirectory
   - Name: `DOCUMENT_TYPE.md.example`
   - Include complete content

3. **Validate example:**
   - Check against structure template
   - Verify completeness
   - Ensure quality

## Improving Rules

### Guidelines

- **Keep focused** - Each rule file should have a single focus
- **Be clear** - Use clear, actionable language
- **Stay consistent** - Follow existing patterns
- **Document changes** - Update CHANGELOG.md

### Process

1. **Identify improvement:**
   - What needs to be improved?
   - Why is it needed?
   - How will it help?

2. **Make changes:**
   - Edit rule file(s)
   - Maintain consistency
   - Test with examples

3. **Update documentation:**
   - Update relevant docs
   - Add to CHANGELOG
   - Update examples if needed

## Testing Contributions

### Validation Checklist

Before submitting:

- [ ] Changes follow coding standards
- [ ] Documentation is updated
- [ ] Examples are updated if needed
- [ ] Validation checklist passes
- [ ] Quality gates pass
- [ ] No breaking changes (or documented)

### Test Your Changes

1. **Test with sample documents:**
   - Generate sample documents
   - Verify they work correctly
   - Check quality scores

2. **Run validation:**
   - Use validation checklist
   - Check quality gates
   - Verify test scenarios

3. **Review output:**
   - Check generated documents
   - Verify structure
   - Ensure quality

## Pull Request Process

### Before Submitting

1. **Update CHANGELOG.md:**
   - Add entry for your changes
   - Use appropriate category
   - Be descriptive

2. **Update documentation:**
   - Update relevant docs
   - Add examples if needed
   - Update README if significant

3. **Test thoroughly:**
   - Test your changes
   - Verify examples work
   - Check quality

### PR Description

Include:
- **What changed** - Brief description
- **Why** - Motivation for change
- **How** - Implementation approach
- **Testing** - How you tested
- **Screenshots** - If applicable

### Review Process

1. **Automated checks** - CI/CD validation (if set up)
2. **Code review** - Maintainers review changes
3. **Feedback** - Address any feedback
4. **Approval** - Changes approved and merged

## Code of Conduct

### Our Standards

- **Be respectful** - Treat everyone with respect
- **Be inclusive** - Welcome diverse perspectives
- **Be constructive** - Provide helpful feedback
- **Be collaborative** - Work together

### Unacceptable Behavior

- Harassment or discrimination
- Trolling or inflammatory comments
- Personal attacks
- Other inappropriate conduct

## Questions?

- **GitHub Issues** - For bugs and feature requests
- **GitHub Discussions** - For questions and discussions
- **Documentation** - Check docs/ directory first

## Recognition

Contributors will be:
- Listed in CONTRIBUTORS.md (if created)
- Credited in release notes
- Appreciated by the community

---

**Thank you for contributing to CursorMD!**

