git clone https://aur.archlinux.org/sdx.git /run/media/janish/home/sdx
cd /run/media/janish/home/sdx
makepkg -s
zst_file=$(find . -type f -name "$package_name-*.pkg.tar.zst" -exec basename {} \;)
sudo pacman -u "$zst_file"
makepkg -i