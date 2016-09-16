#!/bin/bash


function star () {
    for i in "$*"
    do 
    echo $i 
    done
}

function at () {
    for j in "$@"
    do 
    echo $j 
    done
}

function star2 () {
    for i in $*
    do 
    echo $i 
    done
}

function at2 () {
    for j in $@
    do 
    echo $j 
    done
}

echo "test för \"\$@\" "
star " ab c " " b " " c "


echo "test för \"\$*\" "
at " a " " b " " c "

echo "test för \$@ "
star2 " ab c " " b " " c "


echo "test för \$* "
at2 " a " " b " " c "
