sudo pacman -Syu
yay -S mongodb-bin mongodb-tools-bin mongodb-compass
sudo systemctl start mongodb
sudo systemctl enable mongodb
mongod --version 