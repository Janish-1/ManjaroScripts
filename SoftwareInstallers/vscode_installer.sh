#!/bin/bash

# Script to install Visual Studio Code from tar.gz on Manjaro Linux

# Set variables
VSCODE_URL="https://code.visualstudio.com/sha/download?build=stable&os=linux-x64" # Official download link
VSCODE_TAR="vscode.tar.gz"
INSTALL_DIR="/opt/vscode"

# Step 1: Download the tar.gz file
echo "Downloading Visual Studio Code..."
wget -O "$VSCODE_TAR" "$VSCODE_URL"

# Step 2: Extract the tar.gz file
echo "Extracting Visual Studio Code..."
tar -xzf "$VSCODE_TAR"

# Step 3: Move the extracted files to /opt directory
echo "Moving Visual Studio Code to $INSTALL_DIR..."
sudo mv VSCode-linux-x64 "$INSTALL_DIR"

# Step 4: Create a symbolic link to /usr/local/bin
echo "Creating a symbolic link..."
sudo ln -sf "$INSTALL_DIR/code" /usr/local/bin/code

# Step 5: Create a desktop entry
echo "Creating desktop shortcut..."
sudo bash -c 'cat > /usr/share/applications/code.desktop' <<EOF
[Desktop Entry]
Name=Visual Studio Code
Comment=Code Editing. Redefined.
Exec=$INSTALL_DIR/code
Icon=$INSTALL_DIR/resources/app/resources/linux/code.png
Type=Application
Terminal=false
Categories=Utility;TextEditor;Development;IDE;
EOF

# Step 6: Cleanup
echo "Cleaning up..."
rm -f "$VSCODE_TAR"

# Step 7: Verify installation
echo "Verifying installation..."
if command -v code &> /dev/null; then
    echo "Visual Studio Code installed successfully! 🎉"
    code --version
else
    echo "Error: Visual Studio Code installation failed."
fi
