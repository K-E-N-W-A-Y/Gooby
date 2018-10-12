#!/bin/bash

MENU="Maintain Server"
source /opt/GooPlex/menus/variables.sh

# Menu Options

DOMAIN(){
	PERFORM="manage"
	TASK="URL"
	source /opt/GooPlex/install/server/${TASK}-${PERFORM}.sh
}

EMAILADDR(){
	PERFORM="manage"
	TASK="Email"
	source /opt/GooPlex/install/server/${TASK}-${PERFORM}.sh
}

PATCHES(){
	PERFORM="apply"
	TASK="patches"
	
}

UPGRADE(){
	PERFORM="upgrade"
	TASK="version"
	source /opt/GooPlex/install/server/${TASK}-${PERFORM}.sh
}

QUIT(){
	exit
}

# Display menu

show_menus() {
	clear
	echo " ${YELLOW}"
	MENUSTART
	echo " ${YELLOW}A${STD} - Manage Domain Name"
	echo " ${YELLOW}B${STD} - Manage Email Address"
	echo " ${YELLOW}C${STD} - Update Server with Latest Patches"
	echo " ${YELLOW}D${STD} - Server Upgrade - Danger zone!"
	echo " ${WHITE}Z${STD} - EXIT to Main Menu"
	echo " ${YELLOW}"
	MENUEND
}

# Read Choices

read_options(){
	local choice
	read -n 1 -s -r -p "Choose option: " choice
	case $choice in
		[Aa]) DOMAIN ;;
		[Aa]) EMAILADDR ;;
		[Bb]) PATCHES ;;
		[Cc]) UPGRADE ;;
		[Zz]) QUIT ;;
		*) echo "${LRED}Please select a valid option${STD}" && sleep 2
	esac
}

MENUFINALIZE
