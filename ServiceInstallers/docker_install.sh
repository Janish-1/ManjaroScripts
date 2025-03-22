#!/bin/bash

set -e  # Exit on error

# Define versions and URLs
DOCKER_CLIENT_VERSION="28.0.2"
DOCKER_CLIENT_URL="https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_CLIENT_VERSION.tgz"
DOCKER_DESKTOP_VERSION="184744"
DOCKER_DESKTOP_PKG="docker-desktop-x86_64.pkg.tar.zst"
DOCKER_DESKTOP_URL="https://desktop.docker.com/linux/main/amd64/$DOCKER_DESKTOP_VERSION/$DOCKER_DESKTOP_PKG"

# Uninstall conflicting packages
echo "Removing conflicting packages: docker and docker-compose..."
sudo pacman -Rns --noconfirm docker docker-compose

echo "Downloading Docker client..."
wget "$DOCKER_CLIENT_URL" -qO- | tar xvfz - docker/docker --strip-components=1

# Move binary to /usr/local/bin
sudo mv ./docker /usr/local/bin
sudo chmod +x /usr/local/bin/docker

echo "Docker client installed successfully."

# Download and install Docker Desktop package for Arch
if [ ! -f "$DOCKER_DESKTOP_PKG" ]; then
    echo "Downloading Docker Desktop package..."
    wget "$DOCKER_DESKTOP_URL" -O "$DOCKER_DESKTOP_PKG"
fi

# Install the package
echo "Installing Docker Desktop..."
sudo pacman -U --noconfirm "$DOCKER_DESKTOP_PKG"

echo "Docker Desktop installed successfully."

# Start Docker Desktop
if command -v systemctl &> /dev/null; then
    echo "Starting Docker Desktop..."
    systemctl --user start docker-desktop
    echo "Docker Desktop started."
else
    echo "Please start Docker Desktop manually from your application menu."
fi

echo "Installation complete!"