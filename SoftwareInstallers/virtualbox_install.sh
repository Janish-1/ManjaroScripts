mhwd-kernel -l
sudo pacman -Syu virtualbox
sudo /sbin/vboxreload
vboxmanage --version
pamac search --aur virtualbox-ext-oracle 
pamac build <matching version>
sudo gpasswd -a $USER vboxusers