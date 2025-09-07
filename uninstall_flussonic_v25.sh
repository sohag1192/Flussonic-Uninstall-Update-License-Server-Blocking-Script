#!/bin/bash

# Flussonic v25 Uninstaller Script
# Author: Sohag1192
# Run as root or with sudo

LOGFILE="/var/log/flussonic_uninstall.log"
exec > >(tee -a "$LOGFILE") 2>&1

echo "🔧 Flussonic v25 Uninstaller"
echo "📅 Date: $(date)"
echo "📍 Host: $(hostname)"
echo "-------------------------------------"

# Confirm before proceeding
read -p "⚠️ Are you sure you want to uninstall Flussonic v25? [y/N]: " confirm
[[ "$confirm" != "y" && "$confirm" != "Y" ]] && echo "❌ Uninstall aborted." && exit 1

# Check if Flussonic binary exists
if [[ ! -x /opt/flussonic/flussonic ]]; then
  echo "ℹ️ Flussonic binary not found at /opt/flussonic/flussonic. Skipping binary removal."
fi

echo "🔹 Stopping Flussonic service..."
systemctl stop flussonic 2>/dev/null
systemctl disable flussonic 2>/dev/null
systemctl daemon-reload

echo "🔹 Removing Flussonic packages..."
apt-get remove --purge -y flussonic flussonic-erlang flussonic-transcoder flussonic-transcoder-base flussonic-qsv 2>/dev/null

echo "🔹 Cleaning up unused dependencies..."
apt-get autoremove -y
apt-get autoclean -y

echo "🔹 Deleting configuration files, licenses, and binaries..."
rm -rf /etc/flussonic /var/lib/flussonic /var/log/flussonic /usr/lib/flussonic /home/flussonic /opt/flussonic

echo "🔹 Removing Flussonic user and group..."
deluser --remove-home flussonic 2>/dev/null
delgroup flussonic 2>/dev/null

echo "🔹 Killing any remaining Flussonic processes..."
pkill -9 flussonic 2>/dev/null

echo "✅ Flussonic v25 has been completely uninstalled."
echo "📝 Log saved to: $LOGFILE"
