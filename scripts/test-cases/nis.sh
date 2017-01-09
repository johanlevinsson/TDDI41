#!/bin/bash

# ID: 11
# Purpose: test that the nis system works
# Preconditions: nis lab 

# Procedure:

NISPASSWD=$(ypcat passwd)
NISMASTER=$(ypcat auto.master)
NISHOME=$(ypcat auto.home)

if [[ -z $NISMASTER ]]; then
    TEST_RESULT=fail
    echo "nis server test failed auto.master is not filled with data"

elif [[ -z $NISHOME ]];  then
    TEST_RESULT=fail
    echo "nis server test failed auto.HOME not filled with data" 

elif [[ -z $NISPASSWD ]]; then
    TEST_RESULT=fail
    echo "nis server test failed passwd not filled with data"
else
    TEST_RESULT=okey
fi

print_test "Nis test" $TEST_RESULT
printf "\n"

# Expected results:
