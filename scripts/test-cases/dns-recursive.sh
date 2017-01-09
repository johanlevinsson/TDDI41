#!/bin/bash

# ID: 2
# Purpose: test to se that the dns server does not accepts recursive calls
# from outside the network

# Preconditions: Basic network routing and dns labs complete and ssh-keys setup

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

HOSTNAME=$(hostname)
QUERY=$(dig client-1.c4.sysinst.ida.liu.se @server.c4.sysinst.ida.liu.se | grep WARNING)
if [[ -z $QUERY ]] && [ "$HOSTNAME" == "marsix"] ; then
    TEST_RESULT=okey   
elif [[ -z $QUERY ]] && [ "$HOSTNAME" != "marsix"] ; then
    TEST_RESULT=fail
    echo "Recursive test FAIL: the server does not accept recursive queries from inside the network\n"
else
    TEST_RESULT=okey
    
fi

print_test "Recursive DNS query" "$TEST_RESULT"
printf "\n"
# Expected results: all green okeys
