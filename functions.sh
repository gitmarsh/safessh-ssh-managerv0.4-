#!/bin/bash



function newserver () {

echo "Enter in IP address:"

read -p $'\e[35mEnter server ip\e[0m: ' serverip
read -p  $'\e[34mEnter username\e[0m: ' user
read -p $'\e[36mEnter an  alias\e[0m: ' nickname

arr0="$(cat ~/.config/safessh/servid.json | jq .servers[] | grep id | tail -1 | awk -F ":" '{print $2}' | awk -F '"' '{print $2}')"
servid="$(($arr0 + 1))"
jq '.servers['"$arr0"'] |= .+ {"id":'\"$servid\"', "name":'\"$nickname\"', "ip":'\"$serverip\"', "user":'\"$user\"', "ssh":'\"$user@$serverip\"'}' ~/config/safessh/servid.json >> ~/.config/safessh/newservid.json &&
rm ~/.config/safessh/servid.json && mv ~/.config/safessh/newservid.json ~/.config/safessh/servid.json
echo -e "${green}New Entry Added!${reset}"
sleep 1 
echo""
source ~/.config/safessh/menu.sh
}
function sshconnect () {
echo -e "\n${cyan}Select a server:${reset}\n"
cat ~/.config/safessh/servid.json | jq .servers[].name | cat -n
read -r -n 1 -s answer

serverid="$( cat ~/.config/safessh/servid.json | jq .servers[].name | sed -n "$answer"p | awk '{print $1}' )"
sshid="$(cat ~/.config/safessh/servid.json | jq .servers["$answer - 1"].ssh | awk -F '"' '{print $2}')"

ssh $sshid
}
function delete () {

cat ./keymap -n


# echo -e "\n${cyan}Enter server name you wish to delete${reset}\n"
# read -n 1 -s answer2



#tempid="$( cat ./keymap | sed -n "$answer2"p | awk '{print $1}' )"
#serverid="$( cat ./keymap | grep -e "$tempid" | awk -F"=" '{print $2}' )"
#serverln=$( cat ./keymap | grep -en "$tempid" | awk -F"=" '{print $1}' )

#echo -e "${red}Are you sure you wish to delete this server from this list?${reset}: (y)Yes/(n)No"
#read -n 1 -s confirm
#if [ "$confirm" == "y" ]
#then

#rm ./ssh.conf.d/"$serverid".conf.gpg 
#sed -i "$answer2"d ./keymap

#echo "Server has been deleted: return to beginning?: (y)Yes/(n)Exit"
#read -n 1 -s response
#	if [ "$response" == "y" ]
#	then
#        sh ./safessh.sh
#	else
#		exit
#	fi
# else
#	exit
#fi



}
function list () {
cat ~/.config/safessh/servid.json | jq .servers[].name | cat -n
echo""
source ~/.config/safessh/menu.sh
}






