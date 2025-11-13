# API Contract

Complete API contract for the Project Documentation Architect system.

## Overview

This document defines the complete API contract for interacting with the CursorMD system, including endpoints, schemas, error handling, rate limits, and versioning rules.

## API Endpoints

### Document Generation

#### Generate Single Document

**Endpoint:** `generate-document`

**Method:** AI Request (via Cursor IDE)

**Input Schema:**
```json
{
  "documentType": "VISION.md | PRD_MVP.md | ARCHITECTURE_OVERVIEW.md | ...",
  "projectContext": {
    "name": "string",
    "description": "string",
    "stage": "idea | in-development | live",
    "goalMode": "MVP | Production | Research | Dev-Tooling | Balanced",
    "techStack": ["string"]
  },
  "options": {
    "depth": "quick | standard | detailed",
    "includeExamples": boolean,
    "language": "he | en"
  }
}
```

**Output Schema:**
```json
{
  "document": {
    "content": "string (Markdown)",
    "metadata": {
      "type": "string",
      "generatedAt": "ISO 8601 timestamp",
      "projectName": "string",
      "goalMode": "string"
    }
  },
  "suggestions": ["string"],
  "nextSteps": ["string"]
}
```

#### Generate Multiple Documents

**Endpoint:** `generate-document-batch`

**Input Schema:**
```json
{
  "documents": [
    {
      "type": "string",
      "priority": "high | medium | low"
    }
  ],
  "projectContext": { /* same as above */ }
}
```

**Output Schema:**
```json
{
  "documents": [
    {
      "type": "string",
      "status": "success | partial | failed",
      "content": "string",
      "errors": ["string"]
    }
  ],
  "summary": {
    "total": number,
    "successful": number,
    "failed": number
  }
}
```

### Document Update

#### Update Existing Document

**Endpoint:** `update-document`

**Input Schema:**
```json
{
  "documentPath": "string",
  "changes": {
    "sections": {
      "sectionName": "new content"
    },
    "addSections": [
      {
        "name": "string",
        "content": "string",
        "position": "before | after | end",
        "relativeTo": "string"
      }
    ],
    "removeSections": ["string"]
  },
  "preserveFormatting": boolean
}
```

**Output Schema:**
```json
{
  "updatedDocument": {
    "content": "string",
    "changes": [
      {
        "section": "string",
        "action": "added | modified | removed"
      }
    ]
  }
}
```

### Project Evaluation

#### Evaluate Project Health

**Endpoint:** `evaluate-project`

**Input Schema:**
```json
{
  "projectPath": "string",
  "evaluationType": "full | quick | specific",
  "focusAreas": ["code-quality", "documentation", "testing", ...]
}
```

**Output Schema:**
```json
{
  "evaluation": {
    "overallScore": number,
    "categories": [
      {
        "name": "string",
        "score": number,
        "notes": "string",
        "recommendations": ["string"]
      }
    ],
    "strengths": ["string"],
    "weaknesses": ["string"],
    "nextSteps": ["string"]
  }
}
```

## Input/Output Schemas

### Document Types

**Supported Types:**
- Vision & Strategy (8 types)
- Product Requirements (6 types)
- Architecture & Design (13 types)
- Execution & Pipelines (5 types)
- Engineering (10 types)
- Governance & Enterprise (6 types)
- Business & Financial (6 types)
- Legal & Risks (3 types)
- User-Facing (6 types)
- Roadmaps (4 types)

**Total: 42 document types**

### Project Context Schema

```typescript
interface ProjectContext {
  name: string;                    // Project name
  description: string;             // 1-3 sentence description
  stage: "idea" | "in-development" | "live";
  goalMode: "MVP" | "Production" | "Research" | "Dev-Tooling" | "Balanced";
  techStack?: string[];            // Technologies used
  domain?: string;                 // Business domain
  teamSize?: number;               // Team size
  timeline?: string;               // Project timeline
}
```

### Document Metadata Schema

```typescript
interface DocumentMetadata {
  type: string;                    // Document type (e.g., "VISION.md")
  version: string;                 // Document version
  generatedAt: string;            // ISO 8601 timestamp
  generatedBy: string;             // System identifier
  projectName: string;             // Project name
  goalMode: string;                // Project goal mode
  language: "he" | "en";          // Document language
  depth: "quick" | "standard" | "detailed";
}
```

## Error Handling

### Error Response Schema

```json
{
  "error": {
    "code": "string",
    "message": "string",
    "details": "string",
    "timestamp": "ISO 8601 timestamp",
    "requestId": "string"
  }
}
```

### Error Codes

| Code | HTTP Status | Description |
|------|-------------|-------------|
| `INVALID_DOCUMENT_TYPE` | 400 | Document type not recognized |
| `MISSING_PROJECT_CONTEXT` | 400 | Required project context missing |
| `INVALID_INPUT_SCHEMA` | 400 | Input schema validation failed |
| `DOCUMENT_GENERATION_FAILED` | 500 | Document generation error |
| `KNOWLEDGE_BASE_NOT_FOUND` | 404 | Knowledge base files missing |
| `RATE_LIMIT_EXCEEDED` | 429 | Too many requests |
| `FILE_CREATION_DENIED` | 403 | File creation not allowed |
| `INVALID_FILE_PATH` | 400 | Invalid file path specified |
| `DOCUMENT_NOT_FOUND` | 404 | Document to update not found |
| `RULE_FILE_ERROR` | 500 | Error reading rule files |

### Error Handling Examples

**Invalid Document Type:**
```json
{
  "error": {
    "code": "INVALID_DOCUMENT_TYPE",
    "message": "Document type 'INVALID_TYPE.md' is not supported",
    "details": "Supported types: VISION.md, PRD_MVP.md, ARCHITECTURE_OVERVIEW.md, ...",
    "timestamp": "2025-01-XXT00:00:00Z",
    "requestId": "req-12345"
  }
}
```

**Missing Project Context:**
```json
{
  "error": {
    "code": "MISSING_PROJECT_CONTEXT",
    "message": "Project context is required for document generation",
    "details": "Please provide: name, description, stage, goalMode",
    "timestamp": "2025-01-XXT00:00:00Z",
    "requestId": "req-12346"
  }
}
```

## Rate Limits

### Rate Limit Rules

- **Document Generation:** 10 requests per minute per project
- **Document Updates:** 20 requests per minute per project
- **Project Evaluation:** 5 requests per hour per project
- **Batch Operations:** 2 requests per minute per project

### Rate Limit Headers

```
X-RateLimit-Limit: 10
X-RateLimit-Remaining: 7
X-RateLimit-Reset: 1640995200
```

### Rate Limit Exceeded Response

```json
{
  "error": {
    "code": "RATE_LIMIT_EXCEEDED",
    "message": "Rate limit exceeded. Please wait before retrying.",
    "details": "Limit: 10 requests/minute. Retry after: 2025-01-XXT00:01:00Z",
    "timestamp": "2025-01-XXT00:00:00Z",
    "requestId": "req-12347"
  }
}
```

## Versioning Rules

### API Versioning

**Current Version:** `v1.0`

**Version Format:** `v{major}.{minor}`

- **Major version:** Breaking changes (incompatible API changes)
- **Minor version:** New features (backward compatible)

### Version Header

```
X-API-Version: v1.0
```

### Versioning Strategy

1. **Backward Compatibility:** Minor versions maintain backward compatibility
2. **Deprecation Notice:** Breaking changes announced 3 months in advance
3. **Migration Guide:** Provided for major version upgrades
4. **Support Period:** Previous major version supported for 6 months

### Document Versioning

Documents include version metadata:

```markdown
---
version: 1.0
lastUpdated: 2025-01-XX
---
```

**Version Increment Rules:**
- **Major:** Significant structural changes
- **Minor:** Content updates, additions
- **Patch:** Typo fixes, formatting

## Best Practices

### Request Best Practices

1. **Provide Complete Context:** Include all required project context fields
2. **Specify Goal Mode:** Always specify project goal mode for appropriate depth
3. **Use Appropriate Depth:** Choose depth based on project stage
4. **Batch Operations:** Use batch endpoints for multiple documents
5. **Handle Errors:** Implement proper error handling and retry logic

### Response Best Practices

1. **Validate Output:** Always validate generated documents
2. **Check Metadata:** Review document metadata for accuracy
3. **Follow Suggestions:** Consider system suggestions for improvements
4. **Review Next Steps:** Follow recommended next steps

## Security Considerations

### File Path Validation

- All file paths validated before creation
- Only allowed paths accepted (docs/ for most documents)
- Root directory restricted (only README.md, PROJECT_EVALUATION.md, CONTRIBUTING.md)

### Input Sanitization

- All user inputs sanitized
- No code execution in document content
- Markdown-only output

### Access Control

- File creation requires explicit user approval
- Read-only access to rule files
- Knowledge base files read-only

## Examples

### Example: Generate VISION.md

**Request:**
```
"Create VISION.md for my SaaS project - Task Management for small teams, 
using Node.js and MongoDB, MVP goal is to validate the idea"
```

**Response:**
- Document content (Markdown)
- Metadata with project context
- Suggestions for next documents
- Recommended next steps

### Example: Update Document

**Request:**
```
"Update PRD_MVP.md - add new feature: real-time collaboration"
```

**Response:**
- Updated document content
- List of changes made
- Suggestions for related updates

---

**See Also:**
- `docs/FILE_CREATION_VALIDATION.md` - File creation rules
- `docs/EDGE_CASES.md` - Edge case handling
- `docs/FAILURE_MODES.md` - Failure handling

