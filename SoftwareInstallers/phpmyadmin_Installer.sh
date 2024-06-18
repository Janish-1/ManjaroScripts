#!/bin/sh

# Update package database and install phpMyAdmin
echo "Updating package database and installing phpMyAdmin..."
sudo pacman -Syu phpmyadmin

# Create/Edit the phpMaraDB configuration file
echo "Configuring PHP for MariaDB..."
sudo bash -c 'cat <<EOF > /etc/php/conf.d/phpmariadb.ini
extension=bz2
extension=iconv
extension=mysqli
extension=pdo_mysql
EOF'

# Verify the ini-file is loaded
echo "Verifying PHP configuration..."
php --ini | grep -i "Loaded Configuration File"
php --ini | grep -i "Scan for additional .ini files in"

# Create Apache configuration for phpMyAdmin
echo "Creating Apache configuration for phpMyAdmin..."
sudo bash -c 'cat <<EOF > /etc/httpd/conf/extra/phpmyadmin.conf
Alias /phpmyadmin "/usr/share/webapps/phpMyAdmin"
<Directory "/usr/share/webapps/phpMyAdmin">
    DirectoryIndex index.php
    AllowOverride All
    Options FollowSymlinks
    Require all granted
</Directory>
EOF'

# Include the phpMyAdmin configuration in httpd.conf
echo "Including phpMyAdmin configuration in httpd.conf..."
if ! grep -q "Include conf/extra/phpmyadmin.conf" /etc/httpd/conf/httpd.conf; then
    echo "Include conf/extra/phpmyadmin.conf" | sudo tee -a /etc/httpd/conf/httpd.conf > /dev/null
fi

# Configure phpMyAdmin
echo "Configuring phpMyAdmin..."
BLOWFISH_SECRET=$(openssl rand -hex 16)
sudo sed -i -e "/blowfish_secret/s/''/'$BLOWFISH_SECRET'/g" /etc/webapps/phpmyadmin/config.inc.php
sudo bash -c 'echo "\$cfg[\"TempDir\"] = \"/tmp\";" >> /etc/webapps/phpmyadmin/config.inc.php'

# Test Apache configuration
echo "Testing Apache configuration..."
sudo apachectl configtest

# Restart Apache service
echo "Restarting Apache service..."
sudo systemctl restart httpd

# Display a message indicating how to access phpMyAdmin
SERVER_IP=$(hostname -I | awk '{print $1}')
echo "phpMyAdmin installation and configuration complete."
echo "You can access phpMyAdmin by opening http://$SERVER_IP/phpmyadmin in your web browser."
