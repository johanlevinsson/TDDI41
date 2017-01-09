#!/bin/bash

# ID: 11
# Purpose: test that ntp clients and server works
# Preconditions ntp lab and prerequisites

# Procedure:

HOSTNAME=$(hostname)
QUERY=$(ntpq -p | grep gw)
if [[ -z $QUERY ]] ; then
    TEST_RESULT=fail
    echo "ntp-client on $HOSTNAME failed"

else
    TEST_RESULT=okey
fi

print_test ntp-client $TEST_RESULT
printf "\n"
# Expected results:
