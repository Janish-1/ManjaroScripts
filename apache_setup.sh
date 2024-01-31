sudo pacman -S apache
sudo sed -i '/^#LoadModule unique_id_module modules\/mod_unique_id.so/! s/LoadModule unique_id_module modules\/mod_unique_id.so/#LoadModule unique_id_module modules\/mod_unique_id.so/' /etc/httpd/conf/httpd.conf
sudo sed -i 's/#ServerName www.example.com:80/ServerName localhost/' /etc/httpd/conf/httpd.conf
sudo systemctl start httpd
sudo systemctl restart httpd
systemctl enable --now httpd
sudo systemctl status httpd