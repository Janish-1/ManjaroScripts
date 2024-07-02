#!/bin/bash

# Update system packages
echo "Updating system packages..."
sudo pacman -Syu

# Install .NET Core SDK, Mono, NuGet, and ASP.NET Runtime
echo "Installing .NET Core SDK, Mono, NuGet, and ASP.NET Runtime..."
sudo pacman -S dotnet-sdk mono nuget aspnet-runtime

# Create /etc/profile.d/dotnet.sh
echo "Creating /etc/profile.d/dotnet.sh..."
sudo tee /etc/profile.d/dotnet.sh > /dev/null << 'EOF'
export DOTNET_ROOT=/usr/share/dotnet
export MSBuildSDKsPath=$DOTNET_ROOT/sdk/$(${DOTNET_ROOT}/dotnet --version)/Sdks
export PATH=${PATH}:${DOTNET_ROOT}
EOF

# Source the new profile script
echo "Sourcing /etc/profile.d/dotnet.sh..."
source /etc/profile.d/dotnet.sh

# Add .dotnet tools to PATH in .bashrc
echo "Adding .dotnet tools to PATH in .bashrc..."
echo 'export PATH="$PATH:$HOME/.dotnet/tools"' >> ~/.bashrc

# Reload .bashrc to apply changes
echo "Reloading .bashrc..."
source ~/.bashrc

# Test the installation
echo "Testing .NET SDK installation..."
dotnet --version

echo "Setup complete"
