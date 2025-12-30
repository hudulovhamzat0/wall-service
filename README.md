# KDE Wallpaper Power Switcher

Automatically switches KDE Plasma wallpapers based on AC power state.

When the laptop is **plugged in**, it enables a **video wallpaper**.  
When running on **battery**, it switches back to a **static image wallpaper** to save power.

---

## ✨ Features

- Detects AC / battery status automatically
- Supports multiple desktops
- Runs as a **systemd user service**
- Lightweight (bash + dbus)
- Designed for KDE Plasma

---

## 📦 Requirements

- KDE Plasma
- `dbus-send`
- Video wallpaper plugin:  
  `luisbocanegra.smart.video.wallpaper.reborn`
- Linux laptop with `/sys/class/power_supply`

> ⚠️ This script must run as a **user service**, not a system service.

---

## 📁 Project Structure



wallpaper-power/ <br>
├── wallpaper-power.sh<br>
├── wallpaper-power.service<br>
├── README.md<br>
├── LICENSE<br>

<br>
---

## 🚀 Installation

### 1. Clone the repository
git clone https://github.com/hudulovhamzat0/wallpaper-power.git
cd wallpaper-power


### 2. Install the script

sudo mkdir -p /opt/wallpaper-power
sudo cp wallpaper-power.sh /opt/wallpaper-power/
sudo chmod +x /opt/wallpaper-power/wallpaper-power.sh


### 3. Install the user service

mkdir -p ~/.config/systemd/user
cp wallpaper-power.service ~/.config/systemd/user/


### 4. Enable and start the service


systemctl --user daemon-reload
systemctl --user enable wallpaper-power
systemctl --user start wallpaper-power




## 🧠 How It Works

* Checks AC power state every 60 seconds
* When AC is connected:

  * Enables the video wallpaper plugin
* When running on battery:

  * Switches to the default KDE image wallpaper
* Applies changes to **all desktops**

---

## 🖥 Wayland / X11 Notes

* Works best on **X11**
* On Wayland, behavior may vary depending on KDE and DBus session availability

---

## 🛑 Uninstall

systemctl --user stop wallpaper-power
systemctl --user disable wallpaper-power
rm ~/.config/systemd/user/wallpaper-power.service
sudo rm -rf /opt/wallpaper-power


