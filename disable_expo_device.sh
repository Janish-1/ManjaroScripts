sudo systemctl stop sshd
sudo ufw delete allow in 8081
sudo ufw delete allow out 8081
sudo ufw status verbose