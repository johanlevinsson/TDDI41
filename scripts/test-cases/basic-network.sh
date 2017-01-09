#!/bin/bash

# ID: 9
# Purpose: Test basic network configuration and name resolution
# Preconditions:
# First part of net lab completed
# Procedure:

# Test hostname and ip: compare hostname with ip

HOSTNAME=$(hostname)

IP_ADRESS=$(ifconfig eth0 | awk '/inet addr/{print substr($2,6)}')

if [ "$IP_ADRESS" == "130.236.178.218" ] && [ "$HOSTNAME" == "gw" ]; then
    EXTERNAL_ADRESS=$(ifconfig eth1 | awk '/inet addr/{print substr($2,6)}')
    if [ "$EXTERNAL_ADRESS" == "130.236.178.25" ]; then
	TEST_RESULT=okey
    else
	TEST_result=fail
    fi
    
else
    if [ "$IP_ADRESS" == "130.236.178.219" ] && [ "$HOSTNAME" == "server" ]; then
	TEST_RESULT=okey
    elif [ "$IP_ADRESS" == "130.236.178.220" ] && [ "$HOSTNAME" == "client-1" ]; then
	TEST_RESULT=okey
    elif [ "$IP_ADRESS" == "130.236.178.221" ] && [ "$HOSTNAME" == "client-2" ]; then
	TEST_RESULT=okey
    else
	TEST_RESULT=fail
	echo "Hostname ip addres on $HOSTNAME failed due to hostname-ip missmatch\n"
	echo "eth0 ip: $IP_ADRESS hostname: $HOSTNAME\n"
	
    fi
fi

print_test "Hostname- and ip-configuration" $TEST_RESULT
printf "\n"
# Test name resolution ping www.google.se

exec 3>&1 4>&2 1>"basic-network-$HOSTNAME.log" 2>&1
PING=$(ping -c 1 -n www.google.se | grep '0% packet loss')
if [[ -z $PING ]] ; then
    TEST_RESULT=fail
    echo "Ping -c 1 www.google.com resulted in a non 0% package loss"

else
    TEST_RESULT=okey
fi
exec 1>&3 2>&4
echo >&2
print_test "Name resolution" "$TEST_RESULT"
printf "\n"
# Expected results:

# all [OK]
