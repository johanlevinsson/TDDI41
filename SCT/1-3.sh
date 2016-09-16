#!/bin/bash

function looper() {
while [ $1 != "end" ]
do
    echo $1
    shift
done
}

x=1
looper "5" "4" "3" "end"
