#!/bin/bash
export red="\033[1;31m"
export green="\033[1;32m"
export yellow="\033[1;33m"
export blue="\033[1;34m"
export purple="\033[1;35m"
export cyan="\033[1;36m"
export grey="\033[0;37m"
export reset="\033[m"
usermail="$(cat ~/.config/safessh/.userid)"
trap "echo | gpg -e -r $usermail --batch --passphrase-fd 0 ~/.config/safessh/servid.json && rm ~/.config/safessh/servid.json && echo -e '${green}Credentials Successfully Re-Encrypted!! ${reset}${red}Exiting...${reset}\n'" EXIT

function menu() {
	source ~/.config/safessh/functions.sh

	echo -e "${blue}Select an option:${reset}

${purple}1.)${reset}${cyan} Connect To Server${reset}

${purple}2.)${reset}${cyan} List Servers${reset}

${purple}3.)${reset}${cyan} Add New Server${reset}

${purple}4.)${reset}${cyan} Delete Server${reset}

${purple}5.)${reset}${cyan} Exit${reset}
"
	read -n 1 -s firstab
	sleep 1
	case "$firstab" in
	"1")
		sshconnect
		;;
	"2")
		list
		;;
	"3")
		newserver
		;;
	"4")
		delete
		;;
	"5")
		exit
		;;
	"6")
		exit
		;;
	esac
}
