# ✅ To Uninstall Flussonic on Ubuntu
You can run the script directly like this:

        curl -O "https://raw.githubusercontent.com/sohag1192/Flussonic-Uninstall-Update-License-Server-Blocking-Script/main/uninstall_flussonic.sh"
        chmod +x uninstall_flussonic.sh
        sudo ./uninstall_flussonic.sh

This will:
- Stop and disable the Flussonic service
- Remove all related packages and dependencies
- Delete config, license, and log files
- Remove the Flussonic user and group
- Kill any remaining Flussonic processes

# 🛠️ To Install Flussonic on Ubuntu
Here’s the official and fastest method

        apt update
        apt install curl -y
        curl -sSf https://flussonic.com/public/install.sh | sh
        sudo service flussonic start

Then open your browser and go to:
http://localhost — this is the Flussonic web interface.


# ✂️Block Flussonic.sh script to block Flussonic updates and license servers on both Ubuntu systems.
## 1. Download the script

        curl -O "https://raw.githubusercontent.com/sohag1192/Flussonic-Uninstall-Update-License-Server-Blocking-Script/main/install_block_flussonic.sh"
        chmod +x install_block_flussonic.sh
        sudo ./install_block_flussonic.sh
