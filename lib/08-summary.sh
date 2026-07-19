# lib/08-summary.sh — closing checklist: what Claude does next, what you do.

summary() {
  step "Handled by Claude after this script (per the install prompt)"
  warn "Fill CLAUDE.md's <blanks> by analyzing the codebase — show the user before saving"
  warn "Run the hook command from .claude/settings.json once; fix it if it fails here"

  step "Handled by you"
  warn "Restart Claude Code in this repo and APPROVE the project MCP servers when prompted"

  echo -e "\n\033[1;32mDone. Commit CLAUDE.md, .claude/, and .mcp.json so the whole team gets the stack.\033[0m"
  echo -e "\033[1;32mTry it: /arch (architecture map — or /arch show flow [endpoint] / /arch sequence [endpoint] for on-demand traces), /blast (blast radius), /db-blast (DB impact), /docs-sync (refresh all docs), /review (fresh-instance review).\033[0m"
}
