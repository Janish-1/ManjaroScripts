git clone https://aur.archlinux.org/tclkit.git /run/media/janish/home/tclkit
cd /run/media/janish/home/tclkit
makepkg -s
zst_file=$(find . -type f -name "$package_name-*.pkg.tar.zst" -exec basename {} \;)
sudo pacman -u "$zst_file"
makepkg -i