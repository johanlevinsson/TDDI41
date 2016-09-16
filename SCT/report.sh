#uppgift  1-1 Skillnaden på $@ och $* för att skicka vidare samtliga parametrar. 

#"$@" vecklas ut till en enda sträng
#"$*" vecklas ut till en sträng per parameter

#1-1.sh 


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

echo "test för \$@ "
star "a " "b " "c "


echo "test för \$* "
at "a " "b " "c "


# Testkörning: 

# johle727@li0-1:tddi41$ ./1-1.sh 
# test för $@ 
# a b c
# test för $* 
# a
# b
# c


# 2-1 Att inte använda citationstecken delar upp parametrar som innehåller blanksteg


# 	1-2.sh



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

# Testkörning:

# johle727@li0-1:tddi41$ ./1-2.sh 
# test för "$@" 
# a b 2-2
# test för "$*" 
# a b
# 2-2
# test för $@ 
# a
# b
# 2-2
# test för $* 
# a
# b
# 2-2

# 2-2

# Femte raden nedifrån, cp "$file" "$TMPDIR" körs nu en gång för hela filnamnet. Att byta "$@" mot "$*" i
# loopvillkoret får denna raden att köras en gång per blankstegskilt "ord" i filnamnet, och då skapa en fil
# 	per ord. Svaret är alltså nej. 



# 3-1

# While loops fungerar genom att ett uttryck körs så länge som ett villkor stämmer snarare än ett fixt antal
#gånger




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


# Testkörning:

# johle727@li0-1:tddi41$ ./3-1.sh 
# 5
# 4
# 3

# 5-1 ${line:0:1} expanderar parametern line, till 1 tecken, och börjar på plats 0 i line. dvs returnerar första tecknet i line. 
# 5-2 : ensamt på en rad betraktas som en "do nothing" handling
# 5-3 `command` är utbytbart med $(command). det sistnämnda är nyare och betraktas som standard. 
# 5-4 $((...)) $() anger ett kommando, () anger returvärdet för det uttryck som skrivs innanför paranteserna. med andra ord körs returvärdet för för uttrycket som ett kommando. 
# 5-5 

ls -a | grep "^\." | wc -l
ls -a | grep -c "^\."

# 6-1 	a) \ vid radslut konkatinerar nästkommanda rad till denna rad. 
#     	b) måsvingarna betyder att koden körs i samma shell. hade måsvingarna varit paranteser så hade de två kodraderna exekverats i ett subshell. exit 1 hade avslutat subshell:et och vi hade fortsatt exekvera det shell vi är vi, vilket vi inte vill. 
# 6-2 local specifierar en lokal variable som enbart är synlig i kodblocket. 
# 6-3 Sleep 1 är till för att man skall hinna läsa vad som skrivs ut innan socat anropas. 


