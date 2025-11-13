# Test Scenarios

Test scenarios for validating document generation system behavior.

## Scenario 1: MVP Project - VISION Document

### Input
```
User: "Create VISION.md for my MVP project - it's a task management app for small teams"
Goal Mode: MVP
Stage: Idea
```

### Expected Behavior
- Generate lean VISION document
- Focus on core value proposition
- Brief, actionable content
- No deep market analysis
- Quick validation focus

### Validation Checklist
- [ ] Document is concise (2-3 pages max)
- [ ] Focuses on core vision, not detailed strategy
- [ ] Includes target audience (brief)
- [ ] Includes success metrics (high-level)
- [ ] No extensive market analysis
- [ ] No detailed competitive analysis
- [ ] Actionable and clear

### Expected Output Structure
- Vision Statement (1-2 paragraphs)
- Mission & Purpose (brief)
- Target Audience (1-2 personas)
- Core Value Proposition
- Success Metrics (high-level)
- Why Now? (brief)

### Quality Score Target: 7/10+ (MVP depth)

---

## Scenario 2: Production Project - ARCHITECTURE_OVERVIEW

### Input
```
User: "Create ARCHITECTURE_OVERVIEW.md for production system - microservices architecture with Kubernetes"
Goal Mode: Production Stability
Stage: Live
```

### Expected Behavior
- Generate comprehensive architecture document
- Detailed components and interactions
- Production considerations (monitoring, security, scalability)
- Failure modes and recovery
- Operational details

### Validation Checklist
- [ ] Document is comprehensive (5-10 pages)
- [ ] Detailed component descriptions
- [ ] Includes monitoring and observability
- [ ] Security considerations detailed
- [ ] Scalability strategy included
- [ ] Failure modes documented
- [ ] Deployment architecture included
- [ ] Operational runbooks referenced

### Expected Output Structure
- System Overview (detailed)
- Architecture Layers (comprehensive)
- Component Interactions (detailed)
- Technology Choices & Rationale
- Deployment Architecture (production-ready)
- Security Considerations (detailed)
- Scalability & Performance (comprehensive)
- Monitoring & Observability (detailed)
- Failure Modes (documented)

### Quality Score Target: 9/10+ (Production depth)

---

## Scenario 3: Missing Information - PRD_MVP

### Input
```
User: "Create PRD_MVP.md"
Goal Mode: MVP
Stage: Idea
Context: Minimal (no project details provided)
```

### Expected Behavior
- Generate PRD template with [TBD] markers
- Include all required sections
- Use [TBD] for missing information
- No hallucinated project details
- Provide guidance on what information is needed

### Validation Checklist
- [ ] All required sections present
- [ ] [TBD] markers used for unknowns
- [ ] No invented project details
- [ ] Structure is complete
- [ ] Guidance provided on filling gaps
- [ ] Template is usable

### Expected Output Structure
- Overview & Goals ([TBD: project name, description])
- MVP Scope Definition ([TBD: features])
- User Personas ([TBD: specific personas])
- Core Features ([TBD: feature list])
- Success Metrics ([TBD: specific metrics])
- Timeline & Milestones ([TBD: dates])
- Open Questions (list of what's needed)

### Quality Score Target: 7/10 (Template quality)

---

## Scenario 4: Dev Tooling Project - README

### Input
```
User: "Create README.md for my CLI tool - it's a code formatter"
Goal Mode: Dev Tooling
Stage: In Development
```

### Expected Behavior
- Generate excellent README
- Emphasize installation and usage
- Include comprehensive examples
- API/command reference
- Integration guides
- Clear developer experience focus

### Validation Checklist
- [ ] Excellent installation instructions
- [ ] Clear usage examples
- [ ] Command/API reference included
- [ ] Multiple examples (simple to advanced)
- [ ] Integration guides
- [ ] Contributing guidelines
- [ ] Well-formatted and scannable

### Expected Output Structure
- Project name & tagline
- Quick description
- Badges (build, version, license)
- Installation (detailed)
- Quick Start (with examples)
- Usage Examples (comprehensive)
- API/Command Reference
- Configuration
- Contributing
- License

### Quality Score Target: 9/10+ (Dev Tooling depth)

---

## Scenario 5: Research Project - TECH_SPEC

### Input
```
User: "Create TECH_SPEC_MVP.md for my research PoC - testing LLM code generation"
Goal Mode: Research
Stage: Idea
```

### Expected Behavior
- Generate brief technical spec
- Focus on experiments and hypotheses
- Document research approach
- Include findings structure
- Learning-focused, not production-ready

### Validation Checklist
- [ ] Brief and focused (3-5 pages)
- [ ] Hypotheses documented
- [ ] Experimental approach described
- [ ] Findings structure included
- [ ] Decisions explained
- [ ] No production considerations
- [ ] Research-focused

### Expected Output Structure
- Research Overview
- Hypotheses
- Experimental Approach
- Technology Choices (brief rationale)
- Data Collection
- Findings Structure
- Decision Log

### Quality Score Target: 7/10 (Research depth)

---

## Scenario 6: Complex Project - Multiple Documents

### Input
```
User: "I need full documentation for my SaaS platform - start with the 5 recommended documents"
Goal Mode: Balanced
Stage: In Development
```

### Expected Behavior
- Generate roadmap/checklist first
- Then generate documents one-by-one
- Each document references others
- Consistent terminology across docs
- Comprehensive coverage

### Validation Checklist
- [ ] Roadmap provided first
- [ ] Documents generated sequentially
- [ ] Cross-references between documents
- [ ] Consistent terminology
- [ ] All 5 documents complete
- [ ] Documents complement each other

### Expected Documents
1. VISION.md
2. PRD_MVP.md
3. ARCHITECTURE_OVERVIEW.md
4. TECH_SPEC_MVP.md
5. PIPELINE_MVP.md

### Quality Score Target: 8/10+ (Balanced depth)

---

## Scenario 7: Update Existing Document

### Input
```
User: "Update my README.md - add new feature X and update installation instructions"
Current Version: [existing README content]
Changes: Add feature X, update installation
```

### Expected Behavior
- Read existing document
- Apply requested changes
- Improve structure/clarity if needed
- Preserve existing content
- Return clean final version (not diff)

### Validation Checklist
- [ ] Existing content preserved
- [ ] Requested changes applied
- [ ] Structure improved if needed
- [ ] No content loss
- [ ] Clean final version (not diff)
- [ ] Optional "Changes" note if helpful

### Quality Score Target: 8/10+ (Update quality)

---

## Scenario 8: Unclear Request

### Input
```
User: "I need documentation"
Goal Mode: Unknown
Stage: Unknown
Context: Minimal
```

### Expected Behavior
- Ask 2-5 focused questions
- Identify document type needed
- Determine goal mode
- Gather essential context
- Then generate appropriate document

### Validation Checklist
- [ ] 2-5 focused questions asked
- [ ] Questions gather essential info
- [ ] Document type identified
- [ ] Goal mode determined
- [ ] Context gathered
- [ ] Document generated after clarification

### Questions Should Cover:
1. What your project does (1-3 sentences)
2. What stage it's in (idea/in development/live)
3. Primary goal (MVP/Production/Research/Dev Tooling/Balanced)
4. What document(s) you need first

### Quality Score Target: 7/10+ (After clarification)

---

## Test Execution

### Running Scenarios

1. **Manual Testing:** Execute each scenario manually
2. **Validation:** Use validation checklist for each
3. **Scoring:** Calculate quality score
4. **Documentation:** Record results and issues

### Success Criteria

- ✅ All scenarios pass validation
- ✅ Quality scores meet targets
- ✅ Expected behaviors match actual
- ✅ No critical issues found

### Failure Handling

If scenario fails:
1. Document the failure
2. Identify root cause
3. Fix the issue
4. Re-run scenario
5. Verify fix

---

**Use these scenarios to validate system behavior and ensure consistent quality.**

