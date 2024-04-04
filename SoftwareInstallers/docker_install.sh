sudo pacman -Syu docker
sudo systemctl status docker.service
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo docker version
sudo docker info

# Generate a key
gpg --generate-key
# Stores Pass Key to a file
pass init <public-key> 
