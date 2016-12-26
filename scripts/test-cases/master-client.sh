#!/bin/bash

# ID: 1
# Purpose: Test all aspects from marsix
# Preconditions
# Lab series completed

# Procedure:


# exec 3>&1 4>&2 1>"name_resolution-$HOSTNAME.log" 2>&1
# exec 1>&3 2>&4
# echo >&2

source /root/TDDI41/scripts/test-cases/basic-network.sh
source /root/TDDI41/scripts/test-cases/ntp-client.sh
source /root/TDDI41/scripts/test-cases/nis.sh
source /root/TDDI41/scripts/test-cases/automount-client.sh
printf "Leaving server\n"


# Expected results:

# All tests [OK]
