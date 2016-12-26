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

exec 3>&1 4>&2 1>"dns-non-recursive-$HOSTNAME.log" 2>&1

CLIENT1=$(dig +short client-1.c4.sysinst.ida.liu.se @server.c4.sysinst.ida.liu.se)
CLIENT2=$(dig +short client-2.c4.sysinst.ida.liu.se @server.c4.sysinst.ida.liu.se)
SERVER=$(dig +short server.c4.sysinst.ida.liu.se @server.c4.sysinst.ida.liu.se)
ROUTER=$(dig +short gw.c4.sysinst.ida.liu.se @server.c4.sysinst.ida.liu.se)

if [ "$CLIENT1" == "130.236.178.220" ]; then
    CLIENT1=okey
    echo "Non recursive query client-1 okey"
fi

if [ "$CLIENT2" == "130.236.178.221" ]; then
    CLIENT1=okey
    echo "Non recursive query client-2 okey"
fi

if [ "$SERVER" == "130.236.178.219" ]; then
    CLIENT1=okey
    echo "Non recursive query server okey"
fi
if [ "$ROUTER" == "130.236.178.218" ]; then
    ROUTER=okey
    echo "Non recursive query gw okey"
fi
    
exec 1>&3 2>&4
echo >&2

print_test "Non recursive DNS gw" "$ROUTER"
print_test "Non recursive DNS server" "$SERVER"
print_test "Non recursive DNS client-1" "$CLIENT1"
print_test "Non recursive DNS client-2" "$CLIENT2"

# Expected results:
