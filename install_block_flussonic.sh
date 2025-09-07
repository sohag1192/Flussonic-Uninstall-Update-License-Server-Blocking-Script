#!/bin/bash
# Script to block Flussonic updates and license servers
# Run as root or with sudo

echo "🔹 Blocking Flussonic package updates..."
apt-mark hold flussonic flussonic-erlang flussonic-transcoder flussonic-transcoder-base flussonic-qsv

echo "🔹 Backing up the hosts file..."
cp /etc/hosts /etc/hosts.bak

echo "🔹 Blocking Flussonic and Erlyvideo domains in /etc/hosts..."
HOSTS_BLOCK=(
    "apt.flussonic.com"
    "license.flussonic.com"
    "flussonic.com"
    "flussonic.cloud"
    "erlyvideo.org"
)

for host in "${HOSTS_BLOCK[@]}"; do
    # Avoid duplicate entries
    grep -qxF "127.0.0.1 $host" /etc/hosts || echo "127.0.0.1 $host" >> /etc/hosts
done

echo "✅ Flussonic updates and license servers have been successfully blocked."
