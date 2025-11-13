# Document Validation Checklist

Use this checklist to validate that generated documents meet quality standards.

## Pre-Generation Checklist

Before generating a document, verify:

- [ ] **Document type identified correctly**
  - Matches one of the 42 supported types
  - Appropriate for project stage and goal mode

- [ ] **Project context gathered**
  - Project name and domain known
  - Project stage identified (idea/in development/live)
  - Goal mode determined (MVP/Production/Research/Dev Tooling/Balanced)
  - Tech stack specified (if relevant)

- [ ] **Required information available**
  - User has provided necessary context
  - Missing information identified and marked with [TBD]
  - No critical information gaps

- [ ] **Goal mode appropriate**
  - MVP: Lean, essentials only
  - Production: Comprehensive, detailed
  - Research: Brief, learning-focused
  - Dev Tooling: Excellent README, API reference
  - Balanced: Full documentation suite

## Post-Generation Checklist

After generating a document, verify:

### Structure & Format

- [ ] **All required sections present**
  - Check against `documentation_architect_reference.md` structure
  - No missing critical sections
  - Proper heading hierarchy (H1 → H2 → H3)

- [ ] **Proper formatting**
  - Markdown syntax correct
  - Code blocks properly formatted
  - Tables properly formatted
  - Lists properly formatted

- [ ] **File placement correct**
  - `README.md`, `PROJECT_EVALUATION.md`, `CONTRIBUTING.md` → root
  - All other docs → `docs/` directory
  - Follows user's existing structure if present

### Content Quality

- [ ] **No generic boilerplate**
  - Content is project-specific
  - Uses real domain, flows, constraints, stack
  - Avoids template-like language

- [ ] **No filler sections**
  - Every section serves a clear purpose
  - No unnecessary content
  - Each part adds value

- [ ] **Clear and actionable**
  - Short paragraphs
  - Concrete language
  - Minimal buzzwords
  - Clear next steps for reader

- [ ] **Consistent terminology**
  - Same terms used throughout
  - Consistent naming conventions
  - No conflicting information

### Completeness

- [ ] **[TBD] markers used for unknowns**
  - No hallucinated details
  - Missing information clearly marked
  - Format: `[TBD: specific information needed]`

- [ ] **No missing critical sections**
  - All required sections from template present
  - Optional sections included if relevant
  - Cross-references added where appropriate

- [ ] **Cross-references added**
  - Links to related documents
  - Format: "See `docs/ARCHITECTURE_OVERVIEW.md` for details"
  - Avoids duplicating content

### Goal-Specific Validation

#### MVP Mode
- [ ] Content is lean and focused
- [ ] Essentials only, no deep dives
- [ ] Quick start emphasis
- [ ] Deferred deep documentation

#### Production Mode
- [ ] Comprehensive coverage
- [ ] Detailed edge cases
- [ ] Failure scenarios included
- [ ] Monitoring and operations covered

#### Research Mode
- [ ] Brief and focused
- [ ] Hypotheses documented
- [ ] Experiments and findings included
- [ ] Decisions explained

#### Dev Tooling Mode
- [ ] Excellent README
- [ ] Complete API reference
- [ ] Usage examples included
- [ ] Integration guides present

### Technical Validation

- [ ] **Code examples (if applicable)**
  - Code is syntactically correct
  - Examples are relevant and working
  - Both simple and advanced use cases shown

- [ ] **Diagrams (if applicable)**
  - Described clearly in text
  - ASCII art used if simple
  - External tools referenced if needed

- [ ] **Tables (if applicable)**
  - Properly formatted
  - All columns aligned
  - Data is accurate

### Self-Check Validation

Before finalizing, verify:

- [ ] ✅ **Specific to THIS project** (not generic template)
- [ ] ✅ **No filler sections** (every part adds value)
- [ ] ✅ **[TBD] instead of guesses** (no hallucinated details)
- [ ] ✅ **Depth matches goal and request** (MVP ≠ production depth)
- [ ] ✅ **Clear next steps** (what reader should do with this)

## Quality Score Calculation

Rate each document:

| Criteria | Score | Weight | Notes |
|----------|-------|--------|-------|
| Structure Compliance | /10 | 20% | All sections present, proper format |
| Content Quality | /10 | 30% | Project-specific, clear, actionable |
| Completeness | /10 | 20% | No missing sections, [TBD] used correctly |
| Goal Alignment | /10 | 15% | Depth matches goal mode |
| Technical Quality | /10 | 15% | Code examples, formatting, etc. |

**Total Score:** ___/10

**Minimum Acceptable:** 7/10

## Common Issues & Solutions

### Issue: Document is too generic
**Solution:** 
- Request more project context
- Specify project domain and constraints
- Provide examples of project-specific details

### Issue: Missing sections
**Solution:**
- Check `documentation_architect_reference.md` for required sections
- Regenerate with explicit section requirements
- Add missing sections manually

### Issue: Depth doesn't match goal
**Solution:**
- Explicitly state goal mode in request
- Request "quick mode" or "deep mode" if needed
- Regenerate with depth specification

### Issue: Too many [TBD] markers
**Solution:**
- Gather more project information
- Ask user for specific details
- Generate template first, fill in details later

## Validation Workflow

1. **Pre-Generation:** Complete pre-generation checklist
2. **Generate:** Create document following structure
3. **Post-Generation:** Complete post-generation checklist
4. **Score:** Calculate quality score
5. **Review:** If score < 7/10, identify issues and regenerate
6. **Finalize:** Approve and save document

---

**Use this checklist for every generated document to ensure consistent quality.**

