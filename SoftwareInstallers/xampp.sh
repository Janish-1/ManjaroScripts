#!/bin/bash

# === CONFIGURATION ===
PHPMYADMIN_VERSION="5.2.2"
PHPMYADMIN_URL="https://files.phpmyadmin.net/phpMyAdmin/${PHPMYADMIN_VERSION}/phpMyAdmin-${PHPMYADMIN_VERSION}-all-languages.tar.gz"
ARCHIVE_NAME="phpMyAdmin-${PHPMYADMIN_VERSION}-all-languages.tar.gz"
TARGET_DIR="/opt/lampp/htdocs/phpmyadmin"

# === Download phpMyAdmin ===
echo "📥 Downloading phpMyAdmin ${PHPMYADMIN_VERSION}..."
wget -c "${PHPMYADMIN_URL}" -O "${ARCHIVE_NAME}" || { echo "❌ Download failed."; exit 1; }

# === Extract the archive ===
echo "📦 Extracting phpMyAdmin..."
tar -xzf "${ARCHIVE_NAME}" || { echo "❌ Extraction failed."; exit 1; }

# === Ensure target directory exists ===
echo "🛠️ Creating target directory if it doesn't exist..."
sudo mkdir -p "${TARGET_DIR}"

# === Move to target directory ===
echo "🚚 Installing phpMyAdmin into ${TARGET_DIR}..."
sudo rm -rf "${TARGET_DIR}"/* # Remove any existing files in the target
sudo mv "phpMyAdmin-${PHPMYADMIN_VERSION}-all-languages"/* "${TARGET_DIR}/"

# === Clean up ===
echo "🧹 Cleaning up downloaded file..."
rm -f "${ARCHIVE_NAME}"

# === Set basic permissions ===
echo "🔧 Setting permissions..."
sudo chown -R root:root "${TARGET_DIR}"
sudo chmod -R 755 "${TARGET_DIR}"

# === Done ===
echo "✅ phpMyAdmin ${PHPMYADMIN_VERSION} installed to ${TARGET_DIR}"
echo "➡️ Access it at: http://localhost/phpmyadmin"
