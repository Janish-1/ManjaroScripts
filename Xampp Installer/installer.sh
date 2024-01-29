git clone https://aur.archlinux.org/xampp.git /run/media/janish/home/Xampp/
cd /run/media/janish/home/Xampp/
makepkg -s
zst_file=$(find . -type f -name "$package_name-*.pkg.tar.zst" -exec basename {} \;)
sudo pacman -U "$zst_file"
makepkg -i