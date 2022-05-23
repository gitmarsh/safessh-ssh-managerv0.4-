#!/bin/bash
trap "echo -e '${cyan}Press Enter to Re-Encrypt SSH Credentials${reset}' && gpg -e -r $usermail --batch --passphrase-fd 0 ~/.config/safessh/servid.json && rm ~/.config/safessh/servid.json" EXIT

function menu () {
source ./functions.sh

echo -e "${cyan}Select an option:${reset}

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
sshconnect  ;;
"2")
list        ;;
"3")
newserver   ;;
"4")
delete      ;;
"5")
exit        ;;
"6")
exit        ;;
esac
}
