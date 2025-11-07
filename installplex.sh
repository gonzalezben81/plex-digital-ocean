#!/bin/bash

# Plex Media Server installation script for Ubuntu/Debian

set -e  # Exit immediately if a command exits with a non-zero status
set -u  # Treat unset variables as an error

echo "=== Adding Plex repository ==="
echo "deb https://downloads.plex.tv/repo/deb public main" | sudo tee /etc/apt/sources.list.d/plexmediaserver.list

echo "=== Adding Plex GPG key ==="
curl -fsSL https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -

echo "=== Updating package lists ==="
sudo apt-get update

echo "=== Installing Plex Media Server ==="
sudo apt-get install -y plexmediaserver

echo "=== Enabling Plex service to start on boot ==="
sudo systemctl enable plexmediaserver.service

echo "=== Starting Plex Media Server ==="
sudo systemctl start plexmediaserver.service

echo "=== Checking Plex service status ==="
sudo systemctl status plexmediaserver.service --no-pager

echo "=== Allowing Plex port through UFW ==="
sudo ufw allow 32400

echo "=== Installing optional network tools (if not installed) ==="
sudo apt-get install -y net-tools

echo "=== Updating and upgrading system packages ==="
sudo apt-get update
sudo apt-get upgrade -y

echo "=== Plex installation complete ==="
echo "You can access Plex at http://<server-ip>:32400/web"
