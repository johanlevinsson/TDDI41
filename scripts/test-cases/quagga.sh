#!/bin/bash

# ID: 10
# Purpose: test routing with quagga
# Preconditions:
# The whole net lab completed

# Procedure:

PREFIXES=$(route | grep ida-gw.sysinst)
if [[ -z $PREFIXES ]]; then
    echo "ERROR: no network prefixes found in routing table"
    TEST_RESULT=fail
else
    TEST_RESULT=okey
fi

print_test "Network Prefixes" $TEST_RESULT
printf "\n"

# Expected results:
