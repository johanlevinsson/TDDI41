#!/bin/bash

# ID:
# Purpose:
# Preconditions

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

exec 3>&1 4>&2 1>"name_resolution-$HOSTNAME.log" 2>&1
exec 1>&3 2>&4

touch /home/memer10/hej.txt

echo >&2


# Expected results:
