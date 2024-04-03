sudo pacman -Syu patchelf smtp-forwarder openssl-1.1 postgresql-libs unixodbc libfbclient freetds tidy aspell libvoikko hspell nuspell
git clone https://aur.archlinux.org/php80.git /home/janish/Data/ManjaroScripts/Builds/php80
cd /home/janish/Data/ManjaroScripts/Builds/php80
makepkg -si