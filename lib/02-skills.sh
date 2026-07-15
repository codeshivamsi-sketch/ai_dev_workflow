# lib/02-skills.sh — personal (user-level) skills cloned into ~/.claude/skills.

personal_skills() {
  step "Skills (Superpowers, Ponytail)"
  local SKILLS_DIR="${HOME}/.claude/skills"
  mkdir -p "$SKILLS_DIR"

  clone_skill() {  # clone_skill <git-url> <name>
    if [ -d "$SKILLS_DIR/$2" ]; then
      echo "    $2 already present"
    else
      git clone --depth 1 "$1" "$SKILLS_DIR/$2" || warn "$2: clone failed — install per its README"
    fi
  }

  clone_skill https://github.com/obra/superpowers.git superpowers
  clone_skill https://github.com/DietrichGebert/ponytail.git ponytail
  warn "Skills: some ship as plugins — inside Claude Code, '/plugin' installs are the cleaner path if the repo offers one"
}
