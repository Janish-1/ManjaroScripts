sudo pacman -Syu
sudo pamac build mongodb-bin
sudo pamac build mongodb-tools-bin
sudo pamac build mongodb-compass
sudo systemctl start mongodb
sudo systemctl enable mongodb
mongod --version 