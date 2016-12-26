#!/bin/bash

# ID: 1
# Purpose: Call all the test cases from the server.
# Preconditions: SSH keys setup for all machines and up to date git repo

# Procedure:
#fail_string="[\e[1m\e[31mFAIL\e[0m]"

function print_test {
    pad=$(printf '%0.1s' "-"{1..60})
    padlength=40
    fail_string="[\e[1m\e[31mFAIL\e[0m]"
    okey_string="[\e[1m\e[92mOK\e[0m]"
    if [ $2 == "fail" ]; then
	printf '%s' "$1"
	printf '%*.*s' 0 $((padlength - ${#1} )) "$pad"
	printf "$fail_string\n"
    else
	printf '%s' "$1"
	printf '%*.*s' 0 $((padlength - ${#1} )) "$pad"
	printf "$okey_string\n"       
fi
    
}

printf "Running remote tests on router: \n"
ssh root@gw.c4.sysinst.ida.liu.se 'bash -s' < /root/TDDI41/scripts/test-cases/master-router.sh


printf "Running remote tests on server: \n"
ssh root@server.c4.sysinst.ida.liu.se 'bash -s' < ./master-server.sh

# printf "Running remote tests on client 1: \n"
# ssh root@client-1.c4.sysinst.ida.liu.se 'bash -s' < /root/TDDI41/scripts/test-cases/master-client.sh

# printf "Running remote tests on client 2: \n"
# ssh root@client-2.c4.sysinst.ida.liu.se 'bash -s' < /root/TDDI41/scripts/test-cases/master-client.sh

# echo "Test driver: \n"
# echo "Testing client 1: \n"
# ssh root@client-1.c4.sysinst.ida.liu.se
# cd /root
# touch new-file


# # Expected results:

# 5BV7qyQ6
