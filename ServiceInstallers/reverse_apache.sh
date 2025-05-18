#!/bin/sh

# Stop and disable Apache service
echo "Stopping and disabling Apache service..."
sudo systemctl stop httpd
sudo systemctl disable httpd

# Remove Apache package
echo "Removing Apache package..."
sudo pacman -Rns --noconfirm apache

# Restore the original httpd.conf if backup exists
if [ -f /etc/httpd/conf/httpd.conf.bak ]; then
    echo "Restoring original httpd.conf from backup..."
    sudo mv /etc/httpd/conf/httpd.conf.bak /etc/httpd/conf/httpd.conf
else
    echo "Backup httpd.conf.bak not found. Skipping restore."
fi

# Remove sample index.html page
if [ -f /srv/http/index.html ]; then
    echo "Removing sample index.html page..."
    sudo rm /srv/http/index.html
else
    echo "Sample index.html not found. Skipping deletion."
fi

# Optional: clean pacman cache (commented out by default)
# echo "Cleaning pacman cache..."
# sudo pacman -Sc --noconfirm

echo "Apache uninstallation and configuration rollback complete."
