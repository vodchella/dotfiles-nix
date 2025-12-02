#!/usr/bin/env bash
set -euo pipefail

umask 077

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ARCHIVE="$SCRIPT_DIR/configs/ssh-keys.zip"

if [[ ! -f "$ARCHIVE" ]]; then
  echo "Error: archive not found: $ARCHIVE" >&2
  exit 1
fi

TMPDIR="$(mktemp -d)"

cleanup() {
  rm -rf -- "$TMPDIR"
}
trap cleanup EXIT

read -s -p "Enter ZIP password: " ZIP_PASS
echo

if ! unzip -qq -P "$ZIP_PASS" "$ARCHIVE" -d "$TMPDIR"; then
  echo "Error: failed to extract archive (possibly wrong password)" >&2
  exit 1
fi

unset ZIP_PASS

SRC_GITHUB="$TMPDIR/github"
SRC_VPNSRV="$TMPDIR/vpn-srv"

for f in "$SRC_GITHUB" "$SRC_VPNSRV"; do
  if [[ ! -f "$f" ]]; then
    echo "Error: missing file in archive: $(basename "$f")" >&2
    exit 1
  fi
done

SSH_DIR="$HOME/.ssh"
mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

install_key() {
  local src="$1"
  local dest="$2"

  if [[ -f "$dest" ]]; then
    cat "$src" > "$dest"
  else
    install -m 600 "$src" "$dest"
  fi
}

install_key "$SRC_GITHUB" "$SSH_DIR/github"
install_key "$SRC_VPNSRV" "$SSH_DIR/vpn-srv"

echo "Done: SSH keys have been installed."
