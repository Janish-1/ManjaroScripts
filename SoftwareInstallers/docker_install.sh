sudo pacman -Syu docker
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo docker version
sudo docker info
sudo wget https://desktop.docker.com/linux/main/amd64/139021/docker-desktop-4.28.0-x86_64.pkg.tar.zst
sudo pacman -U docker-desktop-4.28.0-x86_64.pkg.tar.zst
sudo systemctl status docker.service
sudo systemctl start docker.service
# Generate a key
gpg --generate-key
# Stores Pass Key to a file
pass init <public-key> 
