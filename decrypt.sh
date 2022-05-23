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
gpg -d -r "$usermail" --batch --passphrase-fd 0 ~/.config/safessh/servid.json.gpg >> ~/.config/safessh/servid.json
echo -e "\n${green}Credentials Successfully Decrypted${reset}\n"

rm ~/.config/safessh/servid.json.gpg
