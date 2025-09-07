#!/bin/bash

# Script to completely uninstall Flussonic v25
# Run as root or with sudo

echo "🔹 Stopping Flussonic services..."
systemctl stop flussonic 2>/dev/null
systemctl disable flussonic 2>/dev/null

echo "🔹 Removing Flussonic packages..."
apt-get remove --purge -y flussonic flussonic-erlang flussonic-transcoder flussonic-transcoder-base flussonic-qsv 2>/dev/null

echo "🔹 Cleaning up unused dependencies..."
apt-get autoremove -y
apt-get autoclean -y

echo "🔹 Deleting configuration files, licenses, and certificates..."
rm -rf /etc/flussonic
rm -rf /var/lib/flussonic
rm -rf /var/log/flussonic
rm -rf /usr/lib/flussonic
rm -rf /home/flussonic
rm -rf /opt/flussonic

echo "🔹 Removing Flussonic user and group..."
deluser --remove-home flussonic 2>/dev/null
delgroup flussonic 2>/dev/null

echo "🔹 Killing any remaining Flussonic processes..."
pkill -9 flussonic 2>/dev/null

echo "✅ Flussonic v25 has been completely uninstalled."