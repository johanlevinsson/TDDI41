#!/bin/sh

# ID:
# Purpose:
# Preconditions

# Procedure:

TEST_NAME="DNS"
TEST_RESULT="Okey"

    if [ $TEST_RESULT == "fail" ];
	printf '%s' "$TEST_NAME"
	printf '%*.*s' 0 $((padlength - ${#TEST_NAME} )) "$pad"
	printf "[\e[1m\e[31mFAIL\e[0m]\n"
    else
	printf '%s' "$TEST_NAME"
	printf '%*.*s' 0 $((padlength - ${#TEST_NAME} )) "$pad"
	printf "[\e[1m\e[92mOK\e[0m]$okey_string\n"  


# Expected results:
