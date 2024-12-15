#!/bin/bash

# Define variables
URL="https://code.visualstudio.com/sha/download?build=stable&os=linux-x64"
FILENAME="vscode-linux-x64.tar.gz"
INSTALL_DIR="$HOME/.local/share/code"

echo "Downloading Visual Studio Code..."
curl -L -o "$FILENAME" "$URL"

if [[ $? -ne 0 ]]; then
    echo "Failed to download Visual Studio Code. Exiting."
    exit 1
fi

echo "Download complete. Extracting the archive..."
mkdir -p "$INSTALL_DIR"
tar -xzf "$FILENAME" --strip-components=1 -C "$INSTALL_DIR"

if [[ $? -ne 0 ]]; then
    echo "Failed to extract the archive. Exiting."
    exit 1
fi

# Clean up
rm "$FILENAME"

echo "Visual Studio Code has been installed in $INSTALL_DIR."

# Add to PATH
PROFILE_FILE="$HOME/.bashrc"
if ! grep -q "export PATH=\$PATH:$INSTALL_DIR/bin" "$PROFILE_FILE"; then
    echo "export PATH=\$PATH:$INSTALL_DIR/bin" >> "$PROFILE_FILE"
    echo "Added VS Code to PATH. Please restart your terminal or run:"
    echo "source $PROFILE_FILE"
fi

echo "Installation complete. Run 'code' to start Visual Studio Code."
