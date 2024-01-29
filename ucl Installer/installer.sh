git clone https://aur.archlinux.org/ucl.git /run/media/janish/home/ucl
cd /run/media/janish/home/ucl
makepkg -s
zst_file=$(find . -type f -name "$package_name-*.pkg.tar.zst" -exec basename {} \;)
sudo pacman -u "$zst_file"
makepkg -i