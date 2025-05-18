sudo rm -rf /var/lib/pacman/sync/*
sudo rm -rf /var/tmp/pamac/*
sudo pacman -Syy
sudo pamac clean
sudo pacman -Sc
