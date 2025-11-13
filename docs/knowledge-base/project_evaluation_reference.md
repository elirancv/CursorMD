# Project Evaluation Reference Guide

This guide provides rubrics, templates, and scorecard frameworks for evaluating project health and documentation quality.

## Evaluation Framework

### Project Health Scorecard

Rate each category 1-5 (1 = Critical issues, 5 = Excellent):

#### 1. Code Quality & Structure
- **5:** Clean architecture, consistent patterns, well-organized
- **3:** Generally good, some inconsistencies
- **1:** Messy, hard to navigate, no clear structure

#### 2. Documentation Completeness
- **5:** All key docs present, comprehensive, up-to-date
- **3:** Core docs present, some gaps
- **1:** Missing critical documentation

#### 3. Testing & Quality Assurance
- **5:** Comprehensive test coverage, CI/CD, automated QA
- **3:** Basic tests, some coverage gaps
- **1:** Minimal or no tests

#### 4. Deployment & Operations
- **5:** Automated deployment, monitoring, runbooks, clear ops procedures
- **3:** Manual but documented deployment, basic monitoring
- **1:** Ad-hoc deployment, no monitoring/runbooks

#### 5. Security & Compliance
- **5:** Security best practices, regular audits, compliance documented
- **3:** Basic security measures, some gaps
- **1:** Security concerns, no documented practices

#### 6. Maintainability
- **5:** Easy to onboard, clear patterns, good abstractions
- **3:** Moderate complexity, some documentation
- **1:** Hard to understand, high complexity, poor abstractions

#### 7. Performance & Scalability
- **5:** Performance tested, scalable architecture, monitoring
- **3:** Basic performance considerations
- **1:** No performance planning, scalability concerns

#### 8. User Experience (if applicable)
- **5:** Intuitive, well-documented, good error handling
- **3:** Functional but could be improved
- **1:** Poor UX, confusing, error-prone

---

## Evaluation Template

```markdown
# Project Evaluation: [Project Name]

**Date:** [Date]
**Evaluator:** [Name/Role]
**Project Stage:** [Idea / In Development / Live]

## Executive Summary

[2-3 sentences summarizing overall health and key findings]

## Health Scorecard

| Category | Score | Notes |
|----------|-------|-------|
| Code Quality & Structure | X/5 | [Brief notes] |
| Documentation Completeness | X/5 | [Brief notes] |
| Testing & Quality Assurance | X/5 | [Brief notes] |
| Deployment & Operations | X/5 | [Brief notes] |
| Security & Compliance | X/5 | [Brief notes] |
| Maintainability | X/5 | [Brief notes] |
| Performance & Scalability | X/5 | [Brief notes] |
| User Experience | X/5 | [Brief notes] |

**Overall Score:** X/40

## Strengths

- [Strength 1 with context]
- [Strength 2 with context]
- [Strength 3 with context]

## Weaknesses & Risks

### Critical Issues
- [Issue 1] - Impact: [High/Medium/Low]
- [Issue 2] - Impact: [High/Medium/Low]

### Areas for Improvement
- [Improvement 1]
- [Improvement 2]

### Risks
- [Risk 1] - Likelihood: [High/Medium/Low], Impact: [High/Medium/Low]
- [Risk 2] - Likelihood: [High/Medium/Low], Impact: [High/Medium/Low]

## Recommendations

### High Priority
1. [Recommendation 1] - Why: [Reason], Effort: [Low/Medium/High]
2. [Recommendation 2] - Why: [Reason], Effort: [Low/Medium/High]

### Medium Priority
1. [Recommendation 3]
2. [Recommendation 4]

### Low Priority
1. [Recommendation 5]
2. [Recommendation 6]

## Next Steps

- [ ] [Action item 1] - Owner: [Name], Deadline: [Date]
- [ ] [Action item 2] - Owner: [Name], Deadline: [Date]
- [ ] [Action item 3] - Owner: [Name], Deadline: [Date]

## Detailed Findings

### Code Quality & Structure
[Detailed analysis]

### Documentation
[Detailed analysis]

### Testing
[Detailed analysis]

### Operations
[Detailed analysis]

### Security
[Detailed analysis]

### Performance
[Detailed analysis]

## Conclusion

[Summary and overall assessment]
```

---

## Evaluation Rubrics by Project Type

### MVP / Early Stage Projects
**Focus areas:**
- Can someone understand what this does?
- Can someone run it locally?
- Is the core functionality clear?

**Acceptable gaps:**
- Comprehensive testing (basic is fine)
- Production runbooks (not needed yet)
- Advanced documentation (core docs sufficient)

### Production Projects
**Focus areas:**
- Can it be deployed reliably?
- Can issues be diagnosed quickly?
- Is it secure and monitored?
- Can new team members contribute?

**Critical requirements:**
- Deployment documentation
- Monitoring and alerting
- Runbooks for common issues
- Security practices

### Dev Tooling / Libraries
**Focus areas:**
- Is the API clear?
- Are examples comprehensive?
- Is integration straightforward?
- Is versioning handled well?

**Critical requirements:**
- Excellent README
- API reference
- Usage examples
- Migration guides for breaking changes

### Research / PoC Projects
**Focus areas:**
- Are hypotheses clear?
- Are findings documented?
- Can experiments be reproduced?
- Are decisions explained?

**Acceptable gaps:**
- Production considerations
- Comprehensive testing
- User documentation

---

## Common Issues & Recommendations

### Issue: Missing README
**Recommendation:** Create basic README with:
- What the project does
- How to install/run
- Basic usage example

### Issue: No Architecture Documentation
**Recommendation:** Create ARCHITECTURE.md with:
- High-level system overview
- Key components
- Technology choices

### Issue: No Testing Strategy
**Recommendation:** Create TEST_PLAN.md with:
- Testing approach
- Coverage goals
- How to run tests

### Issue: No Deployment Documentation
**Recommendation:** Create DEPLOYMENT.md with:
- Prerequisites
- Step-by-step deployment
- Environment configuration

### Issue: Poor Code Organization
**Recommendation:** Document:
- Current structure
- Proposed improvements
- Migration plan

### Issue: No Monitoring/Observability
**Recommendation:** Document:
- What to monitor
- How to access logs/metrics
- Alerting strategy

---

## Evaluation Best Practices

1. **Be constructive:** Focus on actionable improvements
2. **Prioritize:** Identify critical vs. nice-to-have issues
3. **Context-aware:** Adjust expectations based on project stage
4. **Specific:** Provide concrete examples, not vague feedback
5. **Balanced:** Highlight strengths as well as weaknesses

---

## Scoring Guidelines

### 5/5 (Excellent)
- Best-in-class implementation
- No significant gaps
- Could serve as example for others

### 4/5 (Good)
- Solid implementation
- Minor improvements possible
- Meets expectations

### 3/5 (Adequate)
- Functional but has gaps
- Needs improvement
- Works but could be better

### 2/5 (Poor)
- Significant issues
- Missing important elements
- Needs substantial work

### 1/5 (Critical)
- Major problems
- Blocks productivity
- Requires immediate attention

---

## Evaluation Checklist

Before finalizing evaluation:

- [ ] Reviewed all major components
- [ ] Checked documentation completeness
- [ ] Assessed code quality
- [ ] Evaluated testing coverage
- [ ] Reviewed deployment process
- [ ] Checked security practices
- [ ] Assessed maintainability
- [ ] Provided prioritized recommendations
- [ ] Included actionable next steps

---

**Remember:** The goal is to help the project improve, not to criticize. Be constructive, specific, and prioritize based on project goals and stage.

