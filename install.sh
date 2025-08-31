#!/usr/bin/env bash
set -euo pipefail

PREFIX="${PREFIX:-/usr/local}"
BIN_DIR="${BIN_DIR:-$PREFIX/bin}"
CFG_FILE="${HOME}/.apt_wrapper.conf"
SRC_URL_RAW="${SRC_URL_RAW:-https://raw.githubusercontent.com/AirysDark/apt-arch-wrapper/main}"

SUDO="sudo"
[[ "${NO_SUDO:-0}" -eq 1 ]] && SUDO=""

$SUDO mkdir -p "$BIN_DIR"

echo "Downloading apt wrapper to $BIN_DIR/apt ..."
curl -fsSL "$SRC_URL_RAW/apt" -o /tmp/apt.wrapper
chmod +x /tmp/apt.wrapper
$SUDO mv /tmp/apt.wrapper "$BIN_DIR/apt"

if [[ ! -f "$CFG_FILE" ]]; then
  echo "raspbain_echo=off" > "$CFG_FILE"
fi

echo "Install complete. Try: apt help"
