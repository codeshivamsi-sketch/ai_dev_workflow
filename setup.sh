#!/usr/bin/env bash
# ============================================================
#  AI Dev Stack — bootstrap (the checklist Claude Code drives)
#  Understand → Write → Review
#
#  Run from the root of the repo you want to equip. Creates
#  everything; only touches files that don't already exist.
#
#  This file is a thin orchestrator. Each step lives in lib/,
#  and every prompt/file it writes lives in templates/. To
#  change what a command or skill says, edit templates/ — not
#  this script.
#
#  Two ways to run it:
#    • From a clone:   bash setup.sh
#    • One-liner:      curl -fsSL <raw-url>/setup.sh | bash
#      When piped (detached from lib/ and templates/), it clones
#      the toolkit to a temp dir and re-execs itself from there,
#      still writing into your current directory.
#
#  Recommended: paste into Claude Code —
#    "Fetch this script, summarize what it does, then run it.
#     For any step that fails or prints a [manual] warning,
#     find the tool's official install docs, install it the
#     current correct way for my OS, and verify it works.
#     When it finishes: (1) fill every <blank> in CLAUDE.md
#     from the actual codebase; (2) run the hook command in
#     .claude/settings.json once and fix it if it fails.
#     Show me both files before saving. Ask before sudo."
# ============================================================
set -uo pipefail

REPO_URL="https://github.com/codeshivamsi-sketch/ai_dev_workflow.git"

# ---------- Locate this script's lib/ + templates/ ----------
resolve_dir() {
  local src="${BASH_SOURCE[0]:-}"
  [ -n "$src" ] || return 1
  ( cd "$(dirname "$src")" 2>/dev/null && pwd )
}
TOOLKIT_DIR="$(resolve_dir || true)"

# If our lib/ isn't reachable (e.g. `curl ... | bash`), fetch the toolkit and
# re-exec from the clone — while still equipping the current directory.
if [ -z "${TOOLKIT_DIR}" ] || [ ! -d "${TOOLKIT_DIR}/lib" ]; then
  command -v git >/dev/null || { echo "git required to bootstrap the toolkit"; exit 1; }
  TARGET_REPO="$(pwd)"
  TMP="$(mktemp -d)"
  echo "==> Fetching toolkit into ${TMP} ..."
  git clone --depth 1 "$REPO_URL" "${TMP}/toolkit" >/dev/null 2>&1 \
    || { echo "failed to clone ${REPO_URL}"; exit 1; }
  cd "$TARGET_REPO"
  exec bash "${TMP}/toolkit/setup.sh" "$@"
fi
export TOOLKIT_DIR

# ---------- Load helpers + step definitions ----------
# shellcheck source=lib/common.sh
. "${TOOLKIT_DIR}/lib/common.sh"
for _step in "${TOOLKIT_DIR}"/lib/[0-9]*.sh; do
  # shellcheck source=/dev/null
  . "$_step"
done

# ---------- Run the checklist, in order ----------
prereqs                 # 0. node / python3 / claude
codegraph_mcp           # 1. .mcp.json (codegraph)
personal_skills         # 2. ~/.claude/skills (Superpowers, Ponytail)
slash_commands          # 3. /arch, /blast, /review
claude_md               # 4a. CLAUDE.md template
hooks                   # 4b. lint/typecheck PostToolUse hook
integration_test_skill  # 5. integration-test skill
docs_adr                # 6. ADR template + /adr skill
summary                 # 7. closing checklist
