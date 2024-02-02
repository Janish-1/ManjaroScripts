git clone https://aur.archlinux.org/snapd.git /run/media/janish/home/snapd
cd /run/media/janish/home/snapd
sudo pacman -S go go-tools python-docutils autoconf-archive
makepkg -si
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install postman