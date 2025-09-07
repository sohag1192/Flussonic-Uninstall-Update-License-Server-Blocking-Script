#!/bin/bash

# Universal Flussonic Uninstaller (All Versions)
# Author: Sohag1192
# Run as root or with sudo

LOGFILE="/var/log/flussonic_full_uninstall.log"
exec > >(tee -a "$LOGFILE") 2>&1

echo "🔧 Flussonic Uninstaller - All Versions"
echo "📅 Date: $(date)"
echo "📍 Host: $(hostname)"
echo "-------------------------------------"

read -p "⚠️ Are you sure you want to uninstall ALL Flussonic versions? [y/N]: " confirm
[[ "$confirm" != "y" && "$confirm" != "Y" ]] && echo "❌ Uninstall aborted." && exit 1

echo "🔹 Stopping Flussonic service..."
systemctl stop flussonic 2>/dev/null
systemctl disable flussonic 2>/dev/null
systemctl reset-failed flussonic 2>/dev/null
systemctl daemon-reload

echo "🔹 Removing Flussonic packages..."
apt-get remove --purge -y flussonic* flussonic-erlang flussonic-transcoder* flussonic-qsv* 2>/dev/null

echo "🔹 Cleaning up unused dependencies..."
apt-get autoremove -y
apt-get autoclean -y

echo "🔹 Deleting Flussonic directories and binaries..."
rm -rf /etc/flussonic /var/lib/flussonic /var/log/flussonic /usr/lib/flussonic /opt/flussonic /home/flussonic /usr/local/flussonic /usr/share/flussonic

echo "🔹 Removing Flussonic user and group..."
deluser --remove-home flussonic 2>/dev/null
delgroup flussonic 2>/dev/null

echo "🔹 Killing any remaining Flussonic processes..."
pkill -9 flussonic 2>/dev/null

echo "✅ All Flussonic versions have been fully uninstalled."
echo "📝 Log saved to: $LOGFILE"
