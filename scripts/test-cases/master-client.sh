#!/bin/bash

# ID: 7
# Purpose: run all tests on client 1 and 2
# Preconditions
# Lab series completed ssh keys set up

# Procedure:

function print_test {
    TEST_NAME=$1
    RESULT=$2    
    padlength=40
    pad=$(printf '%0.1s' "-"{1..60})
    if [ "$RESULT" == "okey" ]; then
        printf '%s' "$TEST_NAME"
        printf '%*.*s' 0 $((padlength - ${#TEST_NAME} )) "$pad"
        printf "[\e[1m\e[92mOK\e[0m]"  
    else
        printf '%s' "$TEST_NAME"
        printf '%*.*s' 0 $((padlength - ${#TEST_NAME} )) "$pad"
        printf "[\e[1m\e[31mFAIL\e[0m]"
    fi
}

source /root/TDDI41/scripts/test-cases/basic-network.sh
source /root/TDDI41/scripts/test-cases/ntp-client.sh
source /root/TDDI41/scripts/test-cases/nis.sh

# Expected results:

# All tests [OK]
