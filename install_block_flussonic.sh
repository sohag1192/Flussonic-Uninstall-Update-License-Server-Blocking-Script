#!/bin/bash

# Block Flussonic updates and license servers


echo "🔹 Blocking Flussonic package updates..."
for pkg in flussonic flussonic-erlang flussonic-transcoder flussonic-transcoder-base flussonic-qsv; do
    if apt-cache show "$pkg" >/dev/null 2>&1; then
        sudo apt-mark hold "$pkg"
        echo "$pkg set on hold."
    else
        echo "Package $pkg not found, skipping..."
    fi
done

echo "🔹 Backing up the hosts file..."
sudo cp /etc/hosts /etc/hosts.bak

echo "🔹 Blocking Flussonic and Erlyvideo domains in /etc/hosts..."
HOSTS_BLOCK=(
    "apt.flussonic.com"
    "license.flussonic.com"
    "flussonic.com"
    "flussonic.cloud"
    "erlyvideo.org"
)

for host in "${HOSTS_BLOCK[@]}"; do
    if ! grep -q "$host" /etc/hosts; then
        echo "127.0.0.1 $host" | sudo tee -a /etc/hosts >/dev/null
        echo "Blocked $host"
    else
        echo "$host already blocked"
    fi
done

echo "✅ Flussonic blocking completed successfully."

