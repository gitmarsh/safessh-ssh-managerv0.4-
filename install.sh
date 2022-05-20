#!/bin/bash

echo "SafeSSH uses gpg to encrypt the your servers login credentials.\n
This program uses an email address to identity the user accessing encrypted data\n
Provide and email address to be used as a user"
read emailid
echo $emailid > ~/.config/safessh/.userid
gpg -e -r "$emailid" --batch --passphrase-fd 0 ~/.config/safessh/servid.json
rm ~/.config/safessh/servid.json
sed -i '2d' ~/.config/safessh/init.sh
rm ~/.config/safessh/install.sh
