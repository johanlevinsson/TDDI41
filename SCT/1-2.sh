#!/bin/bash


function quotestar () {
    for i in "$*"
    do 
    echo $i 
    done
}

function quoteat () {
    for j in "$@"
    do 
    echo $j 
    done
}

function star () {
    for i in $*
    do 
    echo $i 
    done
}

function at () {
    for j in $@
    do 
    echo $j 
    done
}

echo "test för \"\$@\" "
quotestar "a b " "2-2"


echo "test för \"\$*\" "
quoteat "a b " "2-2"

echo "test för \$@ "
star "a b " "2-2"


echo "test för \$* "
at "a b " "2-2"
