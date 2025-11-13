# File Creation Validation

Rules for safe file creation in the Project Documentation Architect system.

## Overview

This document defines the rules for safe file creation, including when the AI may create files, confirmations required, naming conventions, allowed paths, and how to reject invalid or dangerous file operations.

## File Creation Rules

### When AI May Create Files

**Allowed Scenarios:**

1. **Explicit User Request:**
   - User says "create", "write", "save", "generate file"
   - User explicitly approves after seeing summary
   - Context clearly indicates file creation intent

2. **Update Existing File:**
   - User requests update to existing file
   - File path is valid and writable
   - User has approved the update

3. **Standard Document Types:**
   - Any of the 42 supported document types
   - File goes to correct location (docs/ or allowed root files)
   - User has provided project context

**Not Allowed:**

1. **Without User Approval:**
   - Never create files without explicit approval
   - Never create files when user just wants to see content
   - Never create files in response to "show me" or "what would X look like"

2. **In Forbidden Locations:**
   - Never create files in code directories (src/, lib/, app/)
   - Never create files in system directories (.git/, .vscode/)
   - Never create files in forbidden paths

3. **Invalid Operations:**
   - Never create files with invalid names
   - Never create files with dangerous content
   - Never create files that violate security rules

## Confirmation Requirements

### Standard Confirmation Flow

**Step 1: Show Summary**
```typescript
function showFileSummary(path: string, content: string): void {
  const summary = {
    path: path,
    title: extractTitle(content),
    sections: extractSections(content),
    wordCount: countWords(content),
    size: content.length
  };
  
  displaySummary(summary);
}
```

**Step 2: Request Confirmation**
```typescript
async function requestConfirmation(path: string): Promise<boolean> {
  const response = await askUser(
    `Should I create this file at ${path}?`,
    {
      options: ["yes", "no", "show-full", "change-location"]
    }
  );
  
  return response === "yes";
}
```

**Step 3: Validate Before Creation**
```typescript
async function createFileWithValidation(
  path: string,
  content: string
): Promise<FileCreationResult> {
  // Validate path
  const pathValidation = validatePath(path);
  if (!pathValidation.valid) {
    return {
      success: false,
      error: pathValidation.issue,
      suggestion: pathValidation.suggestion
    };
  }
  
  // Validate content
  const contentValidation = validateContent(content);
  if (!contentValidation.valid) {
    return {
      success: false,
      error: "Content validation failed",
      issues: contentValidation.issues
    };
  }
  
  // Request confirmation
  const confirmed = await requestConfirmation(path);
  if (!confirmed) {
    return {
      success: false,
      error: "User declined file creation"
    };
  }
  
  // Create file
  await writeFile(path, content);
  
  return {
    success: true,
    path: path
  };
}
```

### Exception: Explicit Creation Requests

**Rule:** If user explicitly requests creation, proceed with validation but still show summary.

**Implementation:**
```typescript
function shouldSkipConfirmation(request: string): boolean {
  const explicitKeywords = ["create", "write", "save", "generate file"];
  const hasExplicitKeyword = explicitKeywords.some(keyword =>
    request.toLowerCase().includes(keyword)
  );
  
  // Still show summary, but can proceed faster
  return hasExplicitKeyword;
}
```

## Naming Conventions

### Document File Names

**UPPERCASE for Important Docs:**
- `VISION.md`
- `PRD_MVP.md`
- `ARCHITECTURE_OVERVIEW.md`
- `TECH_SPEC_MVP.md`
- `PROJECT_EVALUATION.md`

**kebab-case for Guides:**
- `quick-start-guide.md`
- `api-reference.md`
- `troubleshooting.md`
- `installation-guide.md`

**Rules:**
1. **No Spaces:** Use underscores or hyphens
2. **Clear Names:** Name should indicate purpose
3. **Consistent:** Use same pattern throughout project
4. **Valid Characters:** Only letters, numbers, hyphens, underscores

### Validation

```typescript
function validateFileName(name: string): ValidationResult {
  // Check for spaces
  if (name.includes(' ')) {
    return {
      valid: false,
      issue: "File name contains spaces",
      suggestion: name.replace(/ /g, '-')
    };
  }
  
  // Check for invalid characters
  const invalidChars = /[<>:"|?*\x00-\x1f]/;
  if (invalidChars.test(name)) {
    return {
      valid: false,
      issue: "File name contains invalid characters",
      suggestion: "Remove invalid characters"
    };
  }
  
  // Check extension
  if (!name.endsWith('.md')) {
    return {
      valid: false,
      issue: "File must have .md extension",
      suggestion: `${name}.md`
    };
  }
  
  // Check length
  if (name.length > 255) {
    return {
      valid: false,
      issue: "File name too long (max 255 characters)",
      suggestion: "Use shorter name"
    };
  }
  
  return {
    valid: true
  };
}
```

## Allowed Paths

### Documentation Directory

**Primary Location:** `docs/`

**Allowed Files:**
- All 42 document types
- Guides and tutorials
- Reference documentation
- Any documentation files

**Examples:**
```
docs/VISION.md
docs/PRD_MVP.md
docs/ARCHITECTURE_OVERVIEW.md
docs/guides/quick-start.md
docs/api/reference.md
```

### Root Directory (Limited)

**Allowed Files Only:**
- `README.md`
- `PROJECT_EVALUATION.md`
- `CONTRIBUTING.md`
- `CHANGELOG.md`
- `LICENSE`

**Not Allowed:**
- Any other `.md` files
- Documentation files
- Architecture documents
- Technical specs

### Forbidden Paths

**Never Create Files In:**
```
src/              # Source code
lib/              # Libraries
app/              # Application code
node_modules/     # Dependencies
.git/             # Git files
.vscode/          # IDE config
.cursor/rules/    # Rule files (read-only)
```

### Path Validation

```typescript
function validatePath(path: string): ValidationResult {
  // Check for path traversal
  if (path.includes('..')) {
    return {
      valid: false,
      issue: "Path traversal detected",
      reason: "Paths cannot contain '..'"
    };
  }
  
  // Check if forbidden
  if (isForbiddenPath(path)) {
    return {
      valid: false,
      issue: "Path is in forbidden directory",
      suggestion: suggestCorrectPath(path)
    };
  }
  
  // Check if writable
  if (!isWritablePath(path)) {
    return {
      valid: false,
      issue: "Path is not writable",
      suggestion: suggestCorrectPath(path)
    };
  }
  
  // Check if absolute path
  if (isAbsolutePath(path)) {
    return {
      valid: false,
      issue: "Absolute paths not allowed",
      suggestion: "Use relative paths"
    };
  }
  
  return {
    valid: true
  };
}
```

## Rejecting Invalid Operations

### Invalid Path Detection

**Checks:**
1. Path traversal (`../`)
2. Forbidden directories
3. Non-writable locations
4. Absolute paths
5. Invalid characters

**Response:**
```typescript
function rejectInvalidPath(path: string): RejectionResponse {
  return {
    allowed: false,
    reason: "Invalid path",
    issue: identifyPathIssue(path),
    suggestion: suggestCorrectPath(path),
    alternatives: suggestAlternatives(path)
  };
}
```

### Invalid Content Detection

**Checks:**
1. Executable code
2. File size limits
3. Encoding issues
4. Security violations

**Response:**
```typescript
function rejectInvalidContent(content: string): RejectionResponse {
  return {
    allowed: false,
    reason: "Invalid content",
    issues: validateContent(content).issues,
    suggestion: "Remove invalid content or use safe alternatives"
  };
}
```

### Dangerous Operations

**Detect Dangerous Patterns:**
1. Rapid file creation (>10 files/minute)
2. Large files (>1MB)
3. System file modification
4. Permission escalation attempts

**Response:**
```typescript
function rejectDangerousOperation(operation: FileOperation): RejectionResponse {
  return {
    allowed: false,
    reason: "Dangerous operation detected",
    issue: identifyDanger(operation),
    suggestion: "This operation is not allowed for security reasons",
    alert: true  // Alert security team
  };
}
```

## Security Considerations

### Input Sanitization

**Sanitize All Inputs:**
```typescript
function sanitizeInput(input: string): string {
  // Remove null bytes
  input = input.replace(/\x00/g, '');
  
  // Normalize encoding
  input = Buffer.from(input, 'utf8').toString('utf8');
  
  // Remove control characters (except newlines and tabs)
  input = input.replace(/[\x00-\x08\x0B-\x0C\x0E-\x1F\x7F]/g, '');
  
  return input;
}
```

### Content Validation

**Validate Content Before Creation:**
```typescript
function validateContentForCreation(content: string): ValidationResult {
  const issues: string[] = [];
  
  // Check size (max 1MB)
  if (content.length > 1024 * 1024) {
    issues.push("File too large (max 1MB)");
  }
  
  // Check for executable code
  const executablePatterns = [
    /<script[^>]*>/i,
    /eval\s*\(/i,
    /exec\s*\(/i,
    /system\s*\(/i,
    /`[^`]*\$\{[^}]*\}[^`]*`/  // Template literals with expressions
  ];
  
  for (const pattern of executablePatterns) {
    if (pattern.test(content)) {
      issues.push("Content contains potentially executable code");
      break;
    }
  }
  
  // Check encoding
  try {
    Buffer.from(content, 'utf8').toString('utf8');
  } catch (e) {
    issues.push("Invalid UTF-8 encoding");
  }
  
  return {
    valid: issues.length === 0,
    issues: issues
  };
}
```

### Operation Logging

**Log All Operations:**
```typescript
interface FileOperationLog {
  operation: "create" | "update" | "delete" | "read";
  path: string;
  timestamp: string;
  user: string;
  approved: boolean;
  contentHash?: string;
  error?: string;
}

function logFileOperation(operation: FileOperationLog): void {
  // Log to secure log file
  appendToSecureLog(operation);
  
  // Alert on suspicious operations
  if (isSuspiciousOperation(operation)) {
    alertSecurityTeam(operation);
  }
}
```

## Best Practices

### For AI Agents

1. **Always Validate:** Validate paths and content before creation
2. **Request Approval:** Always request user approval
3. **Show Summary:** Show document summary before creation
4. **Handle Errors:** Gracefully handle and report errors
5. **Log Operations:** Log all file operations

### For Users

1. **Review Summaries:** Review document summaries before approval
2. **Check Paths:** Verify file paths are correct
3. **Report Issues:** Report any security concerns
4. **Follow Conventions:** Follow naming conventions

---

**See Also:**
- `docs/AGENT_SANDBOX_RULES.md` - Sandbox rules
- `docs/FAILURE_MODES.md` - Failure handling
- `docs/API_CONTRACT.md` - API specifications

