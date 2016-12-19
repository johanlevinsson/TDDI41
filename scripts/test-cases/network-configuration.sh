#!/bin/bash

# ID:
# Purpose:
# Preconditions

# Procedure:
#!/bin/bash

printf="Testing name resolution:\nping -c 1 -n www.google.se | grep '0% packet loss'\n"

PING=$(ping -c 1 -n www.google.se | grep '0% packet loss')

if [[ -z $PING ]] ; then
    printf "ERROR ping -1 -n www.google.com failed" 
else
    printf "ping -1 -n www.google.com sucessful: name resolution okay\n"
fi

printf="Testing prefix accepting\nroute | grep eth1\n"

PREFIXES=$(route | grep eth1)

if [[ -z $PREFIXES ]]; then
    printf "ERROR: no network prefixes found in routing table"
else
    printf "Network prefixes accepted:\n$PREFIXES"
fi

printf="Testing prefix distributionn\nroute | grep eth0 |  grep '*'\n"

PREFIXES=$(route | grep eth0 |  grep '*')

if [[ -z $PREFIXES ]]; then
    printf "ERROR: network prefix not distributed\n"
else
    printf "Sucess:\n$PREFIXES "
fi


# Expected results:
