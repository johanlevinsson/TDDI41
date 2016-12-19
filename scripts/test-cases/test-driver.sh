#!/bin/bash

# ID: 1
# Purpose: Call all the test cases from the server.
# Preconditions: SSH keys setup for all machines and up to date git repo

# Procedure:

echo "Test driver: \n"
echo "Testing client 1: \n"
ssh root@client-1.c4.sysinst.ida.liu.se
cd /root
touch new-file


# Expected results:

5BV7qyQ6
