{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          { "type": "command", "command": "__HOOK_CMD__" }
        ]
      }
    ]
  }
}
