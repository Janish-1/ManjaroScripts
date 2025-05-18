#!/bin/bash

# === CONFIGURATION ===
PHPMYADMIN_VERSION="5.2.2"
ARCHIVE_NAME="phpMyAdmin-${PHPMYADMIN_VERSION}-all-languages.tar.gz"
TARGET_DIR="/opt/lampp/htdocs/phpmyadmin"

# === Remove phpMyAdmin directory ===
if [ -d "${TARGET_DIR}" ]; then
    echo "🗑️ Removing phpMyAdmin directory at ${TARGET_DIR}..."
    sudo rm -rf "${TARGET_DIR}"
else
    echo "⚠️ phpMyAdmin directory not found at ${TARGET_DIR}, skipping..."
fi

# === Remove the downloaded archive if it exists ===
if [ -f "${ARCHIVE_NAME}" ]; then
    echo "🧹 Deleting leftover archive ${ARCHIVE_NAME}..."
    rm -f "${ARCHIVE_NAME}"
else
    echo "ℹ️ No archive file ${ARCHIVE_NAME} found, skipping..."
fi

# === Done ===
echo "✅ phpMyAdmin ${PHPMYADMIN_VERSION} has been removed."
