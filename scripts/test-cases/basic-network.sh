#!/bin/bash

# ID: 2
# Purpose: Test basic network configuration and name resolution
# Preconditions:
# First part of net lab completed


# Procedure:
#!/bin/bash


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


# Test hostname and ip: compare hostname with ip

HOSTNAME=$(hostname)

exec 3>&1 4>&2 1>"basic-network-$HOSTNAME.log" 2>&1
IP_ADRESS=$(ifconfig eth0 | awk '/inet addr/{print substr($2,6)}')
echo "#$IP_ADRESS#"

if [ "$IP_ADRESS" == "130.236.178.218" ] && [ "$HOSTNAME" == "gw" ]; then
    EXTERNAL_ADRESS=$(ifconfig eth1 | awk '/inet addr/{print substr($2,6)}')
    echo "#$EXTERNAL_ADRESS#"
    if [ "$EXTERNAL_ADRESS" == "130.236.178.25" ]; then
	echo "Basic network connectivity on $HOSTNAME correct\n"
	echo "eth0 ip: $IP_ADRESS eth1 ip: $EXTERNAL_IP hostname: $HOSTNAME\n"
	TEST_RESULT=okey
    else
	TEST_result=fail
    fi
    
else
    if [ "$IP_ADRESS" == "130.236.178.219" ] && [ "$HOSTNAME" == "server" ]; then
	TEST_RESULT=okey
	echo "Basic network connectivity on $HOSTNAME correct\n"
	echo "eth0 ip: $IP_ADRESS hostname: $HOSTNAME\n"
    elif [ "$IP_ADRESS" == "130.236.178.220" ] && [ "$HOSTNAME" == "client_1" ]; then
	TEST_RESULT=okey
	echo "Basic network connectivity on $HOSTNAME correct\n"
	echo "eth0 ip: $IP_ADRESS hostname: $HOSTNAME\n"
    elif [ "$IP_ADRESS" == "130.236.178.221" ] && [ "$HOSTNAME" == "client_2" ]; then
	TEST_RESULT=okey
	echo "Basic network connectivity on $HOSTNAME correct\n"
	echo "eth0 ip: $IP_ADRESS hostname: $HOSTNAME\n"
    else
	TEST_RESULT=fail
	echo "Hostname ip addres on $HOSTNAME failed due to hostname-ip missmatch\n"
	echo "eth0 ip: $IP_ADRESS hostname: $HOSTNAME\n"
	
    fi
fi

exec 1>&3 2>&4
echo >&2 
#echo $TEST_RESULT
print_test "Hostname- and ip-configuration" $TEST_RESULT

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
       
touch /home/memer10/$HOSTNAME

# Expected results:

# all [OK]
