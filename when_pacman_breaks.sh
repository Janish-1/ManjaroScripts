sudo pacman-mirrors -f5 && sudo pacman -Syyu
sudo pacman-mirrors --geoip
sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syu
sudo pacman-mirrors --api --set-branch testing
sudo pacman-mirrors --api --set-branch stable
sudo pacman-mirrors --api --set-branch unstable
sudo pacman-mirrors -id
sudo pacman-mirrors -c all
