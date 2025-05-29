#!/bin/bash
set -e

# Variables
MONERO_URL="https://downloads.getmonero.org/cli/linux64"
TMPDIR=$(mktemp -d)
INSTALL_DIR="$HOME/monero-cli"

echo "Downloading Monero CLI..."
curl -L $MONERO_URL -o "$TMPDIR/monero.tar.bz2"

echo "Extracting..."
mkdir -p "$INSTALL_DIR"
tar -xjf "$TMPDIR/monero.tar.bz2" -C "$INSTALL_DIR" --strip-components=1

echo "Cleaning up..."
rm -rf "$TMPDIR"

echo "Starting monero-wallet-cli with remote node..."

# Run the wallet CLI with a public remote node
"$INSTALL_DIR/monero-wallet-cli" --daemon-address node.moneroworld.com:18089
