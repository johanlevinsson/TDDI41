#!/bin/bash

# ID: 4
# Purpose: tests that reverse queries from outside the network works
# Preconditions: basic network, routing and dns and ssh-keys set up

# Procedure:

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

print_test "Reverse DNS gw" "$ROUTER"
printf "\n"
print_test "Reverse DNS server" "$SERVER"
printf "\n"
print_test "Reverse DNS client-1" "$CLIENT1"
printf "\n"
print_test "Reverse DNS client-2" "$CLIENT2"
printf "\n"
# Expected results:
