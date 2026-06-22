# ____    _    ____  _   _       ____   ____ 
#| __ )  / \  / ___|| | | |     |  _ \ / ___|
#|  _ \ / _ \ \___ \| |_| |_____| |_) | |    
#| |_) / ___ \ ___) |  _  |_____|  _ <| |___ 
#|____/_/   \_\____/|_| |_|     |_| \_\\____|

## ~/.bashrc
## For Arch Linux

## == BASH DEFAULTS ==

[[ $- != *i* ]] && return

alias ls='ls -lah --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

## == CUSTOM CONFIGS ==

## General Shortcuts

alias "cl"="clear && header"
alias "sdnow"="shutdown +0"
alias ".."="cd .."
alias "..."="cd ../.."

nap() {
  	local minutes

  	read -rp "Time in minutes? [30] " minutes
  	minutes="${minutes:-30}"

 	sudo shutdown \
		-f \
		+"$minutes"
}

pings() {
  	local count
  	local target

  	read -rp "Ping count? [5] " count
  	count="${count:-5}"

  	read -rp "Target? [google.com] " target
  	target="${target:-google.com}"

  	ping \
    	-c "$count" \
    	"$target"
}

## Pacman

pacup() {
	local flatpak_choice
	local pacman_choice
	local orphan_choice
	local flatpak_orphan_choice

	read -rp "Update Flatpaks? [Y/n] " flatpak_choice
	read -rp "Update Core, Extra, and Multilib? [Y/n] " pacman_choice
	read -rp "Remove orphaned packages? [Y/n] " orphan_choice
	read -rp "Remove unused Flatpak runtimes? [Y/n] " flatpak_orphan_choice

	if [[ -z "$flatpak_choice" || "$flatpak_choice" =~ ^[Yy]$ ]]; then
    	flatpak update
  	fi

  	if [[ -z "$pacman_choice" || "$pacman_choice" =~ ^[Yy]$ ]]; then
    	sudo pacman -Syu
  	fi

  	if [[ -z "$orphan_choice" || "$orphan_choice" =~ ^[Yy]$ ]]; then
    	remove-orphans
  	fi

  	if [[ -z "$flatpak_orphan_choice" || "$flatpak_orphan_choice" =~ ^[Yy}$ ]]; then
    	flatpak uninstall --unused
  	fi
}

remove-orphans() {
	local orphans

	orphans=$(pacman -Qdtq)

	if [[ -n "$orphans" ]]; then
		sudo pacman -Rns -- $orphans
	else
		echo "No orphaned packages found"
	fi
}

alias "pacvs"="pacman -Q cosmic-session cinnamon plasma-desktop gnome-user-share"

## Mirrors and Reflector

alias "reflector-enable"="sudo systemctl enable reflector.service"
alias "reflector-disable"="sudo systemctl disable reflector.service"

alias "mirrors-bak"="sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak"
alias "mirrors-restore"="sudo cp /etc/pacman.d/mirrorlist.bak /etc/pacman.d/mirrorlist"

mirrors() {
	local count
	local country
	local backup
	local target

	read -rp "Save current mirrorlist as a backup? [Y/n]" backup

	if [[ -z "$backup" || "$backup" =~ ^[Yy]$ ]]; then
    	echo "Copying mirrorlist to /etc/pacman.d/mirrorlist.bak... "
    	mirrors-bak
  	else
    	echo "Mirrors will be overwritten... "
  	fi

	read -rp "How many mirrors? [30] " count
	count="${count:-30}"

	read -rp "Which country? [United States] " country
	country="${country:-United States}"

	read -rp "Save to: _____ ? [/etc/pacman.d/mirrorlist] " target
	target="${target:-/etc/pacman.d/mirrorlist}"

	sudo reflector \
		--verbose \
		--sort rate \
		-l "$count" \
		-c "$country" \
		-p https \
		--save "$target"
}

## Grub / mkinitcpio

alias "grub-update"="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias "mkinit"="sudo mkinitcpio -P"

## System

alias "session"="echo $XDG_SESSION_TYPE"
#alias "os-age"="head -n1 /var/log/pacman.log"

## Reference

alias "notes"="cat ~/.arch-notes"

## REMINDER ##

reminder () {
  	local reminders=(
    	"Intelligence is that which enables the arrival at more correct conclusions, and the finding of more winning strategies"
   		"Empathy is to treat others the way you want to be treated"
   		"Sympathy is to treat others the way theyd want to be treated"
    	"0th Degree Abstraction: focus on immediate concrete and tangible details as situations. Spontaneous, visceral, present."
    	"1st Degree Abstraction: focus on state changes between discrete situations. Procedural, stepwise, causal."
    	"2nd Degree Abstraction: focus on interactions between processes, inputs, mechanics. Systematic, dynamic, observant of nuance."
   		"3rd Degree Abstraction: focus on generalized similarities between systems. Associative, values framing and analogy"
    	"4th Degree Abstraction: focus on essential principles that span domains. Symbolic, values compression and elegance"
    	"Justice focuses on preserving and maintaining that which is rightful. Law focuses on compliance with statute."
    	"Good and Evil, and Law and Chaos, are two separate axes. Lawful Evil is a possible permutation."
    	"Question everything! Ideas worth believing meet their burden of proof."
    )

    printf '%s\n' "${reminders[RANDOM % ${reminders[@]}]}"
}

## HEADER ##

header() {
  fastfetch
  reminder
#  pacvs
}

header

## == FINISH == ##
