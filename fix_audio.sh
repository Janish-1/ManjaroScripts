sudo pacman -Rns pipewire pipewire-pulse pipewire-alsa pipewire-jack
sudo pacman -Syu
sudo pacman -S pipewire pipewire-pulse pipewire-alsa pipewire-jack
sudo systemctl enable --now pipewire
sudo systemctl enable --now pipewire-pulse
systemctl --user status pipewire
systemctl --user status pipewire-pulse
