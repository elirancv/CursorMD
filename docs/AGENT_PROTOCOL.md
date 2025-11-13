# Agent Protocol

Standard communication protocol for AI agents in the Project Documentation Architect system.

## Overview

This document defines the standard protocol for communication between AI agents, including input/output schemas, coordination rules, advisor review logic, and the rejection → refinement flow.

## Agent Architecture

### Agent Types

1. **Document Generator Agent:** Generates documentation documents
2. **Reviewer Agent:** Reviews and validates generated documents
3. **Advisor Agent:** Provides guidance and suggestions
4. **Coordinator Agent:** Coordinates multiple agents

### Agent Communication Flow

```
User Request
    ↓
Coordinator Agent
    ↓
Document Generator Agent → Reviewer Agent
    ↓                        ↓
    └──────────→ Advisor Agent
                    ↓
              Final Document
```

## Input Schema

### Standard Agent Input

```typescript
interface AgentInput {
  // Request identification
  requestId: string;
  timestamp: string;
  
  // Agent context
  agentType: "generator" | "reviewer" | "advisor" | "coordinator";
  agentId: string;
  
  // Task definition
  task: {
    type: string;                    // Task type (e.g., "generate-document")
    documentType?: string;           // Document type if applicable
    priority: "high" | "medium" | "low";
    deadline?: string;               // Optional deadline
  };
  
  // Project context
  projectContext: {
    name: string;
    description: string;
    stage: "idea" | "in-development" | "live";
    goalMode: "MVP" | "Production" | "Research" | "Dev-Tooling" | "Balanced";
    techStack?: string[];
  };
  
  // Input data
  input: {
    content?: string;                 // Content to process
    metadata?: Record<string, any>;  // Additional metadata
    previousOutput?: AgentOutput;     // Previous agent output
  };
  
  // Constraints
  constraints: {
    maxLength?: number;
    requiredSections?: string[];
    forbiddenContent?: string[];
    style?: "formal" | "casual" | "technical";
  };
  
  // Coordination
  coordination: {
    parentRequestId?: string;        // Parent request if sub-task
    dependentTasks?: string[];       // Task IDs this depends on
    notifyAgents?: string[];          // Agents to notify on completion
  };
}
```

### Document Generator Input

```typescript
interface DocumentGeneratorInput extends AgentInput {
  agentType: "generator";
  task: {
    type: "generate-document";
    documentType: string;            // e.g., "VISION.md"
  };
  input: {
    template?: string;                // Template to use
    examples?: string[];              // Example documents
  };
  constraints: {
    requiredSections: string[];      // Required sections
    depth: "quick" | "standard" | "detailed";
  };
}
```

### Reviewer Input

```typescript
interface ReviewerInput extends AgentInput {
  agentType: "reviewer";
  task: {
    type: "review-document";
  };
  input: {
    content: string;                  // Document to review
    documentType: string;
    qualityCriteria: QualityCriteria;
  };
}
```

### Advisor Input

```typescript
interface AdvisorInput extends AgentInput {
  agentType: "advisor";
  task: {
    type: "provide-guidance";
  };
  input: {
    question: string;                 // User question or request
    context?: string;                 // Relevant context
    options?: string[];               // Options to choose from
  };
}
```

## Output Schema

### Standard Agent Output

```typescript
interface AgentOutput {
  // Response identification
  requestId: string;
  agentId: string;
  timestamp: string;
  
  // Status
  status: "success" | "partial" | "failed" | "needs-review";
  
  // Output data
  output: {
    content?: string;                 // Generated content
    metadata?: Record<string, any>;  // Additional metadata
    suggestions?: string[];           // Suggestions for improvement
    warnings?: string[];              // Warnings
    errors?: string[];                // Errors if failed
  };
  
  // Quality metrics
  quality: {
    score?: number;                   // Quality score (0-10)
    completeness?: number;            // Completeness (0-100%)
    accuracy?: number;                 // Accuracy (0-100%)
    issues?: QualityIssue[];           // Quality issues found
  };
  
  // Next steps
  nextSteps: {
    recommended?: string[];            // Recommended next actions
    required?: string[];              // Required actions before proceeding
  };
  
  // Coordination
  coordination: {
    childTasks?: string[];            // Sub-tasks created
    notifyAgents?: string[];          // Agents notified
    dependencies?: string[];           // Dependencies resolved
  };
}
```

### Document Generator Output

```typescript
interface DocumentGeneratorOutput extends AgentOutput {
  output: {
    content: string;                  // Generated document (Markdown)
    metadata: {
      documentType: string;
      sections: string[];            // Sections included
      wordCount: number;
      estimatedReadTime: number;     // Minutes
    };
    suggestions: string[];            // Improvement suggestions
  };
  quality: {
    score: number;                    // Document quality score
    completeness: number;             // Section completeness
    issues: QualityIssue[];           // Quality issues
  };
}
```

### Reviewer Output

```typescript
interface ReviewerOutput extends AgentOutput {
  output: {
    review: {
      approved: boolean;              // Whether document approved
      issues: ReviewIssue[];          // Issues found
      suggestions: string[];          // Improvement suggestions
      score: number;                  // Review score
    };
  };
  quality: {
    score: number;                    // Quality score
    issues: QualityIssue[];           // Quality issues
  };
}
```

### Advisor Output

```typescript
interface AdvisorOutput extends AgentOutput {
  output: {
    guidance: {
      answer: string;                 // Answer or guidance
      reasoning: string;              // Reasoning behind answer
      alternatives?: string[];        // Alternative options
      recommendations?: string[];    // Recommendations
    };
  };
}
```

## Coordination Rules

### Task Dependencies

**Rule:** Tasks with dependencies must wait for dependencies to complete.

**Implementation:**
```typescript
async function executeWithDependencies(
  task: AgentInput,
  dependencyGraph: DependencyGraph
): Promise<AgentOutput> {
  // Wait for dependencies
  await waitForDependencies(task.coordination.dependentTasks);
  
  // Execute task
  const output = await executeTask(task);
  
  // Notify dependent tasks
  notifyDependentTasks(task.requestId, output);
  
  return output;
}
```

### Parallel Execution

**Rule:** Independent tasks can execute in parallel.

**Implementation:**
```typescript
async function executeParallel(
  tasks: AgentInput[]
): Promise<AgentOutput[]> {
  // Group by dependencies
  const groups = groupByDependencies(tasks);
  
  // Execute groups sequentially, tasks in parallel
  const results: AgentOutput[] = [];
  for (const group of groups) {
    const groupResults = await Promise.all(
      group.map(task => executeTask(task))
    );
    results.push(...groupResults);
  }
  
  return results;
}
```

### Resource Sharing

**Rule:** Agents share project context and knowledge base.

**Implementation:**
```typescript
class SharedContext {
  private projectContext: ProjectContext;
  private knowledgeBase: KnowledgeBase;
  
  getProjectContext(): ProjectContext {
    return this.projectContext;
  }
  
  getKnowledgeBase(): KnowledgeBase {
    return this.knowledgeBase;
  }
}
```

## Advisor Review Logic

### Review Criteria

**Quality Criteria:**
1. **Completeness:** All required sections present
2. **Accuracy:** Information correct and up-to-date
3. **Clarity:** Clear and understandable
4. **Consistency:** Consistent terminology and style
5. **Relevance:** Content relevant to project

### Review Process

**Step 1: Initial Review**
```typescript
function initialReview(document: Document): ReviewResult {
  const issues: ReviewIssue[] = [];
  
  // Check completeness
  const missingSections = checkRequiredSections(document);
  if (missingSections.length > 0) {
    issues.push({
      type: "missing-sections",
      severity: "high",
      sections: missingSections
    });
  }
  
  // Check quality
  const qualityScore = assessQuality(document);
  
  return {
    approved: issues.length === 0 && qualityScore >= 7,
    issues,
    score: qualityScore
  };
}
```

**Step 2: Detailed Review**
```typescript
function detailedReview(document: Document): DetailedReview {
  const review: DetailedReview = {
    sections: {},
    overall: {
      score: 0,
      issues: []
    }
  };
  
  // Review each section
  for (const section of document.sections) {
    review.sections[section.name] = {
      score: reviewSection(section),
      issues: findSectionIssues(section),
      suggestions: generateSuggestions(section)
    };
  }
  
  // Calculate overall score
  review.overall.score = calculateOverallScore(review.sections);
  
  return review;
}
```

### Approval Thresholds

| Document Type | Minimum Score | Required Sections |
|--------------|---------------|-------------------|
| VISION.md | 7/10 | All core sections |
| PRD_MVP.md | 8/10 | All required sections |
| ARCHITECTURE_OVERVIEW.md | 8/10 | All architectural sections |
| Technical Docs | 7/10 | All technical sections |

## Rejection → Refinement Flow

### Rejection Process

**Step 1: Identify Issues**
```typescript
function identifyIssues(review: ReviewOutput): Issue[] {
  return review.output.review.issues.filter(
    issue => issue.severity === "high" || issue.severity === "medium"
  );
}
```

**Step 2: Categorize Issues**
```typescript
function categorizeIssues(issues: Issue[]): CategorizedIssues {
  return {
    critical: issues.filter(i => i.severity === "high"),
    important: issues.filter(i => i.severity === "medium"),
    minor: issues.filter(i => i.severity === "low")
  };
}
```

**Step 3: Generate Refinement Plan**
```typescript
function generateRefinementPlan(issues: CategorizedIssues): RefinementPlan {
  return {
    steps: [
      {
        priority: "high",
        action: "fix-critical-issues",
        issues: issues.critical,
        estimatedTime: "5-10 minutes"
      },
      {
        priority: "medium",
        action: "address-important-issues",
        issues: issues.important,
        estimatedTime: "10-15 minutes"
      }
    ],
    suggestions: generateSuggestions(issues)
  };
}
```

### Refinement Process

**Step 1: Fix Critical Issues**
```typescript
async function refineDocument(
  document: Document,
  refinementPlan: RefinementPlan
): Promise<Document> {
  // Fix critical issues first
  for (const step of refinementPlan.steps) {
    if (step.priority === "high") {
      document = await fixIssues(document, step.issues);
    }
  }
  
  return document;
}
```

**Step 2: Re-review**
```typescript
async function refineAndReview(
  document: Document,
  originalReview: ReviewOutput
): Promise<ReviewOutput> {
  // Refine document
  const refined = await refineDocument(document, originalReview.refinementPlan);
  
  // Re-review
  const newReview = await reviewDocument(refined);
  
  // Check if approved
  if (newReview.output.review.approved) {
    return newReview;
  }
  
  // If still not approved, continue refinement
  return refineAndReview(refined, newReview);
}
```

### Refinement Limits

**Maximum Refinement Cycles:** 3

**After 3 cycles:**
- Document marked as "needs-manual-review"
- Human reviewer notified
- Suggestions provided for manual fixes

## Error Handling

### Agent Errors

**Error Types:**
1. **Input Validation Error:** Invalid input schema
2. **Processing Error:** Error during processing
3. **Coordination Error:** Error in coordination
4. **Timeout Error:** Operation timeout

**Error Handling:**
```typescript
function handleAgentError(error: AgentError): AgentOutput {
  return {
    status: "failed",
    output: {
      errors: [error.message],
      suggestions: error.recoverySuggestions
    },
    quality: {
      score: 0
    },
    nextSteps: {
      required: error.requiredActions
    }
  };
}
```

## Best Practices

### Agent Design

1. **Single Responsibility:** Each agent has one clear purpose
2. **Stateless:** Agents don't maintain state between requests
3. **Idempotent:** Same input produces same output
4. **Observable:** Agents log actions and decisions

### Communication

1. **Clear Contracts:** Well-defined input/output schemas
2. **Error Handling:** Comprehensive error handling
3. **Coordination:** Clear coordination rules
4. **Monitoring:** Track agent performance

---

**See Also:**
- `docs/AGENT_SANDBOX_RULES.md` - Operational boundaries
- `docs/API_CONTRACT.md` - API specifications
- `docs/FAILURE_MODES.md` - Failure handling

