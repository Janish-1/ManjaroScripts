#!/bin/sh

# Update package database and install Apache
echo "Updating package database and installing Apache..."
sudo pacman -Syu apache

# Backup the original httpd.conf file
echo "Backing up the original httpd.conf file..."
sudo cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.bak

# Edit the httpd.conf file
echo "Editing httpd.conf..."
sudo sed -i 's/^LoadModule unique_id_module/#LoadModule unique_id_module/' /etc/httpd/conf/httpd.conf

# Set ServerAdmin email
echo "Setting ServerAdmin email..."
sudo sed -i 's/^ServerAdmin .*/ServerAdmin you@example.com/' /etc/httpd/conf/httpd.conf

# Set ServerName to server's IP address
SERVER_IP=$(hostname -I | awk '{print $1}')
echo "Setting ServerName to $SERVER_IP..."
sudo sed -i "s/^#ServerName .*/ServerName $SERVER_IP:80/" /etc/httpd/conf/httpd.conf

# Enable and start the Apache service
echo "Enabling and starting Apache service..."
sudo systemctl enable --now httpd

# Verify the status of the Apache service
echo "Verifying Apache service status..."
sudo systemctl status httpd

# Create a sample index.html page in the default web root
echo "Creating a sample index.html page..."
echo "<h2>It works!</h2>" | sudo tee /srv/http/index.html > /dev/null

# Display a message indicating how to test the web service
echo "Installation and configuration complete."
echo "Test the web service by opening http://$SERVER_IP in your web browser."
