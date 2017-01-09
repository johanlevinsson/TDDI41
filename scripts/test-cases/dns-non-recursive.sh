#!/bin/bash

# ID: 2
# Purpose: Test to se that the dns server accepts non recursive calls from
# outside the network
# Preconditions: basic network routing and dns lab finished and ssh keys set up 

CLIENT1=$(dig +short client-1.c4.sysinst.ida.liu.se @server.c4.sysinst.ida.liu.se)
CLIENT2=$(dig +short client-2.c4.sysinst.ida.liu.se @server.c4.sysinst.ida.liu.se)
SERVER=$(dig +short server.c4.sysinst.ida.liu.se @server.c4.sysinst.ida.liu.se)
ROUTER=$(dig +short gw.c4.sysinst.ida.liu.se @server.c4.sysinst.ida.liu.se)

if [ "$CLIENT1" == "130.236.178.220" ]; then
    CLIENT1=okey
fi

if [ "$CLIENT2" == "130.236.178.221" ]; then
    CLIENT2=okey
fi

if [ "$SERVER" == "130.236.178.219" ]; then
    SERVER=okey
fi
if [ "$ROUTER" == "130.236.178.218" ]; then
    ROUTER=okey
fi
    
# exec 1>&3 2>&4
# echo >&2

print_test "Non recursive DNS gw" "$ROUTER"
#printf "\n" 
print_test "Non recursive DNS server" "$SERVER"
#printf "\n"
print_test "Non recursive DNS client-1" "$CLIENT1"
#printf "\n"
print_test "Non recursive DNS client-2" "$CLIENT2"
#printf "\n"
# Expected results: all green okeys
