#!/usr/bin/env bash
set -euo pipefail

# ─────────────────────────────────────────────
# EAF — Principal .NET Architect Skill Installer
# ─────────────────────────────────────────────

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CURSOR_PROMPT="$SCRIPT_DIR/prompts/cursor-principal-architect.mdc"
SKILL_NAME="principal-dotnet-architect"

# Marker that identifies the block a pre-Skill version of this installer used
# to append directly to the target project's CLAUDE.md. Projects installed
# before the Skill-based install still carry this — it is now a frozen,
# unsynced duplicate of what the Skill provides live. Detection only — this
# script never edits CLAUDE.md; removing that block is a manual, by-hand step.
LEGACY_MARKER="You are a **Principal .NET Architect**"

# The actual skill package: SKILL.md plus every reference directory it
# points to. Everything else in this repo (framework/, examples/, README,
# install.sh, prompts/) is for maintaining the EAF itself and is not copied.
SKILL_ITEMS=(SKILL.md docs reviews scorecards assessments certifications playbooks templates)

# ── Usage ──────────────────────────────────────

usage() {
  echo ""
  echo "Usage: ./install.sh <target-project-path>"
  echo ""
  echo "Installs the Principal .NET Architect skill into a .NET project."
  echo ""
  echo "What it does:"
  echo "  • Installs the Claude Code skill at <project>/.claude/skills/$SKILL_NAME/"
  echo "  • Copies the Cursor rule to <project>/.cursor/rules/"
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

# ── 1. Claude Code — install as a real Agent Skill ─────

SKILL_DEST="$TARGET/.claude/skills/$SKILL_NAME"
mkdir -p "$SKILL_DEST"

for item in "${SKILL_ITEMS[@]}"; do
  cp -R "$SCRIPT_DIR/$item" "$SKILL_DEST/"
done

echo "✓  Claude Code  — skill installed at .claude/skills/$SKILL_NAME/"

# ── 2. Cursor — copy .mdc rule ─────────────────

CURSOR_RULES_DIR="$TARGET/.cursor/rules"
CURSOR_DEST="$CURSOR_RULES_DIR/principal-architect.mdc"

mkdir -p "$CURSOR_RULES_DIR"
cp "$CURSOR_PROMPT" "$CURSOR_DEST"
echo "✓  Cursor       — rule installed at .cursor/rules/principal-architect.mdc"

# ── 3. Detect (never touch) a legacy CLAUDE.md prompt block ──

CLAUDE_MD="$TARGET/CLAUDE.md"
LEGACY_FOUND=false

if [ -f "$CLAUDE_MD" ] && grep -qF "$LEGACY_MARKER" "$CLAUDE_MD"; then
  LEGACY_FOUND=true
fi

# ── Summary ────────────────────────────────────

echo ""
echo "Done."
echo ""
echo "  Claude Code  →  $SKILL_DEST/SKILL.md"
echo "  Cursor       →  $CURSOR_DEST"
echo ""
echo "Re-run this script anytime to pull in updates — it always overwrites"
echo "both destinations, so there is no stale copy and no drift between them."
echo ""

if [ "$LEGACY_FOUND" = true ]; then
  echo "⚠  This project's CLAUDE.md still has the old prompt block from a"
  echo "   pre-Skill install. It is now a frozen, unsynced duplicate of what"
  echo "   the Skill above already provides. This installer does not touch"
  echo "   CLAUDE.md — remove that block yourself: find the line"
  echo "   \"You are a **Principal .NET Architect**\" and delete from the"
  echo "   \"---\" separator just above it down to the end of the file."
  echo ""
fi
