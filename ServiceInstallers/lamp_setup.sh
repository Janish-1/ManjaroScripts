#!/bin/bash

sudo pacman -Sy libxcrypt-compat

# Automatically detect current user and group
USERNAME="$(whoami)"
GROUPNAME="$(id -gn)"

# Download URL for XAMPP 8.2.12
DOWNLOAD_URL="https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.2.12/xampp-linux-x64-8.2.12-0-installer.run/download"
INSTALLER_NAME="xampp-linux-x64-8.2.12-0-installer.run"
INSTALLER_PATH="$HOME/Desktop/$INSTALLER_NAME"

echo "[*] Downloading XAMPP installer to ~/Desktop..."
wget -O "$INSTALLER_PATH" "$DOWNLOAD_URL"

# Check if the file was downloaded
if [ ! -f "$INSTALLER_PATH" ]; then
    echo "[✘] Failed to download XAMPP installer!"
    exit 1
fi

echo "[*] Making installer executable..."
chmod 755 "$INSTALLER_PATH"

echo "[*] Running installer..."
sudo "$INSTALLER_PATH"

echo "[*] Creating systemd service file for XAMPP..."
SERVICE_FILE="/etc/systemd/system/xampp.service"

sudo bash -c "cat > $SERVICE_FILE" << EOF
[Unit]
Description=XAMPP

[Service]
ExecStart=/opt/lampp/lampp start
ExecStop=/opt/lampp/lampp stop
Type=forking

[Install]
WantedBy=multi-user.target
EOF

echo "[*] Setting permissions on service file..."
sudo chmod a+x "$SERVICE_FILE"

echo "[*] Enabling and starting XAMPP service..."
sudo systemctl enable --now xampp.service

echo "[*] Fixing phpMyAdmin temp directory issue..."
sudo mkdir -p /opt/lampp/phpmyadmin/tmp
sudo chmod 0777 /opt/lampp/phpmyadmin/tmp

echo "[*] Updating config.inc.php..."
CONFIG_FILE="/opt/lampp/phpmyadmin/config.inc.php"
LINE="\$cfg['TempDir'] = \"/opt/lampp/phpmyadmin/tmp\";"

if ! grep -Fxq "$LINE" "$CONFIG_FILE"; then
    echo "$LINE" | sudo tee -a "$CONFIG_FILE"
fi

echo "[*] Backing up httpd.conf..."
sudo cp /opt/lampp/etc/httpd.conf /opt/lampp/etc/httpd.conf.bak

echo "[*] Updating Apache to run as $USERNAME:$GROUPNAME..."
sudo sed -i "s/^User .*/User $USERNAME/" /opt/lampp/etc/httpd.conf
sudo sed -i "s/^Group .*/Group $GROUPNAME/" /opt/lampp/etc/httpd.conf

echo "[*] Restarting XAMPP to apply changes..."
sudo /opt/lampp/lampp restart

echo "[✔] XAMPP 8.2.12 installed and configured!"
echo "Visit http://localhost/ to verify."
