# CursorMD Installation Script for Windows PowerShell
# Copies required files to your project

param(
    [string]$ProjectRoot = "."
)

# Get script directory (where this script is located)
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Split-Path -Parent $ScriptDir

Write-Host "🚀 Installing CursorMD..." -ForegroundColor Green
Write-Host ""

# Check if CursorMD directory exists
if (-not (Test-Path "$RepoRoot\.cursor\rules")) {
    Write-Host "❌ Error: .cursor\rules directory not found!" -ForegroundColor Red
    Write-Host "   Please ensure you're running this from the CursorMD repository."
    exit 1
}

# Copy rules directory
Write-Host "📋 Copying rule files..." -ForegroundColor Cyan
if (-not (Test-Path "$ProjectRoot\.cursor\rules")) {
    New-Item -ItemType Directory -Path "$ProjectRoot\.cursor\rules" -Force | Out-Null
}
Copy-Item -Path "$RepoRoot\.cursor\rules\*" -Destination "$ProjectRoot\.cursor\rules\" -Recurse -Force
Write-Host "   ✅ Rules copied" -ForegroundColor Green

# Copy knowledge base files
Write-Host "📚 Copying knowledge base files..." -ForegroundColor Cyan
if (Test-Path "$RepoRoot\docs\knowledge-base") {
    if (-not (Test-Path "$ProjectRoot\docs\knowledge-base")) {
        New-Item -ItemType Directory -Path "$ProjectRoot\docs\knowledge-base" -Force | Out-Null
    }
    Copy-Item -Path "$RepoRoot\docs\knowledge-base\*" -Destination "$ProjectRoot\docs\knowledge-base\" -Recurse -Force
} else {
    # Fallback: copy from root if knowledge-base directory doesn't exist
    if (Test-Path "$RepoRoot\documentation_architect_reference.md") {
        if (-not (Test-Path "$ProjectRoot\docs\knowledge-base")) {
            New-Item -ItemType Directory -Path "$ProjectRoot\docs\knowledge-base" -Force | Out-Null
        }
        Copy-Item -Path "$RepoRoot\documentation_architect_reference.md" -Destination "$ProjectRoot\docs\knowledge-base\" -Force -ErrorAction SilentlyContinue
        Copy-Item -Path "$RepoRoot\documentation_architect_reference.md" -Destination "$ProjectRoot\" -Force -ErrorAction SilentlyContinue
    }
    if (Test-Path "$RepoRoot\project_evaluation_reference.md") {
        Copy-Item -Path "$RepoRoot\project_evaluation_reference.md" -Destination "$ProjectRoot\docs\knowledge-base\" -Force -ErrorAction SilentlyContinue
        Copy-Item -Path "$RepoRoot\project_evaluation_reference.md" -Destination "$ProjectRoot\" -Force -ErrorAction SilentlyContinue
    }
}
Write-Host "   ✅ Knowledge base copied" -ForegroundColor Green

Write-Host ""
Write-Host "✅ Installation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Your project now has:"
Write-Host "  - .cursor\rules\ (12 rule files)"
Write-Host "  - docs\knowledge-base\ (knowledge base files)"
Write-Host ""
Write-Host "🚀 Open Cursor IDE and start generating documentation!" -ForegroundColor Yellow
Write-Host ""
Write-Host "Try: 'Create VISION.md for my project'"

