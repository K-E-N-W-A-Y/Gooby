#!/bin/bash

MENU="Check Environment"

source $CONFIGS/Docker/.env

clear
echo "Fetching your settings..."

# Menu Options

QUIT(){
	exit
}

# Display menu

show_menus() {
	clear
	echo " ${LBLUE}"
	MENUSTART
	docker ps --format "{{.Status}}: ${LBLUE}{{.Names}}${STD}"
	echo
	echo " ${WHITE}Z${STD} - EXIT to Main Menu"
	echo " ${LBLUE}"
	MENUEND
}

# Read Choices

read_options(){
	local choice
	read -n 1 -s -r -p "Choose option: " choice
	case $choice in
		[Zz]) QUIT ;;
		*) echo "${LRED}Please select a valid option${STD}" && sleep 2
	esac
}

MENUFINALIZE
