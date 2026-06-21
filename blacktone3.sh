# blacktone3.sh
# ENVIRONMENT CHECKS

if [[ $EUID -eq 0 ]]; then
    echo "blacktonep2.sh cannot be run as root"
    exit 1
fi

if [[ "${XDG_CURRENT_DESKTOP:-}" != *GNOME* ]]; then
    echo "BlacktoneP2 must be run from a GNOME session."
    exit 1
fi

if [[ ! -f /etc/arch-release ]]; then
    echo "This script requires Arch Linux."
    exit 1
fi

if ! command -v systemctl >/dev/null; then
    echo "systemd is required."
    exit 1
fi

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
#THREADS=${THREADS:-$(nproc)} # prepped for Code Red setup script

clear

# FILE CHECKS

echo "Checking for needed files... "

dependency-check() {
  sleep 2
}

dependency-check

clear

# PREAMBLE

echo "This is Blacktone setup part 2."
echo " "
echo "This Blacktone script assumes som prerecquisite conditions are met"
sleep 3
echo " "
echo "1. You have completed Blacktone setup part 1"
echo "2. YOu are using systemd"
echo "3. You are logged into Gnome"
echo "4. You are familiar with the curated software and configurations provided by Blacktone"
echo "    - See README.md for details"
echo "5. You are running this script as your user, not as root"
sleep 3

echo " "

readyup() {
  local readystate

  echo "Are the prerequisite conditions met, and do you wish to continue?"

  read -rp "to continue, type exactly 'yes', and press enter:  " readystate

  if [[ "$readystate" != 'yes' ]]; then
    echo "Exiting Blacktone setup part 2"
    exit 1
  fi
}

readyup

clear

# DESKTOP ENVIRONMENTS

echo "Installing Desktop Environments... "

sudo pacman -Syu
sudo pacman -S --needed \
  plasma \
  cinnamon \
  cosmic \
  sddm \
  dolphin

clear
sleep 2

echo "Enabling services... "
sleep 2

echo "Blacktone is about to enable the sddm display manager, do you wish to continue?"

sddm-enable() {
  local dm_choice

  read -rp "to enable sddm, type exactly 'yes', and press enter:  " dm_choice

  if [[ "$dm_choice" = 'yes' ]]; then
    sudo systemctl disable gdm.service
    sudo systemctl enable sddm.service
  fi
}

sddm-enable

clear

# GUI SOFTWARE

echo "Installing GUI software... "

sudo pacman -S --needed --noconfirm \
  gimp \
  steam \
  obsidian \
  vlc

flatpak install --noninteractive flathub \
  com.brave.Browser \
  app.zen_browswer.zen \
  dev.edfloreshz.CosmicTweaks \
  net.davidotek.pupgui2

clear
sleep 2

# SYSTEM CONFIGURATION

## .bashrc and arch-notes

## fastfetch

## kitty

## Wallpeppers and icons

# CINNAMON CONFIGURATION

# COSMIC CONFIGURATION

# CLEANUP AND EXIT






