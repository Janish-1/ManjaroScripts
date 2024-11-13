#!/bin/bash

# Update system and install dependencies
echo "Updating system and installing dependencies..."
sudo pacman -Syu --needed base-devel openssl zlib xz tk

# Check if yay is installed, if not, prompt user to install it
if ! command -v yay &> /dev/null
then
    echo "yay AUR helper not found. Please install yay to continue or use the official pyenv install script."
    echo "To install yay, you can run:"
    echo "    sudo pacman -S --needed git base-devel"
    echo "    git clone https://aur.archlinux.org/yay.git"
    echo "    cd yay"
    echo "    makepkg -si"
    exit 1
fi

# Install pyenv using yay
echo "Installing pyenv..."
yay -S --noconfirm pyenv

# Add pyenv configuration to shell startup file
echo "Configuring shell for pyenv..."
if [[ -f "$HOME/.bashrc" ]]; then
    echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc
    source ~/.bashrc
elif [[ -f "$HOME/.zshrc" ]]; then
    echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(pyenv init --path)"' >> ~/.zshrc
    echo 'eval "$(pyenv init -)"' >> ~/.zshrc
    source ~/.zshrc
else
    echo "No supported shell configuration file found. Please add the following lines to your shell configuration manually:"
    echo 'export PATH="$HOME/.pyenv/bin:$PATH"'
    echo 'eval "$(pyenv init --path)"'
    echo 'eval "$(pyenv init -)"'
fi

# Install Python versions
echo "Installing Python versions with pyenv..."
pyenv install 3.10.0

# Set Python 3.10.0 as the global version
echo "Setting Python 3.10.0 as the global version..."
pyenv global 3.10.0

# Verify installation
echo "Verifying Python version..."
python --version

echo "pyenv installation complete. You can switch Python versions using 'pyenv global <version>' or 'pyenv local <version>'."
