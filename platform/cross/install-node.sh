#!/bin/bash
#
# Install node and npm.

RAW_URL="https://raw.githubusercontent.com"
STARTING_DIR="$(pwd)"

cd

echo "[+] Installing node"
wget -q -O - ${RAW_URL}/creationix/nvm/v0.30.2/install.sh |bash
. .nvm/nvm.sh
nvm install node &>/dev/null && nvm current >.nvmrc

cd "${STARTING_DIR}"
