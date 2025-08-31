#!/usr/bin/env bash
set -euo pipefail

PREFIX="${PREFIX:-/usr/local}"
BIN_DIR="${BIN_DIR:-$PREFIX/bin}"
SUDO="sudo"
[[ "${NO_SUDO:-0}" -eq 1 ]] && SUDO=""

if [[ -x "$BIN_DIR/apt" ]]; then
  echo "Removing $BIN_DIR/apt"
  $SUDO rm -f "$BIN_DIR/apt"
else
  echo "No apt wrapper found at $BIN_DIR/apt"
fi

echo "Uninstall complete."
