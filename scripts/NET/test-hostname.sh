#!/bin/bash

if [ -z "$1" ] || [ ! -z "$2" ]; then
    "Usage $0 hostname"
    exit 1
fi

if [ "$HOSTNAME" = "$1" ]; then
    echo "Hostname: $HOSTNAME matches $1" 
else
    echo "ERROR $HOSTNAME does not match $1"
fi
