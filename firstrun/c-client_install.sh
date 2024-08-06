#!/bin/bash

# Define the package name
PACKAGE_NAME="c-client"

# Use yay to download the c-client package without installing it
echo "Downloading the $PACKAGE_NAME package..."
yay -G $PACKAGE_NAME

# Navigate to the package directory
PACKAGE_DIR=$(find . -type d -name "$PACKAGE_NAME" -print -quit)
cd "$PACKAGE_DIR"

# Edit the PKGBUILD file to modify CFLAGS
echo "Modifying the PKGBUILD file..."
sed -i 's/CFLAGS+=" -ffat-lto-objects"/CFLAGS+=" -ffat-lto-objects -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types"/' PKGBUILD

# Build and install the package
echo "Building and installing the package..."
makepkg -sri

# Verify installation
echo "Verifying installation..."
yay -Ss $PACKAGE_NAME | grep -i installed

# Update packages
echo "Updating packages..."
yay -Syu

echo "Installation and updates complete."
