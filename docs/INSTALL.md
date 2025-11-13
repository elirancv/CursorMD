# Installation Guide

**Quick setup to use CursorMD in your project - 3 simple steps!**

## Prerequisites

- Cursor IDE installed and running
- A project where you want to generate documentation

## Installation (Choose One Method)

### Method 1: Automated Installation (Recommended)

**Linux/Mac:**
```bash
./scripts/install.sh /path/to/your/project
```

**Windows PowerShell:**
```powershell
.\scripts\install.ps1 -ProjectRoot "C:\path\to\your\project"
```

### Method 2: Quick Copy (Manual)

**Copy these items to your project:**

1. **`.cursor/rules/` directory** → `.cursor/rules/` in your project root
2. **`docs/knowledge-base/` directory** → `docs/knowledge-base/` in your project
   - Contains: `documentation_architect_reference.md` and `project_evaluation_reference.md`
   - Alternative: Copy knowledge base files to project root if preferred

**That's it!** Cursor will automatically detect and use these files.

### Method 3: Using Git Submodule

```bash
# Add as submodule
git submodule add https://github.com/yourorg/cursormd.git .cursormd

# Copy required files
cp -r .cursormd/.cursor/rules .cursor/
cp .cursormd/documentation_architect_reference.md .
cp .cursormd/project_evaluation_reference.md .
```

### Method 4: Manual Copy

1. Download or clone this repository
2. Copy `.cursor/rules/` to your project root as `.cursor/rules/`
3. Copy `documentation_architect_reference.md` to your project root
4. Copy `project_evaluation_reference.md` to your project root

## Verify Installation

After copying, your project should have:

```
your-project/
├── .cursor/
│   └── rules/                    # ✅ Copied (12 files)
│       ├── core-identity.mdc
│       ├── workflow.mdc
│       ├── file-organization.mdc
│       └── ... (9 more files)
├── docs/
│   └── knowledge-base/           # ✅ Copied
│       ├── documentation_architect_reference.md
│       └── project_evaluation_reference.md
└── ... (your project files)
```

## Start Using

Open Cursor IDE in your project and start asking:

```
"Create VISION.md for my project"
"Generate PRD_MVP.md"
"Create ARCHITECTURE_OVERVIEW.md"
```

The AI will automatically use the rules and knowledge base files!

## Knowledge Base Location

Knowledge base files are in `docs/knowledge-base/` by default. The system will:
1. Look in `docs/knowledge-base/` first
2. Fall back to project root if not found
3. Work with either location

**Recommended:** Keep them in `docs/knowledge-base/` for better organization.

## Troubleshooting

**Q: Cursor doesn't recognize the rules**
- Make sure `.cursor/rules/` is in your project root
- Restart Cursor IDE
- Check that files have `.mdc` extension

**Q: Knowledge base not found**
- Ensure files are in root or `docs/` directory
- Check file names match exactly
- Restart Cursor IDE

**Q: Rules not working**
- Verify all 11 `.mdc` files are present
- Check file permissions
- Try legacy `.cursorrules` format (see README)

## Next Steps

- Read `README.md` for usage examples
- Check `docs/BEST_PRACTICES.md` for tips
- See `examples/` for sample documents
- Review `docs/FAQ.md` for common questions

---

**That's it! You're ready to generate professional documentation! 🚀**

