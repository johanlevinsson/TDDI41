#!/bin/bash

# ID: 3
# Purpose: test routing with quagga
# Preconditions:
# The whole net lab completed

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


exec 3>&1 4>&2 1>"quagga-$HOSTNAME.log" 2>&1

PREFIXES=$(route | grep ida-gw.sysinst)
printf "Testing that the router is destributing prefixes\n"
if [[ -z $PREFIXES ]]; then
    printf "ERROR: no network prefixes found in routing table"
    TEST_RESULT=fail
else
    printf "Network prefixes accepted:\n$PREFIXES"
    TEST_RESULT=okey
fi
exec 1>&3 2>&4
echo >&2

print_test "Network Prefixes" $TEST_RESULT


# Expected results: