sudo pacman -Syu docker
sudo systemctl status docker.service
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo docker version
sudo docker info

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

gpg --generate-key
pass init <public-key> 
