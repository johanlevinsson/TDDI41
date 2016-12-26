#!/bin/bash

# ID: 1
# Purpose: Test all aspects from marsix
# Preconditions
# Lab series completed

# Procedure:


# exec 3>&1 4>&2 1>"name_resolution-$HOSTNAME.log" 2>&1
# exec 1>&3 2>&4

# echo >&2
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
        printf '%s' "$TEST_NAME"
        printf '%*.*s' 0 $((padlength - ${#TEST_NAME} )) "$pad"
        printf "[\e[1m\e[31mFAIL\e[0m]\n"
    fi
}

source /root/TDDI41/scripts/test-cases/basic-network.sh
source /root/TDDI41/scripts/test-cases/nis.sh
source /root/TDDI41/scripts/test-cases/ntp-client.sh
source /root/TDDI41/scripts/test-cases/dns.sh
printf "Leaving server\n"


# Expected results:

# All tests [OK]
