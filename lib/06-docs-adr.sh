# lib/06-docs-adr.sh — ADR template + the /adr skill that writes them.

docs_adr() {
  step "Docs: ADR template + /adr skill"
  mkdir -p docs/adr
  install_tpl docs/adr/0000-template.md docs/adr/0000-template.md \
    "docs/adr/0000-template.md created"

  mkdir -p .claude/skills/adr
  install_tpl skills/adr.SKILL.md .claude/skills/adr/SKILL.md \
    ".claude/skills/adr/SKILL.md created"
}
