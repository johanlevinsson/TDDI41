#!/bin/bash

# ID:
# Purpose:
# Preconditions

# Procedure:
#!/bin/bash

# Test hostname and ip: compare hostname with ip

HOSTNAME=$(hostname)
echo $HOSTNAME
#exec 3>&1 4>&2 1>basic-network-$HOSTNAME.log 2>&1
IP_ADDRESS=$(ifconfig | awk '/inet addr/{print substr($2,6)}')
echo $IP_ADRESS
F
if [ IP_ADDRESS == "130.236.178.219" ]; then
    if [ HOSTNAME == "server" ]; then
	EXTERNAL_ADRESS=$(ifconfig | awk '/inet addr/{print substr($2,6)}')
	if [ EXTERNAL_ADDRESS == "130.236.178.25" ]; then
	    TEST_RESULT=okey
	else
	    TEST_result=fail
	fi
    elif [ IP_ADDRESS == "130.236.178.218" && HOSTNAME == "gw" ]; then
	TEST_RESULT=okey
    elif [ IP_ADDRESS == "130.236.178.220" && HOSTNAME == "client_1" ]; then
	TEST_RESULT=okey
    elif [ IP_ADDRESS == "130.236.178.221" && HOSTNAME == "client_2" ]; then
	TEST_RESULT=okey
    else
	TEST_RESULT=Fail
	printf "Hostname ip addres on $HOSTNAME failed due to hostname-ip missmatch\n"
    fi

fi
#exec 1>&3 2>&4
echo >&2 
print_test "Basic network" $TEST_RESULT

# Test name resolution ping www.google.se
#exec 3>&1 4>&2 1>"name_resolution-$HOSTNAME.log" 2>&1

PING=$(ping -c 1 -n www.google.se | grep '0% packet loss')
if [[ -z $PING ]] ; then
    TEST_RESULT=fail
else
    TEST_RESULT=okey
fi
#exec 1>&3 2>&4
echo >&2
print_test "Name resolution" $TEST_RESULT
echo "\n"
       
# if [ $HOSTNAME -eq "client-1" OR $HOSTNAME -eq "client-2" OR $HOSTNAME -eq "server" OR $HOSTNAME -eq "gw"  ] ; then
#     print_test "Testing hostname" okey
# else
#     print_test "Testing hostname" fail
# fi

# printf="Testing name resolution:\nping -c 1 -n www.google.se | grep '0% packet loss'\n"

# PING=$(ping -c 1 -n www.google.se | grep '0% packet loss')

# if [[ -z $PING ]] ; then
#     printf "ERROR ping -1 -n www.google.com failed" 
# else
#     printf "ping -1 -n www.google.com sucessful: name resolution okay\n"
# fi
 
# printf="Testing prefix accepting\nroute | grep eth1\n"

# PREFIXES=$(route | grep eth1)

# if [[ -z $PREFIXES ]]; then
#     printf "ERROR: no network prefixes found in routing table"
# else
#     printf "Network prefixes accepted:\n$PREFIXES"
# fi

# printf="Testing prefix distributionn\nroute | grep eth0 |  grep '*'\n"

# PREFIXES=$(route | grep eth0 |  grep '*')

# if [[ -z $PREFIXES ]]; then
#     printf "ERROR: network prefix not distributed\n"
# else
#     printf "Sucess:\n$PREFIXES "
# fi


# Expected results:
