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


#exec 3>&1 4>&2 1>"recursive-dns-$HOSTNAME.log" 2>&1
HOSTNAME=$(hostname)
QUERY=$(dig client-1.c4.sysinst.ida.liu.se @server.c4.sysinst.ida.liu.se | grep WARNING)
if [[ -z $QUERY ]] && [ "$HOSTNAME" == "marsix"] ; then
    TEST_RESULT=okey
    echo "Recursive OKEY: The server does not accept recursive queries from outside the network\n"
elif [[ -z $QUERY ]] && [ "$HOSTNAME" != "marsix"] ; then
    TEST_RESULT=fail
    echo "Recursive test FAIL: the server does not accept recursive queries from inside the network\n"
else
    TEST_RESULT=okey
    echo "Recursive queries okey"
fi

# exec 1>&3 2>&4
# echo >&2

print_test "Recursive DNS query" "$TEST_RESULT"

# Expected results:
