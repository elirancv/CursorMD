# Edge Cases

Documentation of uncommon or problematic inputs and how the system handles them.

## Overview

This document lists all edge cases, uncommon scenarios, and problematic inputs that the Project Documentation Architect system may encounter, along with how each is handled.

## Missing Data Scenarios

### Missing Project Context

**Scenario:** User requests document without providing project context.

**Edge Cases:**
- No project name provided
- No description provided
- Missing project stage
- Missing goal mode
- Partial context only

**Handling:**
1. System asks for missing information (2-5 focused questions)
2. Uses `[TBD: ...]` markers for unknown fields
3. Generates template with placeholders if user doesn't provide info
4. Never hallucinates or guesses missing information

**Example:**
```
User: "Create PRD_MVP.md"
System: "To create an accurate PRD, I need:
  1. Project name
  2. What problem does it solve?
  3. Target users
  4. Primary goal (MVP/Production/Research)?
  
  Or I can generate a template with [TBD] markers."
```

### Missing Document-Specific Information

**Scenario:** User provides project context but lacks document-specific details.

**Edge Cases:**
- Architecture doc without tech stack
- PRD without user stories
- Test plan without testing framework
- Deployment guide without infrastructure details

**Handling:**
- Generate document with `[TBD: ...]` markers
- Include notes about what information is needed
- Provide examples or templates for missing sections

## Invalid Formats

### Invalid Document Type Names

**Scenario:** User requests document with incorrect name or format.

**Edge Cases:**
- Typos: "PRD_MVP" vs "PRD-MVP" vs "prd_mvp"
- Non-existent types: "ARCHITECTURE_DOC.md"
- Wrong extensions: "VISION.txt" or "PRD_MVP.doc"
- Case variations: "vision.md" vs "VISION.md"

**Handling:**
1. Normalize input (case-insensitive matching)
2. Suggest correct document type if close match found
3. List available document types if no match
4. Use fuzzy matching for common typos

**Example:**
```
User: "Create prd-mvp.md"
System: "Did you mean PRD_MVP.md? Creating PRD_MVP.md..."
```

### Invalid File Paths

**Scenario:** User requests document in invalid location.

**Edge Cases:**
- Requesting docs in root (except allowed files)
- Requesting docs in code directories (src/, lib/, app/)
- Invalid characters in path
- Path traversal attempts (../)

**Handling:**
1. Validate path against allowed locations
2. Suggest correct location
3. Reject dangerous paths (path traversal)
4. Follow file organization rules strictly

**Example:**
```
User: "Create VISION.md in root"
System: "VISION.md should be in docs/ directory. 
  Should I create it at docs/VISION.md?"
```

## Huge Files / Large Context

### Very Large Codebases

**Scenario:** Project has massive codebase (thousands of files).

**Edge Cases:**
- Architecture doc for monorepo with 100+ packages
- Tech spec for system with 50+ microservices
- Documentation for legacy codebase (millions of lines)

**Handling:**
1. Summarize first (3-7 bullets)
2. Ask what to focus on
3. Prioritize by impact (core flows, public APIs, production paths)
4. Propose phased plan if too large
5. Don't paste huge chunks; reference and summarize

**Example:**
```
System: "This is a large codebase. I've identified:
  - Core services: Auth, Payment, User Management
  - Public APIs: REST endpoints, GraphQL schema
  - Key flows: User registration, Payment processing
  
  Which area should I focus on first?"
```

### Very Long Documents

**Scenario:** User requests very detailed/long document.

**Edge Cases:**
- Enterprise architecture doc (50+ pages)
- Comprehensive test plan (100+ test cases)
- Full API reference (500+ endpoints)

**Handling:**
1. Ask if detailed or concise version preferred
2. Offer depth modes: quick (1-3 pages), standard (5-10 pages), detailed (10-15+ pages)
3. Break into multiple documents if needed
4. Use cross-references to avoid duplication

## Unexpected User Behavior

### Rapid-Fire Requests

**Scenario:** User sends multiple requests in quick succession.

**Edge Cases:**
- 10+ document requests in 1 minute
- Interrupting generation with new request
- Requesting same document multiple times

**Handling:**
1. Rate limiting (10 requests/minute)
2. Queue requests if generation in progress
3. Suggest batch generation for multiple docs
4. Detect duplicates and ask for confirmation

### Contradictory Instructions

**Scenario:** User provides conflicting information.

**Edge Cases:**
- "MVP" goal but requests enterprise-level depth
- "Production" goal but requests quick/lean docs
- Conflicting tech stack information
- Changing goal mode mid-conversation

**Handling:**
1. Clarify contradiction
2. Ask which takes priority
3. Explain implications of each choice
4. Proceed with most recent instruction if unclear

**Example:**
```
User: "Create detailed enterprise architecture for my MVP project"
System: "I notice a contradiction: MVP goal typically uses lean docs, 
  but you requested detailed enterprise architecture. 
  Which should I prioritize?"
```

### Vague or Ambiguous Requests

**Scenario:** User request is unclear or too vague.

**Edge Cases:**
- "Create docs" (no type specified)
- "Make it better" (no specifics)
- "Add stuff" (no details)
- Multiple interpretations possible

**Handling:**
1. Ask 2-5 focused questions
2. Provide options if multiple interpretations
3. Show example of what could be generated
4. Generate draft with `[TBD]` markers if user doesn't clarify

**Example:**
```
User: "Create docs"
System: "Which document do you need? I can generate:
  - VISION.md (project vision)
  - PRD_MVP.md (product requirements)
  - ARCHITECTURE_OVERVIEW.md (system design)
  - Or any of 42 document types. Which one?"
```

## Language and Localization

### Mixed Language Input

**Scenario:** User mixes languages in request.

**Edge Cases:**
- Hebrew project name with English description
- English request for Hebrew document
- Code comments in different language
- Mixed language in same request

**Handling:**
1. Detect primary language
2. Ask which language to use if unclear
3. Default to user's language (Hebrew ↔ Hebrew, English ↔ English)
4. Maintain consistency within document

### Special Characters and Encoding

**Scenario:** Input contains special characters or encoding issues.

**Edge Cases:**
- Unicode characters in project names
- Emoji in descriptions
- Encoding issues (mojibake)
- Special characters in file paths

**Handling:**
1. Normalize encoding (UTF-8)
2. Sanitize special characters in paths
3. Preserve Unicode in content
4. Validate encoding before processing

## System Resource Limits

### Memory Constraints

**Scenario:** Very large context exceeds memory limits.

**Edge Cases:**
- Analyzing huge codebase
- Processing multiple large documents
- Long conversation history

**Handling:**
1. Summarize context instead of full copy
2. Process in chunks
3. Clear old context if needed
4. Suggest breaking into smaller requests

### Timeout Scenarios

**Scenario:** Document generation takes too long.

**Edge Cases:**
- Complex architecture analysis
- Large batch generation
- System overload

**Handling:**
1. Show progress for long operations
2. Offer to continue in background
3. Break into smaller chunks
4. Provide partial results if timeout occurs

## Invalid Rule Files

### Missing Rule Files

**Scenario:** Required `.mdc` rule files are missing.

**Edge Cases:**
- Partial installation (some files missing)
- Corrupted files
- Wrong file locations
- Version mismatch

**Handling:**
1. Detect missing files
2. List required files
3. Suggest re-installation
4. Fall back to `.cursorrules` if available

### Invalid Rule Syntax

**Scenario:** Rule files contain syntax errors.

**Edge Cases:**
- Invalid Markdown
- Broken references
- Circular dependencies
- Malformed structure

**Handling:**
1. Validate rule files on load
2. Report syntax errors clearly
3. Skip invalid rules with warning
4. Fall back to working rules

## Knowledge Base Issues

### Missing Knowledge Base Files

**Scenario:** Knowledge base files not found.

**Edge Cases:**
- Files not copied during installation
- Wrong location
- Deleted files
- Corrupted files

**Handling:**
1. Look in `docs/knowledge-base/` first
2. Fall back to project root
3. Generate without knowledge base if missing (with warning)
4. Provide installation instructions

### Outdated Knowledge Base

**Scenario:** Knowledge base version mismatch.

**Edge Cases:**
- Old knowledge base with new rules
- New knowledge base with old rules
- Missing document types in knowledge base

**Handling:**
1. Check version compatibility
2. Warn about potential issues
3. Use available information
4. Suggest updating knowledge base

## File System Issues

### Permission Errors

**Scenario:** Cannot write to target directory.

**Edge Cases:**
- Read-only file system
- Insufficient permissions
- Directory doesn't exist
- Disk full

**Handling:**
1. Check permissions before writing
2. Create directory if missing
3. Report clear error message
4. Suggest fix (chmod, create directory, etc.)

### File Already Exists

**Scenario:** Requested file already exists.

**Edge Cases:**
- Exact same name
- Case-insensitive match
- Similar name (typo)

**Handling:**
1. Detect existing file
2. Ask if should update or create new
3. Suggest versioning if needed
4. Warn about overwriting

## Best Practices for Handling Edge Cases

### Prevention

1. **Validate Early:** Check inputs before processing
2. **Clear Errors:** Provide actionable error messages
3. **Graceful Degradation:** Continue with available information
4. **User Guidance:** Always suggest next steps

### Recovery

1. **Partial Results:** Provide what was generated successfully
2. **Retry Logic:** Suggest retrying with corrections
3. **Alternative Approaches:** Offer different ways to achieve goal
4. **Learning:** Remember user preferences for future requests

---

**See Also:**
- `docs/FAILURE_MODES.md` - How system reacts to failures
- `docs/API_CONTRACT.md` - Error codes and handling
- `docs/FILE_CREATION_VALIDATION.md` - File validation rules

