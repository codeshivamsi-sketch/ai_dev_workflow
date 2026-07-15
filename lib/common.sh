# lib/common.sh — shared helpers. Sourced by setup.sh; not run directly.
#
# TOOLKIT_DIR is exported by setup.sh and points at the directory that
# contains lib/ and templates/.

step() { echo -e "\n\033[1;34m==> $1\033[0m"; }
warn() { echo -e "\033[1;33m    [manual] $1\033[0m"; }

# tpl <path-under-templates>  ->  prints the absolute path to that template.
tpl() { echo "${TOOLKIT_DIR}/templates/$1"; }

# install_tpl <template-rel-path> <dest> [created-msg]
# Copies a template to <dest> only if <dest> does not already exist.
# Returns 0 if it created the file, 1 if it was already present — so callers
# can print their own "already present" message when they need a custom one.
install_tpl() {
  local src dest msg
  src="$(tpl "$1")"; dest="$2"; msg="${3:-}"
  if [ -e "$dest" ]; then
    return 1
  fi
  mkdir -p "$(dirname "$dest")"
  cp "$src" "$dest"
  [ -n "$msg" ] && echo "    $msg"
  return 0
}
