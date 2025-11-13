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
- ✅ **Engineering** (10 types) - ENGINEERING_GUIDE.md, TEST_PLAN.md, DEPLOYMENT_RUNBOOK.md, etc.
- ✅ **Governance & Enterprise** (6 types) - SECURITY_GUIDELINES.md, DATA_PRIVACY.md, etc.
- ✅ **Business & Financial** (6 types) - BUSINESS_MODEL.md, PRICING_STRATEGY.md, etc.
- ✅ **Legal & Risks** (3 types) - RISK_REGISTER.md, LEGAL_COMPLIANCE.md, etc.
- ✅ **User-Facing** (6 types) - README.md, CLI_REFERENCE.md, TUTORIALS.md, etc.

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

**Example:** Before creating `ARCHITECTURE_OVERVIEW.md`, the system checks if `PRD_MVP.md` exists and suggests creating it first if missing.

### 🏗️ Modular Architecture

- **13 modular rule files** (`.cursor/rules/*.mdc`) - Clean, maintainable, extensible
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
"Create VISION.md for my project"
"Generate PRD_MVP.md"
"Create ARCHITECTURE_OVERVIEW.md"
```

The AI will automatically use the rules and generate professional documentation!

---

## 💡 Usage Examples

### Generate a Single Document
```
Create VISION.md for my SaaS project - Task Management for small teams
```

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
│   └── rules/                        # ✅ PRIMARY FORMAT - 13 modular rule files
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
