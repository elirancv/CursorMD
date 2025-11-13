#!/bin/bash

# CursorMD Installation Script
# Copies required files to your project

set -e

PROJECT_ROOT="${1:-.}"

# Get script directory (where this script is located)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "🚀 Installing CursorMD..."
echo ""

# Check if CursorMD directory exists
if [ ! -d "$REPO_ROOT/.cursor/rules" ]; then
    echo "❌ Error: .cursor/rules directory not found!"
    echo "   Please ensure you're running this from the CursorMD repository."
    exit 1
fi

# Copy rules directory
echo "📋 Copying rule files..."
mkdir -p "$PROJECT_ROOT/.cursor/rules"
cp -r "$REPO_ROOT/.cursor/rules/"* "$PROJECT_ROOT/.cursor/rules/"
echo "   ✅ Rules copied"

# Copy knowledge base files
echo "📚 Copying knowledge base files..."
mkdir -p "$PROJECT_ROOT/docs/knowledge-base"
if [ -d "$REPO_ROOT/docs/knowledge-base" ]; then
    cp -r "$REPO_ROOT/docs/knowledge-base/"* "$PROJECT_ROOT/docs/knowledge-base/"
else
    # Fallback: copy from root if knowledge-base directory doesn't exist
    if [ -f "$REPO_ROOT/documentation_architect_reference.md" ]; then
        cp "$REPO_ROOT/documentation_architect_reference.md" "$PROJECT_ROOT/docs/knowledge-base/" 2>/dev/null || cp "$REPO_ROOT/documentation_architect_reference.md" "$PROJECT_ROOT/" 2>/dev/null || true
    fi
    if [ -f "$REPO_ROOT/project_evaluation_reference.md" ]; then
        cp "$REPO_ROOT/project_evaluation_reference.md" "$PROJECT_ROOT/docs/knowledge-base/" 2>/dev/null || cp "$REPO_ROOT/project_evaluation_reference.md" "$PROJECT_ROOT/" 2>/dev/null || true
    fi
fi
echo "   ✅ Knowledge base copied"

echo ""
echo "✅ Installation complete!"
echo ""
echo "Your project now has:"
echo "  - .cursor/rules/ (12 rule files)"
echo "  - docs/knowledge-base/ (knowledge base files)"
echo ""
echo "🚀 Open Cursor IDE and start generating documentation!"
echo ""
echo "Try: 'Create VISION.md for my project'"

