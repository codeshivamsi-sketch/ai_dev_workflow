# lib/05-integration-test.sh — bonus project skill that auto-triggers on test
# requests. The skill body lives in templates/skills/integration-test.SKILL.md.

integration_test_skill() {
  step "integration-test skill (bonus — auto-triggers on test requests)"
  mkdir -p .claude/skills/integration-test
  install_tpl skills/integration-test.SKILL.md \
    .claude/skills/integration-test/SKILL.md \
    ".claude/skills/integration-test/SKILL.md created"
}
