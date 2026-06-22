# BLACKTONE2
**WARNING:  BUILD IN PROGRESS. DO NOT RUN SCRIPT YET!!**

Part 2 of my own personal Arch Linux desktop build. Blacktone is not meant for wide use, but may be used at user discretion.

Support for Blacktone is not offered.

The Starting point for Blacktone can be found at: https://github.com/zerrubabbel/blacktone

Blacktone config files and blacktone3.sh are hosted and auditable on the companion repo at: https://github.com/zerrubabbel/blacktone2

# Description

Blacktone is opinionated, and builds an Arch Linux desktop according to my personal needs and preferences. Use at your own discretion.

Blacktone makes a few core assumptions:
- User has read and understands the script
- User understands the software and configurations that will be installed and set before executing
- systemd as the init system
- A clean base Arch installation is complete, bootable, and ready for a desktop to be constructed
- - Desired drivers should be set, and NetworkManager should be configured with default (not iwd) backend
- - ~~Blacktone is accessible during post-install chroot~~


## Curated Software and Configurations

Some software is installed or enabled at user discretion. Blacktone may or will install (including dependencies):
- reflector
- nano kitty fastfetch ufw bluez btop
- noto-fonts-cjk
- gnome gdm
- plasma cinnamon cosmic dolphin sddm
- vlc gimp steam obsidian
- Flatpak: brave extension-manager ProtonupQT cosmic-tweaks
- Services will be enabled
- - gdm is used by default, but a prompt to switch to sddm is included

Blacktone provides configurations for:
- /etc/environment
- /etc/pacman.conf
- /etc/pacman.d/mirrorlist
- $HOME/.bashrc
- kitty
- fastfetch
- In Progress
- - COSMIC
- - Cinnamon

Included Aesthetics
- Bibata-Original-Classic cursor
- BeautyDream icons
- A wallpaper collection is included, and placed in ~/Pictures/Wallpeppers

# Steps For Use

Prerequisites
1. 

curl -fsSL https://raw.githubusercontent.com/zerrubabbel/blacktone/refs/heads/main/blacktone1.sh?token=GHSAT0AAAAAAEAQZRTJRJWP747LHMJ7C73C2RYNEGQ | bash

complete and reboot

curl -fsSL https://raw.githubusercontent.com/zerrubabbel/blacktone/refs/heads/main/blacktone2.sh?token=GHSAT0AAAAAAEAQZRTJMIYIQBRFM5FZNSNI2RYNHBQ | bash

# Rationales

