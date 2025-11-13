# Frequently Asked Questions (FAQ)

Common questions about the Project Documentation Architect system.

## General Questions

### Q: What's the difference between `.cursorrules` and `.cursor/rules/`?

**A:** 
- `.cursorrules` is the legacy format (still works, but may be deprecated)
- `.cursor/rules/` is the recommended modular format with separate `.mdc` files
- The modular format is easier to maintain and follows Cursor's best practices
- Both formats work, but we recommend using `.cursor/rules/` for new projects

### Q: Do I need all 42 document types?

**A:** No! Start with the 5 recommended documents:
1. VISION.md
2. PRD_MVP.md
3. ARCHITECTURE_OVERVIEW.md
4. TECH_SPEC_MVP.md
5. PIPELINE_MVP.md

Generate additional documents as needed based on your project requirements.

### Q: Can I use this for non-SaaS projects?

**A:** Yes! The system is flexible and can be adapted to:
- Open source projects
- Internal tools
- Research projects
- Libraries and frameworks
- Any software project

Just adapt the structures to your project type.

### Q: How do I customize the document structures?

**A:** 
1. Edit `documentation_architect_reference.md` to modify structures
2. Create custom rule files in `.cursor/rules/` for project-specific needs
3. Override specific sections as needed
4. Document your customizations

---

## Usage Questions

### Q: How do I generate a specific document?

**A:** Simply ask Cursor:
- "Create VISION.md"
- "Generate PRD_MVP.md"
- "I need ARCHITECTURE_OVERVIEW.md"

The system will recognize the document type and generate it.

### Q: What if I don't have all the information?

**A:** The system will use `[TBD: ...]` markers for missing information. You can:
1. Fill in the details later
2. Provide more context and regenerate
3. Use the template as a starting point

Never hallucinate or guess - always use [TBD] markers.

### Q: Can I generate multiple documents at once?

**A:** 
- **Best practice:** Generate one document at a time for best quality
- **Alternative:** Request a documentation roadmap first, then generate documents sequentially
- **Not recommended:** Generating many documents simultaneously (quality may suffer)

### Q: How do I update an existing document?

**A:** 
1. Ask: "Update [document name] with these changes: [details]"
2. Provide the current version or describe what changed
3. The system will return a clean final version (not a diff)
4. Review and commit

---

## Project Goal Modes

### Q: What's the difference between MVP and Production modes?

**A:**
- **MVP:** Lean documentation, essentials only, quick start focus (1-3 pages)
- **Production:** Comprehensive, detailed, includes edge cases and operations (5-15 pages)

### Q: How do I specify the goal mode?

**A:** 
- Explicitly: "Create PRD for MVP project" or "Generate architecture for production"
- Context: The system infers from keywords like "launch ASAP" → MVP, "production" → Production
- Ask: If unclear, the system will ask which mode you prefer

### Q: Can I change the goal mode mid-project?

**A:** Yes! Each document can have a different goal mode. For example:
- Start with MVP documents
- Later generate Production documents for the same project
- The system adapts depth accordingly

---

## Technical Questions

### Q: Where are generated documents saved?

**A:** 
- `README.md`, `PROJECT_EVALUATION.md`, `CONTRIBUTING.md` → project root
- All other documents → `docs/` directory
- The system follows your existing structure if present

### Q: What format are the documents in?

**A:** All documents are in Markdown (.md) format for:
- Easy version control
- GitHub rendering
- Easy editing
- Cross-platform compatibility

### Q: Does the system support architecture diagrams?

**A:** Yes! The system supports architecture diagrams through:
- **SYSTEM_DIAGRAMS.md** - Dedicated diagram document
- **Text descriptions** - Detailed architecture descriptions
- **ASCII art** - Simple visual diagrams
- **External tool references** - Links to Mermaid, PlantUML, Draw.io

**How to use:**
- "Create SYSTEM_DIAGRAMS.md with architecture diagrams"
- "Add component diagram to ARCHITECTURE_OVERVIEW.md"
- See `docs/ARCHITECTURE_DIAGRAMS_GUIDE.md` for complete guide

### Q: Can I use this with other documentation tools?

**A:** Yes! The Markdown format works with:
- GitHub/GitLab
- Notion, Confluence
- MkDocs, Docusaurus
- Any Markdown-compatible tool

---

## Quality & Validation

### Q: How do I ensure document quality?

**A:** 
1. Use the validation checklist (`tests/validation-checklist.md`)
2. Check quality gates (`tests/quality-gates.md`)
3. Review the self-check criteria
4. Regenerate if quality score < 7/10

### Q: What if a document doesn't meet quality standards?

**A:** 
1. Identify the issues using the quality gates
2. Provide more context or corrections
3. Regenerate the document
4. Repeat until quality score ≥ 7/10

### Q: How do I validate that the rules work correctly?

**A:** 
1. Use the test scenarios (`tests/test-scenarios.md`)
2. Run through validation checklist
3. Check example documents in `examples/` directory
4. Test with your own projects

---

## Customization & Extension

### Q: How do I add a new document type?

**A:** 
1. Add structure to `documentation_architect_reference.md`
2. Add to catalog in `.cursor/rules/document-types.mdc`
3. Create example in `examples/` directory
4. Test and validate

### Q: Can I modify the quality standards?

**A:** Yes! Edit `.cursor/rules/quality-standards.mdc` to:
- Adjust quality criteria
- Change scoring weights
- Add custom checks
- Modify pass/fail thresholds

### Q: How do I add project-specific rules?

**A:** 
1. Create new `.mdc` file in `.cursor/rules/`
2. Add project-specific guidelines
3. Reference in other rule files if needed
4. Document your customizations

---

## Troubleshooting

### Q: Documents are too generic

**A:** 
- Provide more project context
- Specify project domain and constraints
- Give examples of project-specific details
- Explicitly state what makes your project unique

### Q: Missing sections in generated document

**A:** 
- Check `documentation_architect_reference.md` for required sections
- Explicitly request missing sections
- Regenerate with section requirements
- Add sections manually if needed

### Q: Depth doesn't match my needs

**A:** 
- Explicitly state goal mode (MVP/Production/etc)
- Request "quick mode" or "deep mode"
- Specify desired depth in request
- Regenerate with depth specification

### Q: Too many [TBD] markers

**A:** 
- Gather more project information first
- Ask for specific details
- Generate template, then fill in details
- Provide context in follow-up requests

---

## Best Practices

### Q: What's the best way to get started?

**A:** 
1. Copy `.cursor/rules/` directory to your project
2. Copy knowledge base files
3. Start with the 5 recommended documents
4. Generate additional documents as needed

### Q: How often should I update documentation?

**A:** 
- **During development:** Update as features change
- **Before releases:** Review and update all docs
- **After major changes:** Regenerate affected documents
- **Regularly:** Review and improve documentation

### Q: Should I commit the rules to version control?

**A:** Yes! Commit:
- `.cursor/rules/` directory
- Knowledge base files
- Example documents
- Custom rule files

This ensures team consistency and allows versioning of documentation standards.

---

## Support & Resources

### Q: Where can I find more help?

**A:** 
- **Documentation:** See `docs/` directory
- **Examples:** See `examples/` directory
- **Troubleshooting:** See `docs/TROUBLESHOOTING.md`
- **Best Practices:** See `docs/BEST_PRACTICES.md`

### Q: How do I report issues or suggest improvements?

**A:** 
- Open an issue on GitHub
- Create a pull request with improvements
- Discuss in GitHub Discussions
- Contact the maintainers

### Q: Is there a community or forum?

**A:** 
- GitHub Discussions for questions
- GitHub Issues for bugs
- Pull requests for contributions
- Documentation for guides

---

**Have more questions? Check the troubleshooting guide or open an issue!**

