#!/bin/bash


source ~/.config/safesssh/functions.sh
usermail="$(cat .userid)"
gpg -d -r "$usermail" --batch --passphrase-fd 0 ~/.config/safessh/servid.json.gpg >> ~/.config/safessh/servid.json
rm ~/.config/safessh/servid.json.gpg
trap "gpg -e -r $usermail --batch --passphrase-fd 0 ~/.config/safessh/servid.json && rm ~/.config/safessh/servid.json" EXIT

###  START TITLE
echo  "############################################################################################"
echo  "######################### SSH QUICK CONNECT / SERVER ALIASING###############################"
function menu () { 
echo "Select an option:

1.) Connect To Server

2.) List Servers

3.) Add New Server

4.) Delete Server

5.) Exit
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
menu

