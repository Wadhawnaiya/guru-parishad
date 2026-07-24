#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="${HOME}/.claude"
DRY_RUN=false

usage() {
  cat <<'EOF'
Usage: ./install.sh [--claude-dir PATH] [--dry-run] [--help]

Install Guru Parishad (Council of the Gurus of India) into Claude Code.

Options:
  --claude-dir PATH   Target Claude config directory (default: ~/.claude)
  --dry-run           Print actions without writing files
  --help              Show this help message
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --claude-dir) [[ $# -ge 2 ]] || { echo "Error: --claude-dir requires a path" >&2; exit 1; }; CLAUDE_DIR="$2"; shift 2;;
    --dry-run) DRY_RUN=true; shift;;
    --help) usage; exit 0;;
    *) echo "Error: unknown argument: $1" >&2; usage; exit 1;;
  esac
done

run_cmd() { if [[ "$DRY_RUN" == true ]]; then echo "[dry-run] $*"; else "$@"; fi; }

[[ -d "${SCRIPT_DIR}/agents" ]] || { echo "Error: agents/ not found" >&2; exit 1; }
[[ -f "${SCRIPT_DIR}/skills/parishad/SKILL.md" ]] || { echo "Error: skills/parishad/SKILL.md not found" >&2; exit 1; }
agent_files=("${SCRIPT_DIR}"/agents/parishad-*.md)
[[ -e "${agent_files[0]}" ]] || { echo "Error: no parishad agent files found" >&2; exit 1; }

AGENTS_DEST="${CLAUDE_DIR}/agents"
SKILL_DEST_DIR="${CLAUDE_DIR}/skills/parishad"

echo "Installing Guru Parishad into ${CLAUDE_DIR} ..."
run_cmd mkdir -p "${AGENTS_DEST}" "${SKILL_DEST_DIR}"

echo "Installing ${#agent_files[@]} guru agents..."
for f in "${agent_files[@]}"; do
  run_cmd install -m 0644 "$f" "${AGENTS_DEST}/$(basename "$f")"
done

echo "Installing /parishad skill..."
run_cmd install -m 0644 "${SCRIPT_DIR}/skills/parishad/SKILL.md" "${SKILL_DEST_DIR}/SKILL.md"

echo "Done. Convene with:  /parishad <your hardest decision>"
