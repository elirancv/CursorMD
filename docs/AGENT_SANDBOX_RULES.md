# Agent Sandbox Rules

Operational boundaries and safety rules for AI agents in the Project Documentation Architect system.

## Overview

This document defines the operational boundaries for each agent, including which directories are writable, which files are read-only, approval flows before creating new files, and safety checks.

## Sandbox Architecture

### Sandbox Principles

1. **Least Privilege:** Agents have minimum required permissions
2. **Explicit Approval:** File creation requires explicit user approval
3. **Read-Only Default:** Most files are read-only by default
4. **Audit Trail:** All operations are logged

### Sandbox Levels

**Level 1: Read-Only**
- Can read files
- Cannot modify files
- Cannot create files

**Level 2: Controlled Write**
- Can read files
- Can create files in approved directories
- Requires approval for each file creation

**Level 3: Full Access** (Not used for agents)
- Full read/write access
- Reserved for user operations

## Directory Permissions

### Read-Only Directories

**Rule:** Agents cannot modify files in these directories.

**Directories:**
```
.cursor/rules/          # Rule files - READ ONLY
docs/knowledge-base/    # Knowledge base - READ ONLY
scripts/               # Installation scripts - READ ONLY
tests/                 # Test files - READ ONLY
```

**Rationale:**
- Rule files define agent behavior - must not be modified
- Knowledge base is reference material - should remain stable
- Scripts and tests are system files - agents shouldn't modify

**Implementation:**
```typescript
const READ_ONLY_DIRS = [
  '.cursor/rules',
  'docs/knowledge-base',
  'scripts',
  'tests'
];

function isReadOnly(path: string): boolean {
  return READ_ONLY_DIRS.some(dir => path.startsWith(dir));
}
```

### Writable Directories

**Rule:** Agents can create files in these directories with approval.

**Directories:**
```
docs/                  # Documentation files - WRITABLE (with approval)
  - VISION.md
  - PRD_MVP.md
  - ARCHITECTURE_OVERVIEW.md
  - ... (all document types)
```

**Root Directory (Limited):**
```
README.md              # Allowed
PROJECT_EVALUATION.md  # Allowed
CONTRIBUTING.md        # Allowed
CHANGELOG.md           # Allowed
```

**Rationale:**
- Documentation files are the primary output
- Root directory limited to core project files
- All other files must go in `docs/`

**Implementation:**
```typescript
const WRITABLE_DIRS = [
  'docs'
];

const ALLOWED_ROOT_FILES = [
  'README.md',
  'PROJECT_EVALUATION.md',
  'CONTRIBUTING.md',
  'CHANGELOG.md'
];

function isWritable(path: string): boolean {
  // Check if in writable directory
  if (WRITABLE_DIRS.some(dir => path.startsWith(dir))) {
    return true;
  }
  
  // Check if allowed root file
  const fileName = path.split('/').pop();
  if (path === fileName && ALLOWED_ROOT_FILES.includes(fileName)) {
    return true;
  }
  
  return false;
}
```

### Forbidden Directories

**Rule:** Agents cannot access these directories.

**Directories:**
```
src/                   # Source code - FORBIDDEN
lib/                   # Libraries - FORBIDDEN
app/                   # Application code - FORBIDDEN
node_modules/          # Dependencies - FORBIDDEN
.git/                  # Git files - FORBIDDEN
.vscode/               # IDE config - FORBIDDEN
```

**Rationale:**
- Code directories are off-limits to documentation agents
- Prevents accidental code modification
- Maintains separation of concerns

**Implementation:**
```typescript
const FORBIDDEN_DIRS = [
  'src',
  'lib',
  'app',
  'node_modules',
  '.git',
  '.vscode'
];

function isForbidden(path: string): boolean {
  return FORBIDDEN_DIRS.some(dir => path.startsWith(dir));
}
```

## File Creation Rules

### Approval Flow

**Step 1: Validation**
```typescript
function validateFileCreation(path: string, content: string): ValidationResult {
  // Check if path is forbidden
  if (isForbidden(path)) {
    return {
      allowed: false,
      reason: "Path is in forbidden directory"
    };
  }
  
  // Check if path is writable
  if (!isWritable(path)) {
    return {
      allowed: false,
      reason: "Path is not writable",
      suggestion: suggestCorrectPath(path)
    };
  }
  
  // Check if file already exists
  if (fileExists(path)) {
    return {
      allowed: false,
      reason: "File already exists",
      suggestion: "Update existing file instead"
    };
  }
  
  // Validate content
  const contentValidation = validateContent(content);
  if (!contentValidation.valid) {
    return {
      allowed: false,
      reason: "Content validation failed",
      issues: contentValidation.issues
    };
  }
  
  return {
    allowed: true
  };
}
```

**Step 2: User Approval**
```typescript
async function requestFileCreationApproval(
  path: string,
  content: string
): Promise<ApprovalResult> {
  // Show document summary
  const summary = generateSummary(content);
  
  // Ask for approval
  const approval = await askUser(
    `Should I create this file at ${path}?`,
    {
      showSummary: true,
      summary: summary,
      options: ["yes", "no", "show-full"]
    }
  );
  
  return approval;
}
```

**Step 3: Creation**
```typescript
async function createFileWithApproval(
  path: string,
  content: string
): Promise<FileCreationResult> {
  // Validate
  const validation = validateFileCreation(path, content);
  if (!validation.allowed) {
    return {
      success: false,
      error: validation.reason,
      suggestion: validation.suggestion
    };
  }
  
  // Request approval
  const approval = await requestFileCreationApproval(path, content);
  if (!approval.approved) {
    return {
      success: false,
      error: "User declined file creation"
    };
  }
  
  // Create file
  await writeFile(path, content);
  
  // Log operation
  logFileCreation(path, content.length);
  
  return {
    success: true,
    path: path
  };
}
```

### Naming Conventions

**Rule:** File names must follow conventions.

**Conventions:**
- **UPPERCASE** for important docs: `VISION.md`, `PRD_MVP.md`
- **kebab-case** for guides: `quick-start-guide.md`, `api-reference.md`
- **No spaces:** Use underscores or hyphens
- **Clear names:** Name indicates purpose

**Validation:**
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
  const invalidChars = /[<>:"|?*]/;
  if (invalidChars.test(name)) {
    return {
      valid: false,
      issue: "File name contains invalid characters"
    };
  }
  
  // Check extension
  if (!name.endsWith('.md')) {
    return {
      valid: false,
      issue: "File must have .md extension"
    };
  }
  
  return {
    valid: true
  };
}
```

### Path Validation

**Rule:** File paths must be validated before creation.

**Checks:**
1. Path traversal prevention (`../`)
2. Absolute path detection
3. Directory existence
4. Path length limits

**Implementation:**
```typescript
function validatePath(path: string): ValidationResult {
  // Prevent path traversal
  if (path.includes('..')) {
    return {
      valid: false,
      issue: "Path traversal detected",
      reason: "Paths cannot contain '..'"
    };
  }
  
  // Check if absolute path
  if (path.startsWith('/') || /^[A-Z]:/.test(path)) {
    return {
      valid: false,
      issue: "Absolute paths not allowed",
      suggestion: "Use relative paths"
    };
  }
  
  // Check path length
  if (path.length > 260) {
    return {
      valid: false,
      issue: "Path too long",
      suggestion: "Use shorter path"
    };
  }
  
  // Ensure directory exists
  const dir = path.substring(0, path.lastIndexOf('/'));
  if (dir && !directoryExists(dir)) {
    return {
      valid: false,
      issue: "Directory does not exist",
      suggestion: `Create directory: ${dir}`
    };
  }
  
  return {
    valid: true
  };
}
```

## Safety Checks

### Content Validation

**Rule:** File content must be validated before creation.

**Checks:**
1. **Markdown Format:** Valid Markdown syntax
2. **No Code Execution:** No executable code
3. **Size Limits:** Reasonable file size
4. **Encoding:** Valid UTF-8 encoding

**Implementation:**
```typescript
function validateContent(content: string): ValidationResult {
  const issues: string[] = [];
  
  // Check size (max 1MB)
  if (content.length > 1024 * 1024) {
    issues.push("File too large (max 1MB)");
  }
  
  // Check for executable code
  const executablePatterns = [
    /<script/i,
    /eval\(/i,
    /exec\(/i,
    /system\(/i
  ];
  
  for (const pattern of executablePatterns) {
    if (pattern.test(content)) {
      issues.push("Content contains potentially executable code");
      break;
    }
  }
  
  // Check encoding
  try {
    // Try to decode as UTF-8
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

**Rule:** All file operations must be logged.

**Logged Information:**
- Operation type (create, update, delete)
- File path
- Timestamp
- Agent ID
- User approval status
- Content hash (for integrity)

**Implementation:**
```typescript
interface FileOperationLog {
  operation: "create" | "update" | "delete" | "read";
  path: string;
  timestamp: string;
  agentId: string;
  approved: boolean;
  contentHash?: string;
  error?: string;
}

function logFileOperation(operation: FileOperationLog): void {
  // Log to file or database
  appendToLog(operation);
  
  // Alert on suspicious operations
  if (isSuspiciousOperation(operation)) {
    alertSecurityTeam(operation);
  }
}
```

### Suspicious Operation Detection

**Rule:** Detect and prevent suspicious operations.

**Suspicious Patterns:**
1. Rapid file creation (>10 files/minute)
2. Large file creation (>100KB)
3. Creation in forbidden directories
4. Path traversal attempts
5. Executable content

**Implementation:**
```typescript
function isSuspiciousOperation(operation: FileOperationLog): boolean {
  // Check rate
  const recentOperations = getRecentOperations(operation.agentId, '1 minute');
  if (recentOperations.length > 10) {
    return true;
  }
  
  // Check path
  if (isForbidden(operation.path)) {
    return true;
  }
  
  // Check content size
  if (operation.contentHash && getContentSize(operation.contentHash) > 100 * 1024) {
    return true;
  }
  
  return false;
}
```

## Approval Flow Before Creating New Files

### Standard Approval Flow

**Step 1: Show Summary**
```typescript
function showDocumentSummary(content: string): void {
  const summary = {
    title: extractTitle(content),
    sections: extractSections(content),
    wordCount: countWords(content),
    estimatedReadTime: estimateReadTime(content)
  };
  
  displaySummary(summary);
}
```

**Step 2: Request Approval**
```typescript
async function requestApproval(path: string, summary: Summary): Promise<boolean> {
  const response = await askUser(
    `Should I create this file at ${path}?`,
    {
      summary: summary,
      options: ["yes", "no", "show-full", "change-location"]
    }
  );
  
  return response === "yes";
}
```

**Step 3: Handle Response**
```typescript
async function handleApprovalResponse(
  response: string,
  path: string,
  content: string
): Promise<FileCreationResult> {
  switch (response) {
    case "yes":
      return await createFile(path, content);
    
    case "no":
      return {
        success: false,
        error: "User declined"
      };
    
    case "show-full":
      showFullContent(content);
      return await requestApproval(path, generateSummary(content));
    
    case "change-location":
      const newPath = await askForNewPath();
      return await createFileWithApproval(newPath, content);
    
    default:
      return {
        success: false,
        error: "Invalid response"
      };
  }
}
```

### Exception: Explicit Creation Requests

**Rule:** If user explicitly says "create", "write", "save", proceed with approval.

**Implementation:**
```typescript
function shouldAutoApprove(request: string): boolean {
  const explicitKeywords = ["create", "write", "save", "generate file"];
  return explicitKeywords.some(keyword => 
    request.toLowerCase().includes(keyword)
  );
}
```

## Best Practices

### Agent Safety

1. **Always Validate:** Validate paths and content before operations
2. **Request Approval:** Always request approval for file creation
3. **Log Operations:** Log all file operations
4. **Handle Errors:** Gracefully handle errors and report clearly

### User Experience

1. **Show Summary:** Always show document summary before creation
2. **Clear Messages:** Provide clear error messages and suggestions
3. **Respect Choices:** Respect user's choice to not create files
4. **Suggest Alternatives:** Suggest alternatives when operations fail

---

**See Also:**
- `docs/AGENT_PROTOCOL.md` - Agent communication protocol
- `docs/FILE_CREATION_VALIDATION.md` - File validation rules
- `docs/FAILURE_MODES.md` - Failure handling

