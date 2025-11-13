# Troubleshooting Guide

Solutions to common issues when using the Project Documentation Architect system.

## Common Issues

### Issue: Generated Document is Too Generic

**Symptoms:**
- Document contains generic template language
- No project-specific details
- Could apply to any project

**Causes:**
- Insufficient project context provided
- Goal mode not specified
- Missing domain-specific information

**Solutions:**

1. **Provide More Context:**
   ```
   Instead of: "Create PRD_MVP.md"
   Use: "Create PRD_MVP.md for my task management SaaS - 
         it's for small teams, uses Node.js and MongoDB, 
         MVP goal is to validate the idea"
   ```

2. **Specify Project Domain:**
   - What industry/domain?
   - What problem does it solve?
   - Who are the users?
   - What's unique about it?

3. **Give Examples:**
   - Provide sample features
   - Describe user workflows
   - Share technology choices

4. **Regenerate with Context:**
   - Use the updated context
   - Explicitly state project specifics
   - Request project-specific content

---

### Issue: Missing Sections in Generated Document

**Symptoms:**
- Required sections are missing
- Document structure incomplete
- Doesn't match template

**Causes:**
- Template not followed correctly
- Sections skipped during generation
- Context didn't trigger section inclusion

**Solutions:**

1. **Check Required Sections:**
   - Review `documentation_architect_reference.md`
   - Identify missing sections
   - Request specific sections explicitly

2. **Regenerate with Section Requirements:**
   ```
   "Create PRD_MVP.md and make sure to include:
   - User Stories section
   - Acceptance Criteria section
   - Timeline section"
   ```

3. **Add Sections Manually:**
   - Use template structure
   - Fill in missing sections
   - Maintain consistency

4. **Validate Structure:**
   - Use validation checklist
   - Check against template
   - Verify completeness

---

### Issue: Document Depth Doesn't Match Needs

**Symptoms:**
- Document too brief (MVP when need Production)
- Document too detailed (Production when need MVP)
- Depth inconsistent with project stage

**Causes:**
- Goal mode not specified correctly
- System inferred wrong mode
- Depth not explicitly requested

**Solutions:**

1. **Explicitly State Goal Mode:**
   ```
   Instead of: "Create ARCHITECTURE_OVERVIEW.md"
   Use: "Create ARCHITECTURE_OVERVIEW.md for production system"
   Or: "Create ARCHITECTURE_OVERVIEW.md - MVP depth, quick version"
   ```

2. **Request Specific Depth:**
   - "Quick mode" for brief docs
   - "Deep mode" for comprehensive docs
   - "Enterprise mode" for detailed docs

3. **Regenerate with Depth Specification:**
   - Clarify project stage
   - Specify desired depth
   - Request appropriate level of detail

4. **Check Goal Mode:**
   - Verify correct mode was used
   - Adjust if needed
   - Regenerate with correct mode

---

### Issue: Too Many [TBD] Markers

**Symptoms:**
- Document full of [TBD: ...] markers
- Missing critical information
- Template-like appearance

**Causes:**
- Insufficient project information provided
- System correctly identifying unknowns
- User hasn't provided required details

**Solutions:**

1. **Gather More Information:**
   - Project name and description
   - Technology stack
   - Target users
   - Key features
   - Timeline and milestones

2. **Provide Context Gradually:**
   - Start with basic info
   - Generate initial document
   - Fill in [TBD] markers
   - Regenerate with complete info

3. **Use Template Approach:**
   - Accept template with [TBD] markers
   - Fill in details manually
   - Use as planning tool

4. **Ask for Specific Details:**
   - "What's the project name?"
   - "What technology stack?"
   - "Who are the target users?"
   - Provide answers and regenerate

---

### Issue: Document Doesn't Match Project Structure

**Symptoms:**
- File placement incorrect
- Doesn't follow existing structure
- Conflicts with project conventions

**Causes:**
- System using default placement
- Existing structure not detected
- Custom structure not specified

**Solutions:**

1. **Specify Structure:**
   ```
   "Create PRD_MVP.md and save it in docs/product/ directory"
   Or: "Follow my existing docs/ structure"
   ```

2. **Describe Existing Structure:**
   - Explain your folder layout
   - Show example paths
   - Request structure compliance

3. **Move Files Manually:**
   - Generate document
   - Move to correct location
   - Update references

4. **Update Rules:**
   - Modify output rules
   - Set custom file placement
   - Document structure preferences

---

### Issue: Inconsistent Terminology

**Symptoms:**
- Different terms for same concept
- Conflicting information
- Terminology changes between documents

**Causes:**
- No terminology defined upfront
- Terms inferred differently
- Multiple documents generated separately

**Solutions:**

1. **Define Terminology Early:**
   - Create glossary
   - Define key terms
   - Use consistently

2. **Provide Terminology:**
   ```
   "Use these terms:
   - 'User' not 'Customer'
   - 'Feature' not 'Functionality'
   - 'API' not 'Endpoint'"
   ```

3. **Review and Standardize:**
   - Review all documents
   - Identify inconsistencies
   - Update terminology
   - Regenerate if needed

4. **Create Style Guide:**
   - Document preferred terms
   - Reference in requests
   - Maintain consistency

---

### Issue: Code Examples Don't Work

**Symptoms:**
- Code examples have syntax errors
- Examples don't match project stack
- Code is incomplete

**Causes:**
- Wrong technology stack inferred
- Code generation errors
- Examples not validated

**Solutions:**

1. **Specify Technology Stack:**
   ```
   "Use Node.js/Express, not Python/FastAPI"
   "Generate TypeScript examples, not JavaScript"
   ```

2. **Request Working Examples:**
   - Ask for tested code
   - Request complete examples
   - Verify syntax

3. **Fix Examples Manually:**
   - Correct syntax errors
   - Complete incomplete code
   - Test examples

4. **Regenerate with Stack:**
   - Specify exact stack
   - Request validated code
   - Verify examples work

---

### Issue: Quality Score Too Low

**Symptoms:**
- Quality score < 7/10
- Document doesn't meet standards
- Validation fails

**Causes:**
- Missing required sections
- Generic content
- Poor structure
- Incomplete information

**Solutions:**

1. **Run Quality Gates:**
   - Use `tests/quality-gates.md`
   - Identify failing gates
   - Address each issue

2. **Use Validation Checklist:**
   - Check `tests/validation-checklist.md`
   - Fix identified issues
   - Regenerate if needed

3. **Improve Content:**
   - Add project-specific details
   - Complete missing sections
   - Improve structure

4. **Regenerate:**
   - Provide more context
   - Fix identified issues
   - Regenerate with improvements

---

## Diagnostic Tools

### Validation Checklist

Use `tests/validation-checklist.md` to:
- Verify document structure
- Check content quality
- Ensure completeness
- Validate goal alignment

### Quality Gates

Use `tests/quality-gates.md` to:
- Score document quality
- Identify failing gates
- Determine pass/fail status
- Guide improvements

### Test Scenarios

Use `tests/test-scenarios.md` to:
- Test system behavior
- Validate expected outputs
- Identify issues
- Verify fixes

---

## Getting Help

### Self-Help Resources

1. **FAQ:** See `docs/FAQ.md` for common questions
2. **Examples:** Check `examples/` for reference documents
3. **Best Practices:** See `docs/BEST_PRACTICES.md` for guidance
4. **Documentation:** Review `documentation_architect_reference.md`

### When to Ask for Help

- Issue persists after trying solutions
- Unclear error messages
- Unexpected behavior
- Need clarification on best practices

### How to Report Issues

1. **Describe the Issue:**
   - What happened?
   - What did you expect?
   - What did you get instead?

2. **Provide Context:**
   - Project type and stage
   - Goal mode used
   - Document type requested
   - Input provided

3. **Include Examples:**
   - Show input/output
   - Include error messages
   - Share relevant files

---

**Still having issues? Check the FAQ or open an issue on GitHub!**

