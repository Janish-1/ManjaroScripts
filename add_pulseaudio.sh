#!/bin/bash

# Stop and disable PipeWire services and sockets
systemctl --user stop pipewire.socket
systemctl --user disable pipewire.socket
systemctl --user stop pipewire
systemctl --user disable pipewire
systemctl --user stop pipewire-pulse.socket
systemctl --user disable pipewire-pulse.socket
systemctl --user stop pipewire-pulse
systemctl --user disable pipewire-pulse

# Update the system
sudo pacman -Syu

# Install PulseAudio and related packages
sudo pacman -S pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-jack pulseaudio-lirc pulseaudio-equalizer pulseaudio-zeroconf

# Enable and start PulseAudio services
systemctl --user enable pulseaudio
systemctl --user start pulseaudio

# Check the status of PulseAudio services
systemctl --user status pulseaudio
