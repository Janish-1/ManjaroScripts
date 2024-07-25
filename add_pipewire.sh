#!/bin/bash

# Stop and disable PulseAudio services and sockets
systemctl --user stop pulseaudio.socket
systemctl --user disable pulseaudio.socket
systemctl --user stop pulseaudio
systemctl --user disable pulseaudio

# Update the system
sudo pacman -Syu

# Install PipeWire and related packages
sudo pacman -S pipewire pipewire-pulse pipewire-alsa pipewire-jack

# Enable and start PipeWire services
systemctl --user enable --now pipewire
systemctl --user enable --now pipewire-pulse

# Check the status of PipeWire services
systemctl --user status pipewire
systemctl --user status pipewire-pulse
