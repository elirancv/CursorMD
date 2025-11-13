# Failure Modes

Documentation of how the system reacts to various failure scenarios.

## Overview

This document describes how the Project Documentation Architect system handles different types of failures, from LLM timeouts to broken dependencies, ensuring graceful degradation and clear error reporting.

## LLM-Related Failures

### LLM Timeout

**Scenario:** LLM API call exceeds timeout limit.

**Symptoms:**
- Request hangs for extended period
- No response received
- Connection timeout error

**System Reaction:**
1. Detect timeout (typically 30-60 seconds)
2. Retry once with shorter context
3. If retry fails, provide partial result
4. Report timeout clearly to user
5. Suggest breaking request into smaller chunks

**Error Message:**
```
"Document generation timed out. This may be due to:
  - Very large context
  - Complex analysis required
  - System overload

Suggestions:
  - Try breaking into smaller requests
  - Reduce context size
  - Retry in a moment"
```

**Recovery:**
- User can retry with smaller scope
- System suggests what was successfully analyzed
- Partial document provided if available

### LLM Rate Limiting

**Scenario:** LLM API rate limit exceeded.

**Symptoms:**
- 429 status code from API
- Rate limit headers present
- Request rejected immediately

**System Reaction:**
1. Detect rate limit response
2. Calculate retry-after time
3. Queue request for later
4. Inform user of delay
5. Suggest reducing request frequency

**Error Message:**
```
"Rate limit exceeded. Please wait before retrying.
  Retry after: [timestamp]
  Current limit: [X] requests per [time period]"
```

**Recovery:**
- Automatic retry after rate limit window
- User can continue with other operations
- System tracks rate limit status

### LLM Invalid Response

**Scenario:** LLM returns malformed or invalid response.

**Symptoms:**
- Response doesn't match expected schema
- Invalid Markdown format
- Missing required sections
- Corrupted content

**System Reaction:**
1. Validate response structure
2. Detect format issues
3. Attempt to repair if minor issues
4. Request regeneration if major issues
5. Report validation errors clearly

**Error Message:**
```
"Generated document has formatting issues:
  - [specific issue]
  
  Attempting to fix automatically...
  If issues persist, regenerating document..."
```

**Recovery:**
- Automatic repair attempt
- Regeneration if repair fails
- User can request manual review

## File System Failures

### Incorrect File Placement

**Scenario:** Attempt to create file in wrong location.

**Symptoms:**
- File creation request violates rules
- Path not in allowed directories
- Root directory violation

**System Reaction:**
1. Validate path before creation
2. Reject invalid paths immediately
3. Suggest correct location
4. Ask for user confirmation
5. Never create files in wrong location

**Error Message:**
```
"Cannot create [filename] in [location].
  Allowed locations:
  - docs/ (for most documents)
  - root/ (only for README.md, PROJECT_EVALUATION.md, CONTRIBUTING.md)
  
  Should I create it at [correct location]?"
```

**Recovery:**
- User approves correct location
- File created in allowed location
- System remembers preference

### Permission Denied

**Scenario:** Insufficient permissions to create file.

**Symptoms:**
- File system permission error
- Read-only directory
- Access denied

**System Reaction:**
1. Check permissions before writing
2. Report clear permission error
3. Suggest fix (chmod, ownership, etc.)
4. Offer to show document without saving

**Error Message:**
```
"Cannot create file: Permission denied
  Location: [path]
  Issue: [specific permission problem]
  
  Solutions:
  1. Check directory permissions: chmod 755 [directory]
  2. Verify ownership: ls -la [directory]
  3. Create directory if missing: mkdir -p [directory]
  
  Would you like to see the document content without saving?"
```

**Recovery:**
- User fixes permissions
- Retry file creation
- Or view content without saving

### Disk Full

**Scenario:** No disk space available.

**Symptoms:**
- Write operation fails
- "No space left on device" error
- File creation incomplete

**System Reaction:**
1. Detect disk space issue
2. Report available space
3. Suggest cleanup options
4. Offer to show content without saving

**Error Message:**
```
"Insufficient disk space to create file.
  Available: [X] MB
  Required: [Y] MB
  
  Suggestions:
  - Free up disk space
  - Clean temporary files
  - Use different location with more space
  
  Would you like to see the document content without saving?"
```

**Recovery:**
- User frees disk space
- Retry file creation
- Or use different location

## Partial Document Generation

### Incomplete Sections

**Scenario:** Document generated but some sections incomplete.

**Symptoms:**
- Sections marked with `[TBD]`
- Missing required sections
- Incomplete content

**System Reaction:**
1. Identify incomplete sections
2. Mark clearly with `[TBD: ...]`
3. List what information is needed
4. Provide template for missing sections
5. Offer to complete later

**Error Message:**
```
"Document generated with incomplete sections:
  - [Section name]: [TBD: specific information needed]
  
  To complete:
  1. Provide missing information
  2. Request: 'Complete [section] in [document]'
  3. Or fill in [TBD] markers manually"
```

**Recovery:**
- User provides missing information
- System completes sections
- Or user fills manually

### Generation Interrupted

**Scenario:** User interrupts generation mid-process.

**Symptoms:**
- New request during generation
- User cancellation
- Process terminated

**System Reaction:**
1. Detect interruption
2. Save partial progress
3. Ask if should continue or start over
4. Provide what was generated so far

**Error Message:**
```
"Document generation interrupted.
  
  Partial content available:
  - [sections completed]
  
  Options:
  1. Continue from where stopped
  2. Start over
  3. Use partial content"
```

**Recovery:**
- Continue generation
- Start fresh
- Use partial content

## Broken Dependencies

### Missing Rule Files

**Scenario:** Required `.mdc` rule files missing or corrupted.

**Symptoms:**
- Rule file not found
- Invalid rule syntax
- Rule loading error

**System Reaction:**
1. Detect missing/corrupted files
2. List required files
3. Fall back to available rules
4. Warn about missing functionality
5. Suggest re-installation

**Error Message:**
```
"Required rule file missing: [filename]
  
  Required files:
  - .cursor/rules/core-identity.mdc
  - .cursor/rules/workflow.mdc
  - [other missing files]
  
  Some functionality may be limited.
  Please reinstall: [installation instructions]"
```

**Recovery:**
- Reinstall missing files
- System works with available rules
- Full functionality restored

### Missing Knowledge Base

**Scenario:** Knowledge base files not found.

**Symptoms:**
- Knowledge base file not found
- Reference errors
- Missing document templates

**System Reaction:**
1. Look in `docs/knowledge-base/`
2. Fall back to project root
3. Generate without knowledge base (with warning)
4. Use built-in templates if available
5. Provide installation instructions

**Error Message:**
```
"Knowledge base files not found.
  
  Expected location: docs/knowledge-base/
  Files needed:
  - documentation_architect_reference.md
  - project_evaluation_reference.md
  
  Generating with limited templates.
  For full functionality, install knowledge base files."
```

**Recovery:**
- Install knowledge base files
- System uses full templates
- Full functionality restored

### Version Mismatch

**Scenario:** Rule files and knowledge base version mismatch.

**Symptoms:**
- Incompatible versions
- Missing features
- Unexpected behavior

**System Reaction:**
1. Detect version mismatch
2. Warn about compatibility
3. Use available features
4. Suggest updating to match versions

**Error Message:**
```
"Version mismatch detected:
  - Rules version: [X]
  - Knowledge base version: [Y]
  
  Some features may not work correctly.
  Please update to matching versions."
```

**Recovery:**
- Update to matching versions
- System works correctly
- All features available

## Network Failures

### Connection Timeout

**Scenario:** Network connection fails or times out.

**Symptoms:**
- Connection timeout
- Network unreachable
- DNS resolution failure

**System Reaction:**
1. Detect network failure
2. Retry with exponential backoff
3. Report clear error
4. Suggest checking connection
5. Offer offline mode if available

**Error Message:**
```
"Network connection failed.
  
  Issue: [specific network error]
  
  Suggestions:
  - Check internet connection
  - Verify network settings
  - Retry in a moment
  
  Retrying automatically..."
```

**Recovery:**
- Connection restored
- Automatic retry succeeds
- Or user fixes network issue

## Validation Failures

### Invalid Input Schema

**Scenario:** User input doesn't match expected schema.

**Symptoms:**
- Missing required fields
- Invalid field types
- Schema validation errors

**System Reaction:**
1. Validate input early
2. Report specific validation errors
3. Suggest correct format
4. Provide example
5. Never proceed with invalid input

**Error Message:**
```
"Invalid input schema:
  - Missing required field: [field name]
  - Invalid type for [field]: expected [type], got [type]
  
  Required schema:
  [example schema]
  
  Please correct and retry."
```

**Recovery:**
- User corrects input
- Retry with valid schema
- Generation proceeds

### Document Validation Failure

**Scenario:** Generated document fails validation.

**Symptoms:**
- Missing required sections
- Invalid structure
- Content quality issues

**System Reaction:**
1. Validate document structure
2. Check required sections
3. Verify content quality
4. Regenerate if needed
5. Report validation issues

**Error Message:**
```
"Generated document validation failed:
  - Missing section: [section name]
  - Invalid structure: [issue]
  
  Regenerating with corrections..."
```

**Recovery:**
- Automatic regeneration
- Validation passes
- Document created successfully

## Best Practices for Failure Handling

### Prevention

1. **Validate Early:** Check inputs before processing
2. **Resource Checks:** Verify disk space, permissions before writing
3. **Graceful Degradation:** Continue with available functionality
4. **Clear Communication:** Always explain what went wrong and why

### Recovery Strategies

1. **Automatic Retry:** Retry transient failures
2. **Partial Results:** Provide what was successfully generated
3. **User Guidance:** Always suggest next steps
4. **Learning:** Remember failures to prevent recurrence

### Error Reporting

1. **Specific Errors:** Report exact issue, not generic errors
2. **Actionable Messages:** Tell user how to fix
3. **Context:** Include relevant details (paths, timestamps, etc.)
4. **Recovery Options:** Always provide next steps

---

**See Also:**
- `docs/EDGE_CASES.md` - Uncommon scenarios and inputs
- `docs/API_CONTRACT.md` - Error codes and schemas
- `docs/FILE_CREATION_VALIDATION.md` - File validation rules

