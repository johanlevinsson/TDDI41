#!/bin/bash

# Script that:

# 1.Calculate a unique username for the user

# 2.Add the user to the system

# 3.Generate a random password for the user

# 4. Create the user's home directory and copy standard files to it.

# 5. Configure any services that need to be configured

# 6. Output the username and password on a single line

USER_NUM=$(cut -d: -f1 /etc/passwd | grep memer | tail -1 | tr -cd '[[:digit:]]')
echo $USER_NUM

if [ -z "$USER_NUM" ]; then
    NEXT_USER="memer1"
else
    NEXT_USER=$((USER_NUM + 1))
    NEW_USER="memer$NEXT_USER"
fi

# Calculate username and create user

adduser --home /home.1/$NEW_USER --disabled-password --gecos "" $NEW_USER
#NEW_USER="MEMER7"
usermod -d /home/$NEW_USER $NEW_USER
# Generate and set password
if [ "$1" == "-no-password" ]; then
    PASSWORD="empty"
else
    
    echo "$:NEW_USER:$PASSWD" | chpasswd
fi
    
# Add home-folder to autofs
#echo "$NEW_USER -fstype=nfs,vers=3 server.c4.sysinst.ida.liu.se:/home.1/&" >> /etc/auto.home

#Update nis maps
#make -C /var/yp/

#Print info
echo "Added User: "
echo "$NEW_USER "
echo "$PASSWORD"





