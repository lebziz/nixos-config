#!/usr/bin/env bash
echo "$(date): args='$@'" >> /tmp/okular_nvr_debug.log
set -euo pipefail
line="$1"
file="$2"
file="$(realpath --canonicalize-missing "$file" 2>/dev/null || printf '%s' "$file")"
command -v nvr >/dev/null 2>&1 || { echo "nvr not found in PATH" >&2; exit 1; }
for sock in /tmp/nvim-*; do
  [ -e "$sock" ] || continue
  res="$(nvr --servername "$sock" --remote-expr "bufnr('${file}')" 2>/dev/null || true)"
  if [ -n "$res" ] && [ "$res" -gt 0 ] 2>/dev/null; then
    nvr --servername "$sock" --remote-silent +${line} "$file"
    exit 0
  fi
done
servers="$(nvr --serverlist 2>/dev/null || true)"
for s in $servers; do
  res="$(nvr --servername "$s" --remote-expr "bufnr('${file}')" 2>/dev/null || true)"
  if [ -n "$res" ] && [ "$res" -gt 0 ] 2>/dev/null; then
    nvr --servername "$s" --remote-silent +${line} "$file"
    exit 0
  fi
done
first="$(ls /tmp/nvim-* 2>/dev/null | head -n1 || true)"
if [ -n "$first" ]; then
  nvr --servername "$first" --remote-silent +${line} "$file"
  exit 0
fi
echo "okular_nvr: no nvim socket found" >&2
exit 1
