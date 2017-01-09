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

#exec 3>&1 4>&2 1>"dns-reverse-$HOSTNAME.log" 2>&1

CLIENT1=$(dig -x 130.236.178.220 +short)
CLIENT2=$(dig -x 130.236.178.221 +short)
SERVER=$(dig -x 130.236.178.219 +short)
ROUTER=$(dig -x 130.236.178.218 +short)

if [ "$CLIENT1" == "220.216/29.178.236.130.in-addr.arpa." ]; then
    CLIENT1=okey
fi

if [ "$CLIENT2" == "221.216/29.178.236.130.in-addr.arpa." ]; then
    CLIENT2=okey
fi

if [ "$SERVER" == "219.216/29.178.236.130.in-addr.arpa." ]; then
    SERVER=okey
fi
if [ "$ROUTER" == "218.216/29.178.236.130.in-addr.arpa." ]; then
    ROUTER=okey
fi
    
# exec 1>&3 2>&4
# echo >&2

print_test "Reverse DNS gw" "$ROUTER"
printf "\n\n"
print_test "Reverse DNS server" "$SERVER"
printf "\n"
print_test "Reverse DNS client-1" "$CLIENT1"
printf "\n"
print_test "Reverse DNS client-2" "$CLIENT2"
printf "\n"
# Expected results:
