# Best Practices

Guidelines for getting the most out of the Project Documentation Architect system.

## Getting Started

### 1. Start with the 5 Recommended Documents

For new projects, begin with these foundational documents:

1. **VISION.md** - Define your vision and goals
2. **PRD_MVP.md** - Specify what to build
3. **ARCHITECTURE_OVERVIEW.md** - Design the system
4. **TECH_SPEC_MVP.md** - Technical implementation details
5. **PIPELINE_MVP.md** - Execution flow (if applicable)

**Why:** These documents provide a complete foundation and help you think through your project systematically.

### 2. Provide Clear Project Context

**Do:**
- Describe your project clearly (1-3 sentences)
- Specify project stage (idea/in development/live)
- State your goal mode (MVP/Production/Research/Dev Tooling/Balanced)
- Include technology stack if relevant

**Don't:**
- Use vague descriptions
- Skip project context
- Assume the system knows your project

**Example:**
```
✅ Good: "Create PRD_MVP.md for my task management SaaS - 
          it's for small teams, uses Node.js and MongoDB, 
          MVP goal is to validate the idea"

❌ Bad: "Create PRD"
```

### 3. Generate Documents Sequentially

**Best Practice:**
- Generate one document at a time
- Review and refine before generating the next
- Build on previous documents
- Maintain consistency

**Why:** 
- Better quality per document
- Documents reference each other correctly
- Easier to maintain consistency
- Allows for iteration

---

## Document Generation

### 1. Use Specific Requests

**Do:**
- Specify document type explicitly
- Include project context
- State goal mode if not obvious
- Request specific sections if needed

**Example:**
```
✅ "Create ARCHITECTURE_OVERVIEW.md for production system - 
    microservices architecture with Kubernetes"

✅ "Generate PRD_MVP.md - make sure to include User Stories 
    and Acceptance Criteria sections"
```

### 2. Handle Missing Information

**Strategy 1: Provide Context Gradually**
1. Start with basic information
2. Generate initial document with [TBD] markers
3. Fill in details
4. Regenerate with complete information

**Strategy 2: Gather Information First**
1. Collect all necessary information
2. Generate complete document
3. Review and refine

**Use [TBD] Markers:**
- Mark missing information clearly
- Format: `[TBD: specific information needed]`
- Never hallucinate or guess

### 3. Adapt Depth to Project Stage

**MVP Stage:**
- Lean documentation
- Essentials only
- Quick start focus
- Defer deep dives

**Production Stage:**
- Comprehensive documentation
- Detailed edge cases
- Failure scenarios
- Operational details

**Research Stage:**
- Brief documentation
- Hypotheses and findings
- Experimental approach
- Learning-focused

---

## Quality Assurance

### 1. Use Validation Checklist

Before finalizing any document:
- Run through `tests/validation-checklist.md`
- Verify all required sections present
- Check content quality
- Ensure completeness

### 2. Check Quality Gates

Use `tests/quality-gates.md` to:
- Score document quality
- Identify failing gates
- Determine if regeneration needed
- Target score: ≥ 7/10

### 3. Review Self-Check Criteria

Every document should be:
- ✅ Specific to THIS project (not generic)
- ✅ No filler sections
- ✅ [TBD] instead of guesses
- ✅ Depth matches goal
- ✅ Clear next steps

---

## Maintaining Documentation

### 1. Update as Project Evolves

**When to Update:**
- Features change → Update PRD
- Architecture changes → Update Architecture docs
- New requirements → Update relevant docs
- Before releases → Review all docs

**How to Update:**
- Ask: "Update [document] with these changes: [details]"
- Provide current version or describe changes
- System returns clean final version
- Review and commit

### 2. Maintain Consistency

**Terminology:**
- Define key terms early
- Use consistently across documents
- Create glossary if needed
- Update when terms change

**Structure:**
- Follow established patterns
- Keep similar documents consistent
- Use cross-references
- Avoid duplication

### 3. Version Control

**Best Practices:**
- Commit documentation with code
- Use meaningful commit messages
- Tag releases with doc updates
- Maintain changelog

---

## Customization

### 1. Adapt to Your Project

**Project-Specific Adaptations:**
- Modify document structures as needed
- Add project-specific sections
- Remove irrelevant sections
- Customize templates

**How:**
- Edit `documentation_architect_reference.md`
- Create custom rule files
- Document your customizations
- Share with team

### 2. Create Custom Rules

**When:**
- Project has specific requirements
- Need to enforce standards
- Want to add custom checks
- Team has conventions

**How:**
1. Create new `.mdc` file in `.cursor/rules/`
2. Add project-specific guidelines
3. Reference in other rules if needed
4. Document for team

### 3. Build Your Knowledge Base

**Expand Reference Materials:**
- Add project-specific examples
- Document common patterns
- Create templates for your domain
- Build internal best practices

---

## Team Collaboration

### 1. Share Rules and Standards

**Do:**
- Commit rules to version control
- Document customizations
- Share knowledge base files
- Maintain team standards

**Why:**
- Ensures consistency
- Onboards new team members
- Maintains quality
- Enables collaboration

### 2. Establish Workflows

**Documentation Workflow:**
1. Generate initial documents
2. Review as team
3. Refine based on feedback
4. Maintain and update

**Review Process:**
- Peer review documents
- Check against standards
- Provide constructive feedback
- Iterate and improve

### 3. Continuous Improvement

**Regular Reviews:**
- Review documentation quality
- Identify improvement areas
- Update standards
- Share learnings

**Metrics:**
- Track quality scores
- Monitor update frequency
- Measure user satisfaction
- Identify common issues

---

## Common Patterns

### Pattern 1: New Project Kickoff

1. Generate VISION.md
2. Generate PRD_MVP.md
3. Generate ARCHITECTURE_OVERVIEW.md
4. Generate TECH_SPEC_MVP.md
5. Generate remaining docs as needed

### Pattern 2: Feature Addition

1. Update PRD with new feature
2. Update Architecture if needed
3. Update Tech Spec if needed
4. Update relevant docs
5. Generate new docs if needed

### Pattern 3: Documentation Refresh

1. Review all existing docs
2. Identify outdated sections
3. Update systematically
4. Regenerate if major changes
5. Verify consistency

---

## Avoiding Common Mistakes

### Mistake 1: Too Generic

**Problem:** Documents could apply to any project

**Solution:**
- Provide project-specific context
- Use real domain and constraints
- Include actual technology stack
- Specify unique aspects

### Mistake 2: Wrong Depth

**Problem:** Depth doesn't match project stage

**Solution:**
- Explicitly state goal mode
- Request appropriate depth
- Match depth to stage
- Adjust as project evolves

### Mistake 3: Inconsistent Terminology

**Problem:** Different terms for same concept

**Solution:**
- Define terminology early
- Use consistently
- Create glossary
- Review for consistency

### Mistake 4: Missing Updates

**Problem:** Documentation becomes outdated

**Solution:**
- Update as project evolves
- Review before releases
- Maintain changelog
- Regular documentation reviews

---

## Advanced Tips

### 1. Use Cross-References

**Effective Cross-Referencing:**
- Link related documents
- Avoid duplication
- Keep docs focused
- Maintain navigation

**Example:**
```
See `docs/ARCHITECTURE_OVERVIEW.md` for detailed system design.
Refer to `docs/TECH_SPEC_MVP.md` for implementation details.
```

### 2. Leverage Examples

**Using Examples:**
- Reference example documents
- Adapt to your project
- Learn from patterns
- Build your own examples

### 3. Architecture Diagrams

**Creating Diagrams:**
- Use `SYSTEM_DIAGRAMS.md` for dedicated diagram document
- Start with text descriptions for clarity
- Use ASCII art for simple visualizations
- Reference external tools (Mermaid, PlantUML) for complex diagrams
- Keep diagram sources in `diagrams/` directory

**Best Practices:**
- Describe architecture in text first
- Use ASCII art for simple diagrams (3-5 components)
- Use external tools for complex architectures
- Maintain diagram sources alongside documents

**See:** `docs/ARCHITECTURE_DIAGRAMS_GUIDE.md` for complete guide

### 4. Iterate and Refine

**Iterative Approach:**
- Start with basic version
- Add details gradually
- Refine based on feedback
- Improve continuously

---

## Resources

### Documentation
- **Catalog:** `documentation_architect_reference.md`
- **Examples:** `examples/` directory
- **FAQ:** `docs/FAQ.md`
- **Troubleshooting:** `docs/TROUBLESHOOTING.md`

### Validation
- **Checklist:** `tests/validation-checklist.md`
- **Quality Gates:** `tests/quality-gates.md`
- **Test Scenarios:** `tests/test-scenarios.md`

### Support
- GitHub Issues for bugs
- GitHub Discussions for questions
- Pull requests for improvements

---

**Follow these best practices to get the most out of the Project Documentation Architect system!**

