# lib/03-commands.sh — project slash commands in .claude/commands/.
# The prompt bodies live in templates/commands/.

slash_commands() {
  step "Slash commands (/arch, /blast, /review) in .claude/commands/"
  mkdir -p .claude/commands
  install_tpl commands/arch.md   .claude/commands/arch.md   "/arch created"
  install_tpl commands/blast.md  .claude/commands/blast.md  "/blast created"
  install_tpl commands/review.md .claude/commands/review.md "/review created"
}
