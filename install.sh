#!/bin/bash

echo "SafeSSH uses gpg to encrypt the your servers login credentials.\n
This program uses an email address to identity the user accessing encrypted data\n
Provide and email address to be used as a user"
read emailid
echo $emailid > .userid
gpg -e -r "$emailid" --batch --passphrase-fd 0 servid.json
rm servid.json
sed -i '2d' init.sh
rm install.sh
