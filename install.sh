#!/usr/bin/env bash
set -euo pipefail

# ─────────────────────────────────────────────
# EAF — Principal .NET Architect Skill Installer
# ─────────────────────────────────────────────

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_PROMPT="$SCRIPT_DIR/prompts/claude-code-system-prompt.md"
CURSOR_PROMPT="$SCRIPT_DIR/prompts/cursor-principal-architect.mdc"
IDEMPOTENCY_MARKER="You are a **Principal .NET Architect**"

# ── Usage ──────────────────────────────────────

usage() {
  echo ""
  echo "Usage: ./install.sh <target-project-path>"
  echo ""
  echo "Installs the Principal .NET Architect skill into a .NET project."
  echo ""
  echo "What it does:"
  echo "  • Appends the EAF system prompt to <project>/CLAUDE.md     (Claude Code)"
  echo "  • Copies the Cursor rule to <project>/.cursor/rules/       (Cursor)"
  echo ""
  echo "Example:"
  echo "  ./install.sh ~/projects/my-dotnet-api"
  echo ""
}

if [ $# -eq 0 ]; then
  usage
  exit 1
fi

TARGET="$(cd "$1" 2>/dev/null && pwd)" || {
  echo "Error: directory '$1' does not exist."
  exit 1
}

echo ""
echo "Installing Principal .NET Architect skill into:"
echo "  $TARGET"
echo ""

# ── 1. Claude Code — append to CLAUDE.md ───────

CLAUDE_MD="$TARGET/CLAUDE.md"

if grep -qF "$IDEMPOTENCY_MARKER" "$CLAUDE_MD" 2>/dev/null; then
  echo "⚠  Claude Code  — already installed in CLAUDE.md, skipped."
else
  # Extract only the system prompt content (skip the "How to use" header section)
  {
    echo ""
    echo "---"
    echo ""
    awk '/^## System Prompt/{found=1; next} found' "$CLAUDE_PROMPT"
  } >> "$CLAUDE_MD"
  echo "✓  Claude Code  — prompt appended to CLAUDE.md"
fi

# ── 2. Cursor — copy .mdc rule ─────────────────

CURSOR_RULES_DIR="$TARGET/.cursor/rules"
CURSOR_DEST="$CURSOR_RULES_DIR/principal-architect.mdc"

mkdir -p "$CURSOR_RULES_DIR"
cp "$CURSOR_PROMPT" "$CURSOR_DEST"
echo "✓  Cursor       — rule installed at .cursor/rules/principal-architect.mdc"

# ── Summary ────────────────────────────────────

echo ""
echo "Done."
echo ""
echo "  Claude Code  →  $CLAUDE_MD"
echo "  Cursor       →  $CURSOR_DEST"
echo ""
echo "No restart required. Open the project and start reviewing."
echo ""
