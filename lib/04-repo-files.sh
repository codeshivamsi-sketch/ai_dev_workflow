# lib/04-repo-files.sh — the CLAUDE.md template and the lint/typecheck hook.

claude_md() {
  step "CLAUDE.md template"
  install_tpl claude-md.md CLAUDE.md \
    "CLAUDE.md template created — Claude fills the <blanks> from your codebase"
}

hooks() {
  step "Hooks (auto-detecting your lint/typecheck commands)"
  mkdir -p .claude
  [ -f .claude/settings.json ] && return 0

  local HOOK_CMD=""
  if [ -f package.json ]; then
    node -e "const s=require('./package.json').scripts||{};process.exit(s.lint?0:1)" 2>/dev/null \
      && HOOK_CMD="npm run lint --silent"
    node -e "const s=require('./package.json').scripts||{};process.exit(s.typecheck?0:1)" 2>/dev/null \
      && HOOK_CMD="${HOOK_CMD:+$HOOK_CMD && }npm run typecheck --silent"
    [ -z "$HOOK_CMD" ] && [ -f tsconfig.json ] && HOOK_CMD="npx tsc --noEmit"
  elif [ -f pyproject.toml ] || compgen -G "*.py" >/dev/null 2>&1; then
    HOOK_CMD="ruff check ."
    command -v mypy >/dev/null && HOOK_CMD="$HOOK_CMD && mypy ."
  fi

  if [ -z "$HOOK_CMD" ]; then
    HOOK_CMD="echo TODO: set lint/typecheck command in .claude/settings.json"
    warn "couldn't detect lint/typecheck commands — hooks written with a TODO placeholder"
  else
    echo "    hooks wired to detected commands: $HOOK_CMD"
  fi

  # Render templates/settings.json.tpl, substituting the detected command
  # for the __HOOK_CMD__ placeholder (literal replacement — no regex).
  local content
  content="$(cat "$(tpl settings.json.tpl)")"
  printf '%s\n' "${content/__HOOK_CMD__/$HOOK_CMD}" > .claude/settings.json
}
