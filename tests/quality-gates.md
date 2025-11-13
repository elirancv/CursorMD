# Quality Gates

Quality gates that documents must pass before being considered complete.

## Gate 1: Structure Compliance

### Requirements

- [ ] **All required sections present**
  - Check against template in `documentation_architect_reference.md`
  - No missing critical sections
  - Optional sections included if relevant

- [ ] **Proper heading hierarchy**
  - H1 for document title
  - H2 for main sections
  - H3 for subsections
  - Consistent throughout

- [ ] **Proper formatting**
  - Markdown syntax correct
  - Code blocks properly formatted
  - Tables properly formatted
  - Lists properly formatted

### Pass Criteria

✅ **Pass:** All required sections present, proper formatting
❌ **Fail:** Missing required sections or formatting errors

### Failure Actions

- Regenerate document with explicit section requirements
- Fix formatting issues
- Add missing sections

---

## Gate 2: Content Quality

### Requirements

- [ ] **Project-specific content**
  - Uses real project domain
  - Uses actual flows and constraints
  - Uses real technology stack
  - No generic boilerplate

- [ ] **No filler sections**
  - Every section serves a purpose
  - No unnecessary content
  - Each part adds value

- [ ] **Clear and actionable**
  - Short paragraphs
  - Concrete language
  - Minimal buzzwords
  - Clear next steps

- [ ] **Consistent terminology**
  - Same terms used throughout
  - Consistent naming conventions
  - No conflicting information

### Pass Criteria

✅ **Pass:** Content is project-specific, clear, and actionable
❌ **Fail:** Generic content, filler sections, unclear language

### Failure Actions

- Request more project context
- Regenerate with specific project details
- Remove filler content
- Clarify terminology

---

## Gate 3: Completeness

### Requirements

- [ ] **[TBD] markers used correctly**
  - Missing information marked with [TBD: specific info needed]
  - No hallucinated details
  - Format is consistent

- [ ] **No missing critical sections**
  - All required sections from template present
  - Critical information included
  - Optional sections included if relevant

- [ ] **Cross-references added**
  - Links to related documents where appropriate
  - Format: "See `docs/ARCHITECTURE_OVERVIEW.md` for details"
  - Avoids duplicating content

### Pass Criteria

✅ **Pass:** Complete structure, [TBD] used correctly, cross-references added
❌ **Fail:** Missing sections, hallucinated details, no cross-references

### Failure Actions

- Add missing sections
- Replace hallucinated details with [TBD]
- Add cross-references
- Complete incomplete sections

---

## Gate 4: Goal Alignment

### Requirements

#### MVP Mode
- [ ] Content is lean and focused
- [ ] Essentials only, no deep dives
- [ ] Quick start emphasis
- [ ] Appropriate depth (1-3 pages)

#### Production Mode
- [ ] Comprehensive coverage
- [ ] Detailed edge cases
- [ ] Failure scenarios included
- [ ] Appropriate depth (5-15 pages)

#### Research Mode
- [ ] Brief and focused
- [ ] Hypotheses documented
- [ ] Experiments and findings included
- [ ] Appropriate depth (2-4 pages)

#### Dev Tooling Mode
- [ ] Excellent README/API reference
- [ ] Complete examples
- [ ] Integration guides
- [ ] Appropriate depth (3-8 pages)

#### Balanced Mode
- [ ] Full documentation suite
- [ ] Balanced depth
- [ ] Comprehensive but not excessive
- [ ] Appropriate depth (varies by doc type)

### Pass Criteria

✅ **Pass:** Depth matches goal mode, content appropriate for stage
❌ **Fail:** Wrong depth, inappropriate content for goal mode

### Failure Actions

- Regenerate with explicit goal mode
- Adjust depth to match goal
- Add or remove detail as needed

---

## Gate 5: Technical Quality

### Requirements

- [ ] **Code examples (if applicable)**
  - Code is syntactically correct
  - Examples are relevant and working
  - Both simple and advanced use cases shown
  - Code is properly formatted

- [ ] **Diagrams (if applicable)**
  - Described clearly in text
  - ASCII art used if simple
  - External tools referenced if needed
  - Diagrams are accurate

- [ ] **Tables (if applicable)**
  - Properly formatted
  - All columns aligned
  - Data is accurate
  - Headers are clear

- [ ] **Links and references**
  - All links are valid
  - References are accurate
  - External links are accessible

### Pass Criteria

✅ **Pass:** All technical elements are correct and well-formatted
❌ **Fail:** Code errors, broken links, formatting issues

### Failure Actions

- Fix code syntax errors
- Correct broken links
- Fix table formatting
- Verify diagram accuracy

---

## Overall Quality Score

### Scoring System

| Gate | Weight | Score | Weighted Score |
|------|--------|-------|----------------|
| Structure Compliance | 20% | /10 | ___ |
| Content Quality | 30% | /10 | ___ |
| Completeness | 20% | /10 | ___ |
| Goal Alignment | 15% | /10 | ___ |
| Technical Quality | 15% | /10 | ___ |

**Total Score:** ___/10

### Pass/Fail Criteria

- ✅ **Pass:** Score ≥ 7/10
- ⚠️ **Warning:** Score 6-6.9/10 (needs minor fixes)
- ❌ **Fail:** Score < 6/10 (needs regeneration)

### Quality Levels

- **9-10/10:** Excellent - Production ready
- **8-8.9/10:** Very Good - Minor improvements possible
- **7-7.9/10:** Good - Meets standards
- **6-6.9/10:** Acceptable - Needs minor fixes
- **< 6/10:** Unacceptable - Needs regeneration

---

## Quality Gate Workflow

### Step 1: Pre-Generation
- Gather project context
- Identify document type
- Determine goal mode
- Check prerequisites

### Step 2: Generation
- Generate document following structure
- Apply quality standards
- Use [TBD] for unknowns
- Add cross-references

### Step 3: Quality Gates
- Run through all 5 gates
- Score each gate
- Calculate total score
- Identify failures

### Step 4: Review & Fix
- If score < 7/10: Identify issues and regenerate
- If score 7-8.9/10: Review and apply minor fixes
- If score ≥ 9/10: Approve and finalize

### Step 5: Finalization
- Document passes all gates
- Score ≥ 7/10
- Approved for use

---

## Continuous Improvement

### Monitoring Quality

- Track average quality scores
- Identify common failure patterns
- Improve templates and guidelines
- Update quality gates based on learnings

### Quality Metrics

- **Average Score:** Target ≥ 8/10
- **Pass Rate:** Target ≥ 90%
- **Regeneration Rate:** Target < 10%
- **User Satisfaction:** Target ≥ 4/5

---

**All documents must pass these quality gates before being considered complete.**

