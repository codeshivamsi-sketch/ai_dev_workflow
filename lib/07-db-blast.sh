# lib/07-db-blast.sh — db-blast skill (DB impact of code changes), used
# standalone via /db-blast and folded into /blast's DB Impact section.

db_blast_skill() {
  step "db-blast skill (DB impact — used by /db-blast and /blast)"
  mkdir -p .claude/skills/db-blast
  install_tpl skills/db-blast.SKILL.md \
    .claude/skills/db-blast/SKILL.md \
    ".claude/skills/db-blast/SKILL.md created"
}
