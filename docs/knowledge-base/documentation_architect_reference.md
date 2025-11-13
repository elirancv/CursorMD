# Documentation Architect Reference Guide

This knowledge base provides patterns, examples, and catalogs for creating project documentation.

## Document Types & Templates

### Complete Document Catalog (42 Types)

This catalog covers all documentation types for comprehensive SaaS/Platform projects from idea to production.

---

### 1. Vision & Strategy Documents

#### VISION.md
**Purpose:** The vision, why the product exists, target audience, transformation it brings

**Structure:**
- Vision Statement (1-2 paragraphs)
- Mission & Purpose
- Target Audience & Personas
- Transformation & Impact
- Long-term Goals (3-5 years)
- Success Metrics

#### PRODUCT_OVERVIEW.md
**Purpose:** Executive summary for investors, partners, CTOs

**Structure:**
- Executive Summary
- Product Description
- Key Features & Benefits
- Target Market
- Competitive Advantages
- Business Model Overview
- Roadmap Highlights
- Team & Resources

#### ONE_PAGER.md
**Purpose:** Single page for the opening feature/product

**Structure:**
- Product Name & Tagline
- Problem Statement (1-2 sentences)
- Solution (2-3 bullets)
- Key Features (3-5 bullets)
- Target Users
- Call to Action

#### PROBLEM_STATEMENT.md
**Purpose:** What's the market problem and what's the solution

**Structure:**
- Problem Description
- Current State & Pain Points
- Impact & Scale
- Proposed Solution
- Why Now?
- Success Criteria

#### MARKET_ANALYSIS.md
**Purpose:** Competitive landscape, market share, trends

**Structure:**
- Market Size & Opportunity
- Competitive Landscape
- Competitor Analysis (table)
- Market Trends
- Market Gaps
- Positioning Opportunities

#### POSITIONING.md
**Purpose:** How to position the product vs competitors (Devin/Cursor/Replit)

**Structure:**
- Competitive Comparison Table
- Unique Value Propositions
- Differentiation Points
- Target Segments
- Messaging Framework

#### VALUE_PROPOSITION.md
**Purpose:** Value for developers, CTOs, organizations, agencies

**Structure:**
- Value for Developers
- Value for CTOs/Technical Leaders
- Value for Organizations
- Value for Agencies
- ROI & Benefits
- Use Case Examples

#### USE_CASES.md
**Purpose:** Complete list of use case scenarios

**Structure:**
- Use Case 1: [Name]
  - Description
  - Actors
  - Flow
  - Success Criteria
- Use Case 2: [Name]
  - (repeat structure)
- Use Case Matrix (table)

---

### 2. Product Requirements (PRD) Layer

#### PRD_MVP.md
**Purpose:** Product requirements for initial version (Idea → Repo)

**Structure:**
- Overview & Goals
- MVP Scope Definition
- User Personas & Use Cases
- Core Features & Requirements
- Success Metrics
- Timeline & Milestones
- Out of Scope (explicitly)
- Open Questions

#### PRD_V1.md
**Purpose:** First product version with advisors, policies, templates, refactoring

**Structure:**
- Version Overview
- Feature Additions (vs MVP)
- Advisor System Requirements
- Policy Engine Requirements
- Template System Requirements
- Refactoring Capabilities
- User Stories
- Acceptance Criteria
- Dependencies

#### SCOPE_DOCUMENT.md
**Purpose:** What's in/out of scope

**Structure:**
- In Scope (detailed list)
- Out of Scope (with rationale)
- Future Considerations
- Scope Boundaries
- Assumptions

#### USER_STORIES.md
**Purpose:** User stories for all personas

**Structure:**
- Persona 1: [Name]
  - Story 1: As a [role], I want [goal] so that [benefit]
  - Story 2: ...
- Persona 2: [Name]
  - (repeat structure)
- Story Priority Matrix

#### ACCEPTANCE_CRITERIA.md
**Purpose:** Detailed success conditions for each feature

**Structure:**
- Feature 1: [Name]
  - Criteria 1: [Specific, testable]
  - Criteria 2: ...
- Feature 2: [Name]
  - (repeat structure)
- Test Scenarios

#### PRODUCT_FEATURE_LIST.md
**Purpose:** Complete feature list

**Structure:**
- Core Features (MVP)
- V1 Features
- Future Features (backlog)
- Feature Comparison Table
- Feature Dependencies

---

### 3. Architecture & System Design

#### ARCHITECTURE_OVERVIEW.md
**Purpose:** System layers, pipeline, agents, advisors

**Structure:**
- System Overview
- Architecture Layers
- Pipeline Architecture
- Agent System
- Advisor System
- Component Interactions
- Technology Stack
- Scalability Considerations

#### SYSTEM_COMPONENTS.md
**Purpose:** Detailed description of each system component

**Structure:**
- Component 1: [Name]
  - Purpose
  - Responsibilities
  - Interfaces
  - Dependencies
- Component 2: [Name]
  - (repeat structure)
- Component Interaction Diagram

#### SYSTEM_DIAGRAMS.md
**Purpose:** High-Level + Component + Data Flow diagrams

**Structure:**
- High-Level Architecture Diagram (text description)
- Component Diagram (text description)
- Data Flow Diagram (text description)
- Sequence Diagrams (key flows)
- State Diagrams (if applicable)

#### TECH_SPEC_MVP.md
**Purpose:** Complete technical specification (12 sections)

**Structure:**
1. System Overview
2. Architecture & Design
3. Technology Stack
4. Data Models
5. API Specifications
6. Component Specifications
7. Integration Points
8. Security & Compliance
9. Performance Requirements
10. Deployment Architecture
11. Monitoring & Observability
12. Development Guidelines

#### TECH_SPEC_V1_ENTERPRISE.md
**Purpose:** Technical spec for enterprise needs

**Structure:**
- Enterprise Requirements
- Multi-tenancy Architecture
- Security & Compliance (SOC2, GDPR)
- Scalability & Performance
- High Availability
- Disaster Recovery
- Enterprise Integrations
- SLA Requirements

#### ORCHESTRATOR_SPEC.md
**Purpose:** FSM, retry, resume, checkpoints

**Structure:**
- Orchestrator Architecture
- State Machine Definition
- Retry Logic & Policies
- Resume & Checkpoint Mechanism
- Error Handling
- State Transitions
- Recovery Procedures

#### AGENT_CONTRACT_SPEC.md
**Purpose:** Contract definition for each Agent

**Structure:**
- Agent Interface Contract
- Input/Output Specifications
- Error Handling Contract
- Performance Requirements
- Retry Behavior
- Timeout Handling
- Agent Lifecycle

#### ADVISOR_CONTRACT_SPEC.md
**Purpose:** Contract definition for each Advisor

**Structure:**
- Advisor Interface Contract
- Input/Output Specifications
- Advice Format & Structure
- Integration Points
- Advisor Lifecycle
- Quality Metrics

#### QUALITY_GATE_SPEC.md
**Purpose:** How scores are determined, thresholds, weight structure

**Structure:**
- Quality Scoring System
- Threshold Definitions
- Weight Structure
- Scoring Algorithms
- Quality Gate Rules
- Pass/Fail Criteria
- Customization Options

#### POLICY_ENGINE_SPEC.md
**Purpose:** YAML format, rules, enforcement

**Structure:**
- Policy Format (YAML schema)
- Rule Definitions
- Enforcement Mechanisms
- Policy Evaluation Flow
- Policy Examples
- Policy Versioning
- Policy Inheritance

#### DATA_MODEL.md
**Purpose:** Data structure description, pipeline context objects

**Structure:**
- Entity Relationship Diagram (text)
- Core Entities
- Pipeline Context Structure
- Data Relationships
- Constraints & Validations
- Data Lifecycle

#### ARTIFACT_MODEL.md
**Purpose:** Artifact schemas

**Structure:**
- Artifact Types
- Artifact Schema Definitions
- Artifact Metadata
- Artifact Storage
- Artifact Versioning
- Artifact Relationships

#### EVENTLOG_SCHEMA.md
**Purpose:** Log fields for each stage

**Structure:**
- Event Types
- Event Schema per Stage
- Required Fields
- Optional Fields
- Event Examples
- Log Aggregation Strategy

#### MANIFEST_SCHEMA.md
**Purpose:** Versions, checksums, artifacts

**Structure:**
- Manifest Structure
- Version Format
- Checksum Algorithms
- Artifact References
- Metadata Fields
- Manifest Examples

---

### 4. Execution & Pipelines

#### PIPELINE_MVP.md
**Purpose:** Stages: Prompt → PRD → Architecture → Code → Tests → Docs → Quality → Repo

**Structure:**
- Pipeline Overview
- Stage 1: Prompt Processing
- Stage 2: PRD Generation
- Stage 3: Architecture Design
- Stage 4: Code Generation
- Stage 5: Test Generation
- Stage 6: Documentation Generation
- Stage 7: Quality Gates
- Stage 8: Repository Creation
- Stage Transitions
- Error Handling

#### PIPELINE_V1.md
**Purpose:** Extended pipeline with advisors, policies, distributed

**Structure:**
- Enhanced Pipeline Overview
- Advisor Integration Points
- Policy Enforcement Points
- Distributed Execution Model
- Parallel Processing
- Stage Dependencies
- Advanced Error Handling

#### EXECUTION_MODEL.md
**Purpose:** How pipeline runs, concurrency, priorities

**Structure:**
- Execution Model Overview
- Concurrency Model
- Priority System
- Resource Management
- Task Scheduling
- Load Balancing
- Performance Optimization

#### RETRY_AND_RESUME_LOGIC.md
**Purpose:** How to continue from failures

**Structure:**
- Retry Strategies
- Resume Mechanisms
- Checkpoint System
- Failure Recovery
- State Persistence
- Recovery Examples

#### FAILURE_MODES.md
**Purpose:** Complete failure map

**Structure:**
- Failure Categories
- Failure Mode Analysis
- Detection Mechanisms
- Recovery Procedures
- Prevention Strategies
- Failure Scenarios & Solutions

---

### 5. Engineering & Implementation

#### ENGINEERING_GUIDE.md
**Purpose:** Writing guidelines, style, patterns

**Structure:**
- Code Style Guide
- Architecture Patterns
- Design Principles
- Best Practices
- Code Review Guidelines
- Documentation Standards

#### CODING_STANDARDS.md
**Purpose:** eslint/prettier/etc (LLM-friendly)

**Structure:**
- Code Formatting Rules
- Linting Configuration
- Naming Conventions
- File Structure
- Import/Export Rules
- LLM-Friendly Patterns

#### CONTRIBUTING.md
**Purpose:** Future contributions

**Structure:**
- Setup Instructions
- Development Workflow
- Code Style Guidelines
- Testing Requirements
- Pull Request Process
- Code Review Process

#### TEST_PLAN.md
**Purpose:** Testing strategies, coverage, approaches

**Structure:**
- Testing Strategy
- Test Types (unit, integration, e2e)
- Coverage Goals
- Test Environment Setup
- CI/CD Integration
- Test Data Management
- Known Gaps

#### SMOKE_TEST_SUITE.md
**Purpose:** Smoke test definitions

**Structure:**
- Smoke Test Overview
- Critical Path Tests
- Test Scenarios
- Test Execution
- Pass/Fail Criteria
- Test Maintenance

#### LLM_EVALUATION_TESTS.md
**Purpose:** Consistency and repeatability tests

**Structure:**
- LLM Test Strategy
- Consistency Tests
- Repeatability Tests
- Quality Metrics
- Test Scenarios
- Evaluation Framework

#### DEPLOYMENT_RUNBOOK.md
**Purpose:** How to deploy version to prod

**Structure:**
- Pre-Deployment Checklist
- Deployment Process
- Rollback Procedures
- Post-Deployment Verification
- Troubleshooting
- Emergency Procedures

#### INFRASTRUCTURE_OVERVIEW.md
**Purpose:** Cloud/server layout

**Structure:**
- Infrastructure Architecture
- Environment Setup
- Resource Allocation
- Network Configuration
- Security Configuration
- Scaling Strategy

#### CI_CD_PIPELINE.md
**Purpose:** build/test/lint/export

**Structure:**
- Pipeline Overview
- Build Process
- Test Execution
- Linting & Quality Checks
- Deployment Automation
- Pipeline Stages

#### OBSERVABILITY.md
**Purpose:** Monitoring, logs, health

**Structure:**
- Monitoring Strategy
- Logging Strategy
- Metrics & Alerts
- Health Checks
- Dashboards
- Incident Response

---

### 6. Governance, Policy & Enterprise Readiness

#### QUALITY_MANAGEMENT_POLICY.md
**Purpose:** Minimum quality levels

**Structure:**
- Quality Standards
- Quality Levels
- Quality Gates
- Quality Metrics
- Quality Enforcement
- Quality Improvement

#### POLICY_DEFINITION_GUIDE.md
**Purpose:** How to define thresholds and weights

**Structure:**
- Policy Definition Process
- Threshold Guidelines
- Weight Configuration
- Policy Examples
- Policy Testing
- Policy Validation

#### COUNCIL_DESIGN.md
**Purpose:** How the advisor council works

**Structure:**
- Council Architecture
- Advisor Selection
- Decision Process
- Voting Mechanism
- Conflict Resolution
- Council Examples

#### SECURITY_GUIDELINES.md
**Purpose:** Data, permissions, sandboxing

**Structure:**
- Security Principles
- Data Protection
- Access Control
- Sandboxing Strategy
- Security Best Practices
- Security Audits

#### DATA_PRIVACY.md
**Purpose:** GDPR, SOC2 ready

**Structure:**
- Privacy Principles
- GDPR Compliance
- SOC2 Requirements
- Data Handling
- User Rights
- Privacy Policy

#### ACCESS_CONTROL_ARCHITECTURE.md
**Purpose:** Future RBAC/ABAC

**Structure:**
- Access Control Model
- RBAC Design
- ABAC Design
- Permission Model
- Implementation Roadmap

---

### 7. Business & Financial

#### BUSINESS_MODEL.md
**Purpose:** SaaS / Usage / Enterprise licensing

**Structure:**
- Business Model Overview
- Pricing Tiers
- Licensing Models
- Revenue Streams
- Customer Segments
- Go-to-Market Strategy

#### PRICING_STRATEGY.md
**Purpose:** Cost calculations, packages

**Structure:**
- Pricing Philosophy
- Pricing Tiers
- Cost Analysis
- Package Definitions
- Discount Strategy
- Competitive Pricing

#### GO_TO_MARKET_PLAN.md
**Purpose:** Market penetration strategy

**Structure:**
- Market Entry Strategy
- Target Segments
- Marketing Channels
- Sales Strategy
- Launch Plan
- Growth Strategy

#### COST_STRUCTURE.md
**Purpose:** LLM costs, compute, storage

**Structure:**
- Cost Breakdown
- LLM API Costs
- Compute Costs
- Storage Costs
- Infrastructure Costs
- Cost Optimization

#### UNIT_ECONOMICS.md
**Purpose:** Cost per customer run

**Structure:**
- Unit Cost Analysis
- Cost per Run
- Cost per Customer
- Profitability Analysis
- Scaling Economics

#### MONETIZATION_PLAN.md
**Purpose:** Revenue path

**Structure:**
- Revenue Model
- Pricing Strategy
- Revenue Projections
- Growth Plan
- Monetization Timeline

---

### 8. Legal & Risks

#### RISK_REGISTER.md
**Purpose:** Technology/market/quality risks

**Structure:**
- Risk Categories
- Risk Identification
- Risk Assessment
- Mitigation Strategies
- Risk Monitoring
- Risk Response Plan

#### LEGAL_COMPLIANCE.md
**Purpose:** IP, generative code, licenses

**Structure:**
- Intellectual Property
- Code Licensing
- Generative Code Rights
- Compliance Requirements
- Legal Considerations
- Compliance Checklist

#### TERMS_AND_POLICIES_DRAFT.md
**Purpose:** Initial draft of terms of service

**Structure:**
- Terms of Service
- Privacy Policy
- Acceptable Use Policy
- Service Level Agreement
- Disclaimer
- Legal Framework

---

### 9. User-Facing Docs

#### README.md
**Purpose:** Main gateway for CLI users

**Structure:**
- Project name & tagline
- Quick description (2-3 sentences)
- Badges (build status, version, license)
- Features/Highlights
- Quick Start (installation, basic usage)
- Documentation links
- Contributing (link or brief)
- License

**Goal-specific adaptations:**
- **MVP:** Minimal, focus on "what" and "how to run"
- **Production:** Include status, monitoring links, support channels
- **Dev Tooling:** Emphasize installation, examples, API overview
- **Research:** Brief hypothesis, setup, findings summary

#### QUICK_START_GUIDE.md
**Purpose:** Example: "Create your first repo"

**Structure:**
- Prerequisites
- Installation
- First Use Case (step-by-step)
- Common Commands
- Next Steps
- Troubleshooting

#### CLI_REFERENCE.md
**Purpose:** Complete command documentation

**Structure:**
- Command Overview
- Global Options
- Command: [name]
  - Description
  - Usage
  - Options
  - Examples
- Command Reference Table

#### TUTORIALS.md
**Purpose:** First steps, best practices

**Structure:**
- Tutorial 1: Getting Started
- Tutorial 2: Advanced Usage
- Tutorial 3: Best Practices
- Tutorial 4: Common Patterns
- Tutorial Examples

#### FAQ.md
**Purpose:** Frequently asked questions

**Structure:**
- Category 1: [Topic]
  - Q: [Question]
  - A: [Answer]
- Category 2: [Topic]
  - (repeat structure)
- Search Index

#### TROUBLESHOOTING.md
**Purpose:** Problems and solutions

**Structure:**
- Common Issues
- Issue: [Name]
  - Symptoms
  - Causes
  - Solutions
  - Prevention
- Diagnostic Tools
- Support Contacts

---

### 10. Roadmaps & Planning

#### MVP_ROADMAP.md
**Purpose:** Steps for coming weeks

**Structure:**
- MVP Goals
- Week-by-Week Plan
- Milestones
- Dependencies
- Risks & Mitigations
- Success Criteria

#### V1_ROADMAP.md
**Purpose:** Direction for coming year

**Structure:**
- V1 Vision
- Quarterly Goals
- Feature Roadmap
- Technical Roadmap
- Resource Requirements
- Success Metrics

#### FEATURE_BACKLOG.md
**Purpose:** Features and time estimates

**Structure:**
- Feature List
- Feature: [Name]
  - Description
  - Priority
  - Estimate
  - Dependencies
  - Status
- Backlog Prioritization
- Release Planning

#### RELEASE_PLAN.md
**Purpose:** Future versions

**Structure:**
- Release Strategy
- Version Roadmap
- Release: [Version]
  - Features
  - Timeline
  - Dependencies
- Release Schedule
- Versioning Strategy

---

### Core Documents (Standard)

#### PROJECT_EVALUATION.md
**Purpose:** Assess project health, identify gaps, plan improvements

**Structure:**
- Executive Summary
- Project Health Scorecard
- Strengths
- Weaknesses & Risks
- Recommendations (prioritized)
- Next Steps

**See:** `project_evaluation_reference.md` for detailed rubrics

#### RUNBOOK.md
**Purpose:** Operational procedures for production

**Structure:**
- Deployment Process
- Monitoring & Alerts
- Common Issues & Solutions
- Rollback Procedures
- On-Call Procedures
- Disaster Recovery

**Only for:** Production Stability mode

#### USER_GUIDE.md
**Purpose:** End-user documentation

**Structure:**
- Getting Started
- Core Features (step-by-step)
- Troubleshooting
- FAQ
- Support

---

## Writing Patterns

### Clear Headings
- Use descriptive, action-oriented headings
- Avoid generic: "Overview", "Details"
- Prefer: "How Authentication Works", "Deploying to Production"

### Code Examples
- Always include working examples
- Show both simple and advanced use cases
- Explain what each example demonstrates

### Tables for Comparison
Use tables for:
- Feature comparisons
- Configuration options
- API endpoints
- Environment variables

### Lists for Steps
- Numbered for sequential steps
- Bulleted for options/features
- Use checkboxes for checklists

### Diagrams
- Describe architecture in text if diagrams aren't possible
- Use ASCII art for simple diagrams
- Reference external diagram tools if needed

---

## Common Sections

### "Getting Started"
Should include:
1. Prerequisites
2. Installation
3. Basic usage example
4. Next steps

### "Architecture"
Should include:
1. High-level overview
2. Key components
3. Data flow
4. Technology stack

### "Contributing"
Should include:
1. Setup instructions
2. Development workflow
3. Code style guidelines
4. How to submit changes

---

## Quality Checklist

Before finalizing any document:

- [ ] Every section serves a clear purpose
- [ ] Examples are relevant and working
- [ ] Technical terms are explained or linked
- [ ] No placeholder text (use [TBD] instead)
- [ ] Consistent terminology throughout
- [ ] Appropriate depth for project goal
- [ ] Clear next steps for reader

---

## Anti-Patterns to Avoid

❌ Generic boilerplate that could apply to any project
❌ Overly verbose without adding value
❌ Missing critical information (use [TBD] instead)
❌ Inconsistent formatting or style
❌ Assumptions about reader's knowledge level
❌ Copy-pasted content from templates without customization

---

## Language & Tone Guidelines

**For Engineers:**
- Technical, precise
- Include code examples
- Explain trade-offs
- Reference implementation details

**For Product/Management:**
- Outcome-focused
- Business impact
- High-level, avoid deep technical details
- Metrics and KPIs

**For End Users:**
- Plain language
- Step-by-step instructions
- Visual cues (screenshots descriptions)
- Troubleshooting focus

---

## Documentation Roadmap Template

For complex projects, propose this structure:

```
Phase 1: Foundation
- README.md
- Quick Start Guide

Phase 2: Core Documentation
- PRD
- Architecture Overview
- API Reference (if applicable)

Phase 3: Operations
- Deployment Guide
- Runbook
- Monitoring Guide

Phase 4: Advanced
- Contributing Guide
- Advanced Configuration
- Performance Tuning
```

---

## Examples Repository

When creating documentation, reference these patterns:

- **README examples:** GitHub trending repos in similar domains
- **API docs:** OpenAPI/Swagger examples
- **Architecture:** AWS/GCP architecture diagrams (describe in text)
- **Runbooks:** SRE practices, incident response templates

---

**Remember:** Adapt these patterns to the specific project, goal mode, and audience. Never use templates verbatim without customization.

