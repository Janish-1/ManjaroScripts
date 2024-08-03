#!/bin/sh

# Install PHP 8.0 and all listed modules
yay -S php80-redis php80-imagick php80-apcu php80 php80-cli php80-cgi php80-fpm php80-embed php80-apache php80-litespeed php80-pear php80-pecl php80-phpdbg php80-xml php80-xsl php80-xmlreader php80-xmlwriter php80-dom php80-simplexml php80-openssl php80-pdo php80-mysql php80-phar php80-pcntl php80-posix php80-shmop php80-sockets php80-sysvmsg php80-sysvsem php80-sysvshm php80-tokenizer php80-dba php80-pgsql php80-odbc php80-firebird php80-dblib php80-sqlite php80-gd php80-exif php80-tidy php80-iconv php80-bcmath php80-gmp php80-zip php80-bz2 php80-fileinfo php80-ctype php80-mbstring php80-pspell php80-enchant php80-intl php80-calendar php80-gettext php80-soap php80-ftp php80-curl php80-snmp php80-ldap php80-imap php80-sodium php80-ffi php80-opcache php80-pdo_sqlsrv php80-xdebug php80-rar php80-openswoole php80-memcached
sudo pacman -Syu php-apache

# Backup the original httpd.conf file
echo "Backing up the original httpd.conf file..."
sudo cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.bak

# Edit the httpd.conf file to load the mpm_prefork_module
echo "Configuring Apache for PHP 8.0..."
sudo sed -i 's/^LoadModule mpm_event_module/#LoadModule mpm_event_module/' /etc/httpd/conf/httpd.conf
sudo sed -i 's/^#LoadModule mpm_prefork_module/LoadModule mpm_prefork_module/' /etc/httpd/conf/httpd.conf

# Add PHP module configuration to the end of httpd.conf
echo "Adding PHP module configuration to httpd.conf..."
sudo bash -c 'cat <<EOF >> /etc/httpd/conf/httpd.conf

# PHP 8.0 module configuration
LoadModule php_module modules/libphp.so
AddHandler php-script .php
Include conf/extra/php_module.conf
EOF'

# Update the PHP executable symbolic link
echo "Updating PHP executable symbolic link..."
sudo ln -sf /usr/bin/php80 /usr/bin/php

# Check Apache configuration
echo "Checking Apache configuration..."
sudo apachectl configtest

# Restart Apache service
echo "Restarting Apache service..."
sudo systemctl restart httpd

# Create a PHP info page
echo "Creating a PHP info page..."
echo "<?php phpinfo(); ?>" | sudo tee /srv/http/info.php > /dev/null

# Display a message indicating how to test the PHP 8.0 configuration
SERVER_IP=$(hostname -I | awk '{print $1}')
echo "PHP 8.0 installation and configuration complete."
echo "Test the PHP 8.0 configuration by opening http://$SERVER_IP/info.php in your web browser."
