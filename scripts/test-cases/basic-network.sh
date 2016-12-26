#!/bin/bash

# ID:
# Purpose:
# Preconditions

# Procedure:
#!/bin/bash

## First Test HOSTNAME

# HOSTNAME=hostname

function print_test {

TEST_NAME=$1
TEST_RESULT=$2    
    padlength=40
    pad=$(printf '%0.1s' "-"{1..60})
    if [ $TEST_RESULT == "fail" ]; then
	printf '%s' "$TEST_NAME"
	printf '%*.*s' 0 $((padlength - ${#TEST_NAME} )) "$pad"
	printf "[\e[1m\e[31mFAIL\e[0m]\n"
    else
	printf '%s' "$TEST_NAME"
	printf '%*.*s' 0 $((padlength - ${#TEST_NAME} )) "$pad"
	printf "[\e[1m\e[92mOK\e[0m]$okey_string\n"  
    fi
}
print_test hostname okey

       
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
