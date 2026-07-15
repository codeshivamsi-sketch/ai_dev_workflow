# lib/00-prereqs.sh — verify the tools the rest of the script assumes.

prereqs() {
  step "Checking prerequisites (node, python3, claude)"
  command -v node >/dev/null || { echo "node required — install via https://nodejs.org or nvm"; exit 1; }
  command -v python3 >/dev/null || { echo "python3 required"; exit 1; }
  command -v claude >/dev/null || npm install -g @anthropic-ai/claude-code
}
