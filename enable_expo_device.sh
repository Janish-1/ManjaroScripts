sudo systemctl start sshd
sudo ufw allow in 8081
sudo ufw allow out 8081
sudo ufw status verbose