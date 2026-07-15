# lib/01-codegraph.sh — the one code graph: codegraph project MCP.
# Understanding, writing context, AND blast radius all read from it.

codegraph_mcp() {
  step "codegraph (project MCP) — understanding, writing context, AND blast radius"
  if [ ! -f .mcp.json ]; then
    cp "$(tpl mcp.json)" .mcp.json
    echo "    .mcp.json created — commit it; teammates get codegraph on clone"
  else
    echo "    .mcp.json already present — ensure it includes codegraph"
  fi
}
