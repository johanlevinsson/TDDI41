#!/bin/bash

# ID:
# Purpose:
# Preconditions

# Procedure:

function print_test {

TEST_NAME=$1
TEST_RESULT=$2    
    padlength=40
    pad=$(printf '%0.1s' "-"{1..60})
    if [ $TEST_RESULT == "fail" ]; then
	printf '%s' "$TEST_NAME"
	printf '%*.*s' 0 $((padlength - ${#TEST_NAME} )) "$pad"
	printf "[\e[1m\e[31mFAIL\e[0m]\n"
    else
	printf '%s' "$TEST_NAME"
	printf '%*.*s' 0 $((padlength - ${#TEST_NAME} )) "$pad"
	printf "[\e[1m\e[92mOK\e[0m]$okey_string\n"  
    fi
}

source /root/TDDI41/scripts/test-cases/basic-network.sh
source /root/TDDI41/scripts/test-cases/dns.sh
source /root/TDDI41/scripts/test-cases/nis-server.sh
source /root/TDDI41/scripts/test-cases/ntp-client.sh

# Expected results:
