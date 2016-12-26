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
	printf "[\e[1m\e[92mOK\e[0m]\n"  
    else
	printf '%s' "$TEST_NAME"
	printf '%*.*s' 0 $((padlength - ${#TEST_NAME} )) "$pad"
	printf "[\e[1m\e[31mFAIL\e[0m]\n"
    fi
}


print_test dns okey

# TEST_NAME="DNS"
# TEST_RESULT="Okey"

#     if [ $TEST_RESULT == "fail" ];
# 	printf '%s' "$TEST_NAME"
# 	printf '%*.*s' 0 $((padlength - ${#TEST_NAME} )) "$pad"
# 	printf "[\e[1m\e[31mFAIL\e[0m]\n"
#     else
# 	printf '%s' "$TEST_NAME"
# 	printf '%*.*s' 0 $((padlength - ${#TEST_NAME} )) "$pad"
# 	printf "[\e[1m\e[92mOK\e[0m]$okey_string\n"  


# Expected results:
