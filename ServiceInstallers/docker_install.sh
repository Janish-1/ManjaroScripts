sudo pamac install docker
sudo pamac install docker-compose
sudo systemctl start docker.service
sudo systemctl stop docker.service
sudo systemctl enable docker.service
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker