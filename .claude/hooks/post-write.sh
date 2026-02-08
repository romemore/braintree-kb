#!/bin/bash
# Hook post-écriture : validation et auto-commit
# Exécuté après chaque écriture de fiche par Claude Code

set -e

KB_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"

# 1. Vérifier que le _index.md parent existe
check_parent_index() {
  local file="$1"
  local dir
  dir="$(dirname "$file")"

  if [ ! -f "$dir/_index.md" ]; then
    echo "⚠️  ATTENTION: _index.md manquant dans $dir"
    return 1
  fi
  return 0
}

# 2. Vérifier les liens internes cassés
check_internal_links() {
  local file="$1"
  local dir
  dir="$(dirname "$file")"

  # Extract markdown links like [text](path.md) and [[path.md]]
  grep -oP '\]\(([^)]+\.md)\)|\[\[([^\]]+\.md)\]\]' "$file" 2>/dev/null | while read -r match; do
    local link
    link=$(echo "$match" | sed 's/.*(\(.*\))/\1/' | sed 's/\[\[\(.*\)\]\]/\1/')

    # Resolve relative path
    local target="$dir/$link"
    if [ ! -f "$target" ] && [ ! -f "$KB_ROOT/$link" ]; then
      echo "⚠️  Lien cassé dans $file: $link"
    fi
  done
}

# 3. Auto-commit git
auto_commit() {
  cd "$KB_ROOT"
  if [ -d ".git" ]; then
    git add -A
    if ! git diff --cached --quiet; then
      git commit -m "feat(kb): auto-commit post-write hook"
    fi
  fi
}

# Run checks if a file was specified
if [ -n "$1" ]; then
  check_parent_index "$1"
  check_internal_links "$1"
fi

auto_commit
