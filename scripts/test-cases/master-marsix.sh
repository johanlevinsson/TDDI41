#!/bin/bash

# ID: 1
# Purpose: Call all the test cases from the marsix
# Preconditions: SSH keys setup for all machines and up to date git repo

# Procedure:
#fail_string="[\e[1m\e[31mFAIL\e[0m]"


function print_test {
    TEST_NAME=$1
    RESULT=$2    
    padlength=40
    pad=$(printf '%0.1s' "-"{1..60})
    if [ "$RESULT" == "okey" ]; then
        printf '%s' "$TEST_NAME"
        printf '%*.*s' 0 $((padlength - ${#TEST_NAME} )) "$pad"
        printf "[\e[1m\e[92mOK\e[0m]\n"  
    else
        printf '%s' "$TEST_NAME"ss
        printf '%*.*s' 0 $((padlength - ${#TEST_NAME} )) "$pad"
        printf "[\e[1m\e[31mFAIL\e[0m]\n"
    fi
}

printf "runnig local scripts on marsix \n"
source ./dns-non-recursive.sh #2
source ./dns-recursive.sh #3
source ./dns-reverse.sh #4

printf "\n\nRunning remote tests on router: \n"
ssh root@gw.c4.sysinst.ida.liu.se 'bash -s' < ./master-router.sh #5

printf "\n\nRunning remote tests on server: \n"
ssh root@server.c4.sysinst.ida.liu.se 'bash -s' < ./master-server.sh #6

printf "\n\nRunning remote tests on client-1 \n"
ssh root@client-1.c4.sysinst.ida.liu.se 'bash -s' < ./master-client.sh #7

printf "\n\nRunning remote tests on client-2 \n"
ssh root@client-2.c4.sysinst.ida.liu.se 'bash -s' < ./master-client.sh #7


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
