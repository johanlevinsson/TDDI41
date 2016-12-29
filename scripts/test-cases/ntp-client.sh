#!/bin/bash

# ID:
# Purpose:
# Preconditions

# Procedure:

# function print_test {
#     TEST_NAME=$1
#     RESULT=$2    
#     padlength=40
#     pad=$(printf '%0.1s' "-"{1..60})
#     if [ "$RESULT" == "okey" ]; then
#         printf '%s' "$TEST_NAME"
#         printf '%*.*s' 0 $((padlength - ${#TEST_NAME} )) "$pad"
#         printf "[\e[1m\e[92mOK\e[0m]"  
#     else
#         printf '%s' "$TEST_NAME"
#         printf '%*.*s' 0 $((padlength - ${#TEST_NAME} )) "$pad"
#         printf "[\e[1m\e[31mFAIL\e[0m]"
#     fi
# }

# exec 3>&1 4>&2 1>"ntp-client-$HOSTNAME.log" 2>&1

HOSTNAME=$(hostname)
QUERY=$(ntpq -p | grep gw)
if [[ -z $QUERY ]] ; then
    TEST_RESULT=fail
    echo "ntp-client on $HOSTNAME failed"

else
    TEST_RESULT=okey
    echo "ntp-client on $HOSTNAME okey"
fi
# exec 1>&3 2>&4
# echo >&2

print_test ntp-client $TEST_RESULT

# TEST_NAME="NTP-clientp"
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
