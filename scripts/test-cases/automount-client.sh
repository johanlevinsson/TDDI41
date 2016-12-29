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

HOSTNAME=$(hostname)
#exec 3>&1 4>&2 1>"automount-$HOSTNAME.log" 2>&1
#exec 1>&3 2>&4


#echo >&2

FILE=$(openssl rand -base64 8)
echo "copying random generated file client-1$FILE client-2$FILE to clients\n"
ssh memer10@client-1.c4.sysinst.ida.liu.se 'touch client-1$FILE'
ssh memer10@client-2.c4.sysinst.ida.liu.se 'touch client-2$FILE'

LSRESULT=$(ls /home.1/memer10 | grep $FILE)
ls /home.1/memer10 | grep $FILE
LINE_NO=$(ls /home.1/memer10/ | grep "$FILE" | wc -l)
if [ "$LINE_NO" == "2" ]; then
    TEST_RESULT=okey
else
    TEST_RESULT=fail
fi

print_test "automount test" "$TEST_RESULT"
# Expected results:
