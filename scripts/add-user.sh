#!/bin/bash

# Script that:

# 1.Calculate a unique username for the user

# 2.Add the user to the system

# 3.Generate a random password for the user

# 4. Create the user's home directory and copy standard files to it.

# 5. Configure any services that need to be configured

# 6. Output the username and password on a single line

USER_NUM=$(cut -d: -f1 /etc/passwd | grep memer | tail -1 | tr -cd '[[:digit:]]')
printf $USER_NUM

if [ -z "$USER_NUM" ]; then
    printf "adding user memer\n";
    useradd memer1;
else
    printf "User exists"
    exit
fi

# Calculate username and create user
NEXT_USER=$((USER_NUM + 1))
NEW_USER="memer$NEXT_USER"
adduser --home /home.1/$NEW_USER $NEW_USER

# Generate and set password
PASSWORD=$(openssl rand -base64 8)
passwd $NEW_USER $PASSWORD

# Add home-folder to autofs
echo "memeboy -fstype=nfs,vers=3 server.c4.sysinst.ida.liu.se:/home.1/&" >> /etc/auto.home

#Update nis maps
make -C /var/yp/

#Print info
printf "User $NEW_USER added with password: $PASSWORD"

mkdir ~/$NEW_USER



