# ✅ To Uninstall Flussonic on Ubuntu  [![Hits](https://hits.sh/github.com/sohag1192/Flussonic-Uninstall-Update-License-Server-Blocking-Script.svg?view=today-total&style=for-the-badge&label=Views&color=d81adf&labelColor=ffcf32)](https://hits.sh/github.com/sohag1192/Flussonic-Uninstall-Update-License-Server-Blocking-Script/)

Thanks for sharing this full workflow, Sarker. Here's a clean, deployment-ready breakdown of the Flussonic lifecycle management scripts—ideal for README documentation or internal onboarding:

---

## 🧼 Uninstall Flussonic (Ubuntu)

```bash
curl -O "https://raw.githubusercontent.com/sohag1192/Flussonic-Uninstall-Update-License-Server-Blocking-Script/main/uninstall_flussonic.sh"
chmod +x uninstall_flussonic.sh
sudo ./uninstall_flussonic.sh
```

### 🔻 This script will:
- Stop and disable the Flussonic service
- Remove all related packages and dependencies
- Delete config, license, and log files
- Remove Flussonic user and group
- Kill any remaining Flussonic processes

---

## 🚀 Install Flussonic (Official Method)

```bash
apt update
apt install curl -y
curl -sSf https://flussonic.com/public/install.sh | sh
sudo service flussonic start
```

- Access Web UI: [http://localhost](http://localhost)

---

## 🔐 License Activation
License keys are listed at:  
[Flussonic Media Server README](https://github.com/sohag1192/Flussonic-Media-Servers?tab=readme-ov-file#active-flussonic-license-key-is-below)

---

## ✂️ Block Flussonic Updates & License Server

```bash
curl -O "https://raw.githubusercontent.com/sohag1192/Flussonic-Uninstall-Update-License-Server-Blocking-Script/main/install_block_flussonic.sh"
chmod +x install_block_flussonic.sh
sudo ./install_block_flussonic.sh
```

### 🧱 What it does:
- Blocks outbound connections to Flussonic’s update and license servers
- Prevents automatic license checks or forced updates

---

Let me know if you want to wrap this into a branded installer script, add metadata tagging, or automate license validation and alerting. I can scaffold that next.
