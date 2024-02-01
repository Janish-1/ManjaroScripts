#!/bin/bash

# Function to check and add extension to phpmariadb.ini
function add_extension_to_php_ini() {
    file_path="/etc/php/conf.d/phpmariadb.ini"
    extension=$1

    if [ ! -f "$file_path" ]; then
        echo "extension=$extension" | sudo tee "$file_path"
    else
        if ! grep -q "extension=$extension" "$file_path"; then
            echo "extension=$extension" | sudo tee -a "$file_path"
        fi
    fi
}

# Function to check and add Include line to httpd.conf
function add_include_to_httpd_conf() {
    if ! grep -q "Include conf/extra/phpmyadmin.conf" /etc/httpd/conf/httpd.conf; then
        echo 'Include conf/extra/phpmyadmin.conf' | sudo tee -a /etc/httpd/conf/httpd.conf
    fi
}

# Install phpMyAdmin
sudo pacman -S phpmyadmin

# Add extensions to phpmariadb.ini
add_extension_to_php_ini "bz2"
add_extension_to_php_ini "iconv"
add_extension_to_php_ini "mysqli"
add_extension_to_php_ini "pdo_mysql"

# Create phpmyadmin.conf if it does not exist
phpmyadmin_conf="/etc/httpd/conf/extra/phpmyadmin.conf"
if [ ! -f "$phpmyadmin_conf" ]; then
    echo 'Alias /phpmyadmin "/usr/share/webapps/phpMyAdmin"' | sudo tee "$phpmyadmin_conf"
    echo '<Directory "/usr/share/webapps/phpMyAdmin">' | sudo tee -a "$phpmyadmin_conf"
    echo 'DirectoryIndex index.php' | sudo tee -a "$phpmyadmin_conf"
    echo 'AllowOverride All' | sudo tee -a "$phpmyadmin_conf"
    echo 'Options FollowSymlinks' | sudo tee -a "$phpmyadmin_conf"
    echo 'Require all granted' | sudo tee -a "$phpmyadmin_conf"
    echo '</Directory>' | sudo tee -a "$phpmyadmin_conf"
    add_include_to_httpd_conf
fi

# Check Apache configuration
sudo apachectl configtest

# Restart Apache
sudo apachectl restart

# Generate a random hexadecimal number for blowfish_secret
blowfish_secret=$(openssl rand -hex 16)

# Update phpMyAdmin configuration file
sudo sed -i "s/\$cfg\['blowfish_secret'\] = '';/\$cfg\['blowfish_secret'\] = '$blowfish_secret';/" /etc/webapps/phpmyadmin/config.inc.php
echo "\$cfg['TempDir'] = '/tmp';" | sudo tee -a /etc/webapps/phpmyadmin/config.inc.php

# Restart the web server to apply changes
sudo systemctl restart httpd
