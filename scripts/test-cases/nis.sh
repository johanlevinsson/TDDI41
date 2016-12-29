#!/bin/bash

# ID:
# Purpose:
# Preconditions

# Procedure:



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

# exec 3>&1 4>&2 1>"nis-server-$HOSTNAME.log" 2>&1
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
    echo "nis server test okey"
fi


# exec 1>&3 2>&4
# echo >&2


print_test "Nis test" $TEST_RESULT
# TEST_NAME="NIS-SERVER"
# TEST_RESULT="Okey"

#     if [ $TEST_RESULT == "fail" ];
# 	printf '%s' "$TEST_NAME"
# 	printf '%*.*s' 0 $((padlength - ${#TEST_NAME} )) "$pad"
# 	printf "[\e[1m\e[31mFAIL\e[0m]\n"
#     else
# 	printf '%s' "$TEST_NAME"
# 	printf '%*.*s' 0 $((padlength - ${#TEST_NAME} )) "$pad"
# 	printf "[\e[1m\e[92mOK\e[0m]$okey_string\n"  

# Expected results:
