<div align="center">

# 🚀 CursorMD

### **The Ultimate AI-Powered Documentation Architect for Cursor IDE**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub](https://img.shields.io/badge/GitHub-elirancv%2FCursorMD-blue)](https://github.com/elirancv/CursorMD)
[![Cursor IDE](https://img.shields.io/badge/Cursor-IDE-purple)](https://cursor.sh)

**Transform your Cursor IDE into a professional documentation powerhouse**

*Generate 53 types of professional documentation in minutes, not hours*

[Quick Start](#-quick-start) • [Documentation](#-documentation) • [Examples](#-examples) • [Contributing](#-contributing)

---

</div>

## ✨ What is CursorMD?

**CursorMD** is a comprehensive, production-ready system that transforms Cursor IDE's AI assistant into an expert **Project Documentation Architect**. With a single installation, you can generate **53 different document types** covering every aspect of software development—from vision and strategy to architecture, implementation, operations, and business planning.

### 🎯 The Problem It Solves

Writing professional documentation is **time-consuming**, **inconsistent**, and **error-prone**. Most teams either:
- ❌ Skip documentation entirely
- ❌ Write generic, boilerplate docs that don't help
- ❌ Spend hours creating docs that become outdated quickly

### ✅ The Solution

**CursorMD** provides:
- 🚀 **95%+ time savings** - Generate docs in minutes, not hours
- 📋 **53 document types** - Complete coverage from vision to operations
- 🎨 **Consistent quality** - Professional, project-specific documentation every time
- 🔧 **Zero configuration** - Works immediately after installation
- 🎯 **Goal-aware** - Adapts to MVP, Production, Research, Dev Tooling, or Balanced modes

---

## 🌟 Key Features

### 📚 Comprehensive Document Coverage

**53 Document Types** organized into 9 categories:

- ✅ **Vision & Strategy** (8 types) - VISION.md, PRODUCT_OVERVIEW.md, MARKET_ANALYSIS.md, etc.
- ✅ **Product Requirements** (6 types) - PRD_MVP.md, PRD_V1.md, USER_STORIES.md, etc.
- ✅ **Architecture & Design** (13 types) - ARCHITECTURE_OVERVIEW.md, SYSTEM_DIAGRAMS.md, TECH_SPEC_MVP.md, etc.
- ✅ **Execution & Pipelines** (5 types) - PIPELINE_MVP.md, EXECUTION_MODEL.md, etc.
- ✅ **Engineering** (13 types) - ENGINEERING_GUIDE.md, TEST_PLAN.md, DEPLOYMENT_RUNBOOK.md, API_CONTRACT.md, etc.
- ✅ **Governance & Enterprise** (6 types) - SECURITY_GUIDELINES.md, DATA_PRIVACY.md, etc.
- ✅ **Business & Financial** (6 types) - BUSINESS_MODEL.md, PRICING_STRATEGY.md, etc.
- ✅ **Legal & Risks** (3 types) - RISK_REGISTER.md, LEGAL_COMPLIANCE.md, etc.
- ✅ **User-Facing** (9 types) - README.md, CLI_REFERENCE.md, TUTORIALS.md, CURSOR_INTEGRATION_GUIDE.md, etc.

### 🎯 Smart Adaptation

Automatically adapts documentation depth and focus based on your project goal:

- 🔵 **Production Stability** → Deep operational docs, monitoring, security
- 🟢 **MVP Fast** → Lean documentation, quick start guides
- 🟡 **Research** → Brief docs with hypotheses and findings
- 🟣 **Dev Tooling** → Excellent README, API reference, examples
- ⚪ **Balanced** → Full documentation suite

### 🧩 Auto-Detection & Dependency Tracking

**"Proper specification is 50% of the work"** - Documentation is like a puzzle - build in the right order, and everything fits together perfectly.

- 🔍 **Auto-detect missing documents** - Scans your project and identifies what's needed
- 📊 **Dependency tracking** - Knows which documents depend on others
- 🎯 **Build order** - Suggests the correct sequence (like puzzle pieces)
- 📈 **Progress tracking** - Shows what's done, what's missing, what's next
- ⚠️ **Blocker detection** - Warns when missing documents block others

**How it works:** Simply ask *"What documents do I need?"* or *"What's missing?"* and the system will:
1. Scan your project for existing documentation
2. Identify missing critical documents
3. Show dependencies and blockers
4. Suggest the optimal build order

**Example output:**
```
📊 Documentation Status Report

✅ Created (2): README.md, VISION.md
❌ Missing Critical: PROBLEM_STATEMENT.md ⚠️ BLOCKS 3 documents
🎯 Recommended Next: PROBLEM_STATEMENT.md → PRODUCT_OVERVIEW.md → PRD_MVP.md
📈 Progress: 2/53 documents (3.8%)
```

### 🤖 Auto-Implementation from Documentation

**"Proper specification is 50% of the work"** - Once documentation is complete, the system automatically knows what to build. Like an autopilot, it reads your documentation and implements the code accordingly.

- 📄 **Reads specifications** - Automatically scans ARCHITECTURE_OVERVIEW.md, TECH_SPEC_MVP.md, SYSTEM_COMPONENTS.md, PRD_MVP.md
- 🔍 **Detects missing code** - Identifies what code/files are missing vs. what's specified in docs
- 🎯 **Proposes implementation** - Shows what will be created based on documentation
- ⚡ **Implements automatically** - Creates code files according to specifications

**How it works:** When documentation exists but code is missing, the system will:
1. Scan documentation files for specifications
2. Check existing codebase for implementation
3. Identify gaps between docs and code
4. Propose creating missing files/components
5. Implement automatically according to specs

**Example:**
```
📋 Auto-Implementation Detected

I found complete documentation:
- ARCHITECTURE_OVERVIEW.md ✅
- TECH_SPEC_MVP.md ✅
- SYSTEM_COMPONENTS.md ✅
- PRD_MVP.md ✅

According to the documentation, I need to create:
- 6 HTML pages (index.html, product-detail.html, etc.)
- CSS file (css/main.css)
- Component implementations

Should I create the implementation files now?
```

### 🏗️ Modular Architecture

- **14 modular rule files** (`.cursor/rules/*.mdc`) - Clean, maintainable, extensible
- **Knowledge base** - Centralized templates and patterns
- **Backward compatible** - Supports legacy `.cursorrules` format

---

## 🚀 Quick Start

### Installation (3 Simple Steps)

#### Option 1: Automated Installation (Recommended)

**Linux/Mac:**
```bash
git clone https://github.com/elirancv/CursorMD.git
cd CursorMD
./scripts/install.sh /path/to/your/project
```

**Windows PowerShell:**
```powershell
git clone https://github.com/elirancv/CursorMD.git
cd CursorMD
.\scripts\install.ps1 -ProjectRoot "C:\path\to\your\project"
```

#### Option 2: Manual Installation

1. Copy `.cursor/rules/` directory → `.cursor/rules/` in your project root
2. Copy `docs/knowledge-base/` directory → `docs/knowledge-base/` in your project

**That's it!** Cursor will automatically detect and use these files.

📖 **Detailed instructions:** See [docs/INSTALL.md](docs/INSTALL.md)

### 🎯 Start Using

Open Cursor IDE and simply ask:

```
"Create all documents needed for my idea"  # Generate starter pack
"Create VISION.md for my project"         # Single document
"Generate PRD_MVP.md"                     # Single document
"What documents do I need?"                # Auto-detect missing docs
```

The AI will automatically:
- Use the rules and generate professional documentation
- **Create all required documents** for a stage (starter pack) in correct order
- Check dependencies before creating documents
- Suggest missing prerequisites if needed
- Track progress and suggest next steps

---

## 💡 Usage Examples

### Generate a Single Document
```
Create VISION.md for my SaaS project - Task Management for small teams
```

### Generate Starter Pack (All Documents for a Stage)
```
Create all documents needed for my idea
Generate starter pack for MVP stage
Create all documents needed for pre-launch
Generate production documentation pack
```

**Starter Packs Available:**
- **Idea Stage** → 6 foundation documents (VISION, PROBLEM_STATEMENT, MARKET_ANALYSIS, etc.)
- **MVP Stage** → 8 MVP documents (PRD_MVP, ARCHITECTURE_OVERVIEW, TECH_SPEC_MVP, etc.)
- **Pre-Launch** → 7 pre-launch documents (PIPELINE_MVP, DEPLOYMENT_RUNBOOK, etc.)
- **Production** → 7 production documents (CI_CD_PIPELINE, OBSERVABILITY, etc.)

### Generate Multiple Documents
```
Generate core documentation for my project: [description]
```

### Update Existing Documentation
```
Update PRD_MVP.md - add feature: real-time collaboration
```

### Evaluate Your Project
```
Evaluate this project and create PROJECT_EVALUATION.md
```

### Auto-Detect Missing Documents
```
What documents do I need?
What's missing?
What can I create now?
```

---

## 📖 Documentation

Comprehensive guides and references:

- 🎯 **[How It Works](docs/HOW_IT_WORKS.md)** - Complete system overview and architecture
- 📖 **[Installation Guide](docs/INSTALL.md)** - Detailed installation instructions
- 💡 **[Best Practices](docs/BEST_PRACTICES.md)** - Tips for getting the most out of the system
- ❓ **[FAQ](docs/FAQ.md)** - Frequently asked questions
- 🔧 **[Troubleshooting](docs/TROUBLESHOOTING.md)** - Common issues and solutions
- 📋 **[Document Coverage](docs/DOCUMENT_COVERAGE.md)** - Complete list of all 53 document types
- 🚀 **[Cursor Integration Guide](docs/CURSOR_INTEGRATION_GUIDE.md)** - How to use the system in Cursor IDE
- 👥 **[Onboarding Guide](docs/ONBOARDING_GUIDE.md)** - Guide for new team members
- 📊 **[Architecture Diagrams Guide](docs/ARCHITECTURE_DIAGRAMS_GUIDE.md)** - How to create architecture diagrams

---

## 🏗️ Repository Structure

```
CursorMD/
├── .cursor/
│   └── rules/                        # ✅ PRIMARY FORMAT - 14 modular rule files
│       ├── auto-implementation.mdc   # 🆕 Auto-implement code from documentation
│       ├── core-identity.mdc
│       ├── workflow.mdc
│       ├── document-dependencies.mdc  # 🆕 Auto-detection & dependency tracking
│       ├── file-organization.mdc    # CRITICAL - File placement rules
│       ├── document-types.mdc
│       ├── knowledge-base.mdc
│       ├── main-goal.mdc
│       ├── meta-guardrails.mdc
│       ├── missing-information.mdc
│       ├── output-rules.mdc
│       ├── project-goal-modes.mdc
│       ├── quality-standards.mdc
│       ├── updating-docs.mdc
│       └── README.md
├── docs/
│   └── knowledge-base/              # ✅ Knowledge base files
│       ├── documentation_architect_reference.md
│       └── project_evaluation_reference.md
├── scripts/                         # Installation scripts
│   ├── install.sh                   # Linux/Mac
│   └── install.ps1                  # Windows
├── examples/                        # Sample documents
├── tests/                           # Validation tools
└── README.md                        # This file
```

---

## 🎨 Examples

See real-world examples in the `examples/` directory:

- **Vision & Strategy:** [VISION.md.example](examples/vision-strategy/VISION.md.example)
- **Product Requirements:** [PRD_MVP.md.example](examples/product-requirements/PRD_MVP.md.example)
- **Architecture:** [ARCHITECTURE_OVERVIEW.md.example](examples/architecture/ARCHITECTURE_OVERVIEW.md.example)
- **User-Facing:** [README.md.example](examples/user-facing/README.md.example)

---

## 🤝 Contributing

Contributions are welcome! Feel free to:

- 🐛 Report bugs
- 💡 Suggest new features
- 📝 Improve documentation
- 🔧 Submit pull requests

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## 📊 Project Status

**Production Ready** ✅

- ✅ 53 document types fully supported
- ✅ Comprehensive documentation
- ✅ Installation scripts for all platforms
- ✅ Examples and templates
- ✅ Quality validation tools
- ✅ Complete test coverage

**Score: 100/100** ⭐⭐⭐⭐⭐

See [PROJECT_EVALUATION.md](PROJECT_EVALUATION.md) for detailed assessment.

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👤 Author

**Eliran Cohen**

- GitHub: [@elirancv](https://github.com/elirancv)
- Repository: [github.com/elirancv/CursorMD](https://github.com/elirancv/CursorMD)

---

## 🙏 Acknowledgments

Built with ❤️ for the Cursor IDE community. Special thanks to all contributors and users who help improve this project.

---

## ⭐ Show Your Support

If you find CursorMD useful, please consider:

- ⭐ **Starring** this repository
- 🐛 **Reporting** bugs or issues
- 💡 **Suggesting** new features
- 📢 **Sharing** with your team

---

<div align="center">

**Made with ❤️ by [Eliran Cohen](https://github.com/elirancv)**

[⬆ Back to Top](#-cursormd)

</div>
